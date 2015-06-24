package com.ecrm.Controller;

import com.ecrm.DAO.Impl.*;
import com.ecrm.DTO.DamagedRoomDTO;
import com.ecrm.DTO.GroupReportsDTO;
import com.ecrm.DTO.ReportResponseObject;
import com.ecrm.Entity.*;
import com.ecrm.Utils.Enumerable;
import com.ecrm.Utils.Enumerable.ReportStatus;
import com.ecrm.Utils.socket.SocketIO;
import com.ecrm.Utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by ChiDNMSE60717 on 6/8/2015.
 */
@Controller
@RequestMapping("/thong-bao")
public class NotifyController {
    @Autowired
    UserDAOImpl userDAO;
    @Autowired
    ReportDAOImpl reportDAO;
    @Autowired
    ReportDetailDAOImpl reportDetailDAO;
    @Autowired
    ClassroomDAOImpl classroomDAO;
    @Autowired
    RoomTypeDAOImpl roomTypeDAO;
    @Autowired
    ScheduleDAOImpl scheduleDAO;
    @Autowired
    EquipmentDAOImpl equipmentDAO;
    @Autowired
    EquipmentCategoryDAOImpl equipmentCategoryDAO;

    @RequestMapping(value = "")
    public String notifications(HttpServletRequest request){
        HttpSession session = request.getSession();

        List<Integer> rooms = reportDAO.getDamagedRoom();
        List<GroupReportsDTO> groups = new ArrayList<GroupReportsDTO>();
        String equipmentNames = "";

        for(int i = 0; i < rooms.size(); i++){
            TblClassroomEntity room = classroomDAO.find(rooms.get(i));
            GroupReportsDTO group = new GroupReportsDTO();
            group.setRoomId(room.getId());
            group.setRoomName(room.getName());

            equipmentNames = equipmentCategoryDAO.getCategoriesInRoom(room.getId());
            group.setListEquipments(equipmentNames.substring(0, equipmentNames.length()-2));
            equipmentNames = "";
            group.setReporters(reportDAO.getReportersInRoom(room.getId()));

            groups.add(group);
        }
        List<TblReportEntity> finishReport = reportDAO.getFinishReport(0,0);
        List<ReportResponseObject> listReport = new ArrayList<ReportResponseObject>();
        for(int i = 0; i < finishReport.size(); i++) {
            List<TblReportDetailEntity> reportDetails = finishReport.get(i).getTblReportDetailsById();
            ReportResponseObject report = new ReportResponseObject(finishReport.get(i),reportDetails);
            report.setReporter(finishReport.get(i).getTblUserByUserId().getTblUserInfoByUsername().getFullName());
            listReport.add(report);
        }

        request.setAttribute("FINISHREPORT", listReport);
        request.setAttribute("NEWREPORT", groups);

        request.setAttribute("ACTIVELEFTTAB","STAFF_NOTIFY");
        return "staff/Notifications";
    }

    @RequestMapping(value = "chi-tiet")
    public String viewReportDetail(HttpServletRequest request, @RequestParam(value = "roomId") int roomId){
        HttpSession session = request.getSession();
        TblUserEntity user = (TblUserEntity)session.getAttribute("USER");

        TblClassroomEntity classroom = classroomDAO.find(roomId);
        List<TblEquipmentEntity> equipments = equipmentDAO.getDamagedEquipments(classroom.getId());

        DamagedRoomDTO resultObject = new DamagedRoomDTO(classroom, reportDAO.getReportNewest(roomId), equipments);
        resultObject.setReporters(reportDAO.getReportersInRoom(roomId));
        resultObject.setRoomtype(classroom.getTblRoomTypeByRoomTypeId());
        resultObject.setDamagedLevel(classroom.getDamagedLevel());

//        if(classroom.getDamagedLevel() >= 50) {
//            TblScheduleEntity schedule = scheduleDAO.getScheduleInTime(null, roomId);
//            if (schedule != null) {
//                List<String> availableRooms = Utils.getAvailableRoom(scheduleDAO.getScheduleInTime(null, roomId), classroomDAO.findAll());
//                resultObject.setSuggestRooms(availableRooms);
//            }
//        }
        request.setAttribute("DAMAGEDROOM", resultObject);
        return "staff/ReportDetail";
    }

    @RequestMapping(value = "sua-chua")
    @Transactional
    public String resolveReport(HttpServletRequest request, @RequestParam(value = "RoomId") int roomId,
                                @RequestParam(value = "ListResolve") String listResolve){
        String[] categories = listResolve.split(",");
        for (int i = 0; i < categories.length; i++) {
            resolve(roomId, Integer.parseInt(categories[i]));
        }

        TblClassroomEntity room = classroomDAO.find(roomId);
        room.setDamagedLevel(checkDamagedLevel(room));
        classroomDAO.merge(room);

        return "redirect:/thong-bao";
    }

    @RequestMapping(value = "sua-het")
    @Transactional
    public String resolveAllReportInRoom(HttpServletRequest request, @RequestParam(value = "roomId") int roomId){
        TblClassroomEntity room = classroomDAO.find(roomId);
        Collection<TblEquipmentEntity> equips = room.getTblEquipmentsById();
        for(TblEquipmentEntity equip: equips) {
            if(!equip.isStatus()){
                equip.setStatus(true);
                equipmentDAO.merge(equip);
            }
        }

        List<TblReportEntity> reports = reportDAO.getLiveReportsInRoom(roomId);
        int flag = 0;
        for (TblReportEntity report: reports) {
            List<TblReportDetailEntity> details = report.getTblReportDetailsById();
            for (TblReportDetailEntity detail: details) {
                if(!detail.isStatus()){
                    detail.setStatus(true);
                    reportDetailDAO.merge(detail);
                }
            }

            report.setStatus(ReportStatus.FINISH.getValue());
            reportDAO.merge(report);
        }

        room.setDamagedLevel(0);
        classroomDAO.merge(room);
        return "redirect:/thong-bao";
    }

    @RequestMapping(value = "doi-phong")
    @ResponseBody
    public String changeRoom(HttpServletRequest request, @RequestParam(value = "roomId") int roomId){

        return  "";
    }

    private boolean resolve(int room, int category){
        //Change Equipment status and ReportDetail status
        List<TblEquipmentEntity> equips = equipmentDAO.getDamagedEquipmentsByCategory(room, category);
        for (int i = 0; i < equips.size(); i++) {
            equips.get(i).setStatus(true);
            equipmentDAO.merge(equips.get(i));

            List<TblReportDetailEntity> reportDetails = reportDetailDAO.getUnresolveReportDetail(equips.get(i).getId());
            for (int j = 0; j < reportDetails.size(); j++) {
                reportDetails.get(j).setStatus(true);
                reportDetails.get(j).setResolveTime(new Timestamp(new Date().getTime()));
                reportDetailDAO.merge(reportDetails.get(j));
            }
        }

        //Change Report status
        List<TblReportEntity> reports = reportDAO.getLiveReportsInRoom(room);
        int flag = 0;
        for (TblReportEntity report: reports) {
            List<TblReportDetailEntity> details = report.getTblReportDetailsById();
            for (int i = 0; i < details.size(); i++) {
                if(!details.get(i).isStatus()){
                    flag++;
                }
            }

            if(flag == details.size()){
                report.setStatus(ReportStatus.FINISH.getValue());
                reportDAO.merge(report);
            } else if(flag > 0) {
                report.setStatus(ReportStatus.GOING.getValue());
                reportDAO.merge(report);
            }
            flag = 0;
        }

        return true;
    }

    public int checkDamagedLevel(TblClassroomEntity classroomEntity) {
        int damagedLevel = 0;
        int projectorDamagedLevel = 0;
        int mayLanhDamagedLevel = 0;
        int tiviDamagedLevel = 0;
        int quatDamagedLevel = 0;
        int loaDamagedLevel = 0;
        int denDamagedLevel = 0;
        int banDamagedLevel = 0;
        int gheDamagedLevel = 0;
        int MayLanh = 0;
        int Quat = 0;

        TblRoomTypeEntity roomTypeEntity = classroomEntity.getTblRoomTypeByRoomTypeId();
        int chair = roomTypeEntity.getSlots();
        String[] row = roomTypeEntity.getHorizontalRows().split("-");
        int table = 0;
        for (int i = 0; i < row.length; i++) {
            table += Integer.parseInt(row[i]);
        }
        if (roomTypeEntity.getAirConditioning() > 0) {
            MayLanh = roomTypeEntity.getAirConditioning();
        }
        if (roomTypeEntity.getFan() > 0) {
            Quat = roomTypeEntity.getFan();
        }
        Collection<TblEquipmentEntity> damagedEquipment = new ArrayList<TblEquipmentEntity>();
        Collection<TblEquipmentEntity> tblEquipmentEntities = classroomEntity.getTblEquipmentsById();
        for (TblEquipmentEntity tblEquipmentEntity : tblEquipmentEntities) {
            if (!tblEquipmentEntity.isStatus()) {
                damagedEquipment.add(tblEquipmentEntity);
            }
        }
        if (!damagedEquipment.isEmpty()) {
            for (TblEquipmentEntity tblEquipmentEntity : damagedEquipment) {
                if (tblEquipmentEntity.getCategoryId() == 1) {
                    List<TblReportDetailEntity> projectors = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    for (TblReportDetailEntity project : projectors) {
                        if (project.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                            projectorDamagedLevel = 20;
                        } else if (project.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                            projectorDamagedLevel = 30;
                        } else if (project.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                            projectorDamagedLevel = 50;
                        }else{
                            projectorDamagedLevel = 50;
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 2) {
                    List<TblReportDetailEntity> tivis = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    for (TblReportDetailEntity tivi : tivis) {
                        if (tivi.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                            tiviDamagedLevel = 20;
                        } else if (tivi.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                            tiviDamagedLevel = 30;
                        } else if (tivi.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                            tiviDamagedLevel = 50;
                        }else{
                            tiviDamagedLevel = 20;
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 3) {
                    List<TblReportDetailEntity> mayLanhs = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    for (TblReportDetailEntity mayLanh : mayLanhs) {
                        if (mayLanh.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                            mayLanhDamagedLevel += 10;
                        } else if (mayLanh.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                            mayLanhDamagedLevel += 15;
                        } else if (mayLanh.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                            mayLanhDamagedLevel += 25;
                        }else{
                            mayLanhDamagedLevel +=25;
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 4) {
                    List<TblReportDetailEntity> quats = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    if (MayLanh == 0) {
                        if ((quats.size() / Quat) * 100 >= 50) {
                            quatDamagedLevel = 50;
                        }
                    } else {
                        for (TblReportDetailEntity quat : quats) {
                            if (quat.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                                quatDamagedLevel += 1;
                            } else if (quat.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                                quatDamagedLevel += 3;
                            } else if (quat.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                                quatDamagedLevel += 5;
                            }else{
                                quatDamagedLevel += 5;
                            }
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 5) {
                    List<TblReportDetailEntity> loas = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    for (TblReportDetailEntity loa : loas) {
                        if (loa.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                            loaDamagedLevel = 1;
                        } else if (loa.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                            loaDamagedLevel = 3;
                        } else if (loa.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())){
                            loaDamagedLevel = 5;
                        }else{
                            loaDamagedLevel = 5;
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 6) {
                    List<TblReportDetailEntity> dens = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    for (TblReportDetailEntity den : dens) {
                        if (den.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                            denDamagedLevel = 10;
                        } else if (den.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                            denDamagedLevel = 20;
                        } else if (den.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())){
                            denDamagedLevel = 50;
                        }else{
                            denDamagedLevel = 10;
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 7) {
                    List<TblReportDetailEntity> bans = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    if ((bans.size() / table) / 100 >= 50) {
                        banDamagedLevel = 50;
                    } else {
                        for (TblReportDetailEntity ban : bans) {
                            if (ban.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                                banDamagedLevel += 2;
                            } else if (ban.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                                banDamagedLevel += 3;
                            } else if (ban.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())){
                                banDamagedLevel += 5;
                            }else{
                                banDamagedLevel += 5;
                            }
                        }
                    }
                }
                if (tblEquipmentEntity.getCategoryId() == 8) {
                    List<TblReportDetailEntity> ghes = reportDetailDAO.getUnresolveReportDetail(tblEquipmentEntity.getId());
                    if ((ghes.size() / chair) / 100 >= 50) {
                        gheDamagedLevel = 50;
                    } else {
                        for (TblReportDetailEntity ghe : ghes) {
                            if (ghe.getDamagedLevel().equals(Enumerable.DamagedLevel.LOW.getValue())) {
                                gheDamagedLevel += 1;
                            } else if (ghe.getDamagedLevel().equals(Enumerable.DamagedLevel.MEDIUM.getValue())) {
                                gheDamagedLevel += 2;
                            } else if (ghe.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())){
                                gheDamagedLevel += 3;
                            }else{
                                gheDamagedLevel += 3;
                            }
                        }
                    }
                }
            }
        }
        damagedLevel = projectorDamagedLevel + mayLanhDamagedLevel + tiviDamagedLevel + loaDamagedLevel + quatDamagedLevel + denDamagedLevel
                + banDamagedLevel + gheDamagedLevel;
        if (damagedLevel > 100) {
            damagedLevel = 100;
        }
        return damagedLevel;
    }
}
