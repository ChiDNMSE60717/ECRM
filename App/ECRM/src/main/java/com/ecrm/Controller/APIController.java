package com.ecrm.Controller;

import com.ecrm.DAO.Impl.*;
import com.ecrm.DAO.ReportDAO;
import com.ecrm.DAO.ReportDetailDAO;
import com.ecrm.DAO.RoomTypeDAO;
import com.ecrm.DTO.*;
import com.ecrm.Entity.*;
import com.ecrm.Utils.Constant;
import com.ecrm.Utils.Enumerable;
import com.ecrm.Utils.SmsUtils;
import com.ecrm.Utils.Utils;
import com.ecrm.Utils.socket.SocketIO;
import com.twilio.sdk.TwilioRestException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.omg.Dynamic.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by Htang on 6/2/2015.
 */
@Controller
@RequestMapping("/api")
public class APIController {
    @Autowired
    ClassroomDAOImpl classroomDAO;

    @Autowired
    UserDAOImpl userDAO;

    @Autowired
    ReportDAOImpl reportDAO;

    @Autowired
    EquipmentDAOImpl equipmentDAO;

    @Autowired
    ReportDetailDAOImpl reportDetailDAO;

    @Autowired
    EquipmentCategoryDAOImpl equipmentCategoryDAO;

    @Autowired
    ScheduleDAOImpl scheduleDAO;

    @Autowired
    NotificationDAOImp notificationDAO;

    @RequestMapping(value = "/map")
    public String generateMap(HttpServletRequest request, @RequestParam("id") int classroomId) {
        TblClassroomEntity classroomEntity = classroomDAO.find(classroomId);
        List<TblEquipmentEntity> equipmentEntities = classroomEntity.getTblEquipmentsById();

        request.setAttribute("CLASSROOM", classroomEntity);
        request.setAttribute("EQUIPMENTS", equipmentEntities);
        return "ClassroomMap";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public
    @ResponseBody
    AccountDTO login(@RequestParam("username") String username, @RequestParam("password") String password,
                     HttpServletRequest request) {
        AccountDTO accountDTO = new AccountDTO();

        TblUserEntity userEntity = userDAO.login(username, password);
        if (userEntity != null) {
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            userDAO.updateLastLogin(username, timestamp);
            accountDTO = Utils.convertFromUserToAccountDTO(userEntity);
        }
        return accountDTO;
    }

    @RequestMapping(value = "/getReportByUsername", method = RequestMethod.GET)
    public
    @ResponseBody
    List<ReportDTO> getReport(@RequestParam("username") String username, @RequestParam("offset") int offset, @RequestParam("limit") int limit) {
        List<TblReportEntity> entities = reportDAO.getReportByUserId(username, offset, limit);
        return Utils.convertFromListEntityToListDTO(entities);
    }

    @RequestMapping(value = "/getAllReport", method = RequestMethod.GET)
    public
    @ResponseBody
    List<ReportDTO> getAllReport(@RequestParam("limit") int limit, @RequestParam("offset") int offset) {
        List<TblReportEntity> entities = reportDAO.getAllReport(limit, offset);
        return Utils.convertFromListEntityToListDTO(entities);
    }

    @RequestMapping(value = "/createReport", method = RequestMethod.POST)
    public
    @ResponseBody
    ResultDTO createReport(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("classId") String classId,
                           @RequestParam("listDamaged") String listDamaged, @RequestParam("listPosition") String listPosition,
                           @RequestParam("listDescription") String listDescription, @RequestParam("evaluate") String evaluate,
                           @RequestParam("listEvaluate") String listEvaluate) {
        ResultDTO resultDTO = new ResultDTO();
        try {
            int classroomId = Integer.parseInt(classId);
            TblClassroomEntity room = classroomDAO.find(classroomId);
            Date date = new Date();
            TblReportEntity report = reportDAO.getReportOfUsernameInDay(username, classroomId);
            if (report == null || report.getStatus() == Enumerable.ReportStatus.FINISH.getValue()) {
                report = new TblReportEntity(username, classroomId, new Timestamp(date.getTime()), evaluate, 1);
                reportDAO.insert(report);
            }
            
            int reportId = report.getId();
            //position
            String[] positions = listPosition.split("-");
            //category name
            String[] categoryNames = listDamaged.split(",");
            List<Integer> categoriesId = new ArrayList<Integer>();
            //description
            String[] descriptions = listDescription.split(",");
            //list evaluate
            String[] evaluates = listEvaluate.split(",");
            String serialNumber = null;
            for (int i = 0; i < categoryNames.length; i++) {
                categoriesId.add(equipmentCategoryDAO.findEquipmentId(categoryNames[i]));
            }
            for (int j = 0; j < categoriesId.size(); j++) {
                int category = categoriesId.get(j);
                String positon = positions[j];
                String damagedLevel = evaluates[j];
                String description = null;
                if (Integer.parseInt(damagedLevel) == 1) {
                    description = descriptions[j];
                }
                if(category>3){
                    serialNumber = "";
                }
                if (category < 7) {
                    TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, positon, serialNumber);
                    if (tblEquipmentEntity == null) {
                        tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, positon, null, false);
                        equipmentDAO.insert(tblEquipmentEntity);
                        TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                reportId, damagedLevel, description, positon);
                        reportDetailDAO.persist(tblReportDetailEntity);
                    } else {
                        tblEquipmentEntity.setStatus(false);
                        equipmentDAO.merge(tblEquipmentEntity);
                        TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                reportId, damagedLevel, description, positon);
                        reportDetailDAO.persist(tblReportDetailEntity);
                    }
                }
                if (category > 6) {
                    if (positon.equals("[0]")) {
                        positon = null;
                        TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, positon, serialNumber);
                        if (tblEquipmentEntity == null) {
                            tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, "[0]", null, false);
                            equipmentDAO.insert(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, positon);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        } else {
                            tblEquipmentEntity.setPosition("[0]");
                            tblEquipmentEntity.setStatus(false);
                            equipmentDAO.merge(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, positon);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        }
                    } else {
                        TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, positon, serialNumber);
						if (tblEquipmentEntity == null) {
                            tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, positon, null, false);
                            equipmentDAO.insert(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, positon);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        } else {
                            tblEquipmentEntity.setStatus(false);
							equipmentDAO.merge(tblEquipmentEntity);
							TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                reportId, damagedLevel, description, positon);
							reportDetailDAO.persist(tblReportDetailEntity);
                        }
                        
                    }
                }
            }
            List<TblEquipmentEntity> listDamamagedEquipment = equipmentDAO.getDamagedEquipments(room.getId());

            int damagedLevel = checkDamagedLevel(listDamamagedEquipment,room);

            room.setDamagedLevel(damagedLevel);
            classroomDAO.merge(room);

            resultDTO.setError_code(100);
            resultDTO.setError("OK");
            SocketIO socketIO = new SocketIO();
            List<TblUserEntity> staffs = userDAO.getAllStaff();
            String message = username + "  vừa báo cáo hư hại phòng " + room.getName();
            System.out.println("Send notification from mobile to web");
            for (TblUserEntity staff : staffs) {

                boolean res = socketIO.sendNotifyMessageToUser(staff.getUsername(),
                        Enumerable.NotifyType.STAFFNOTIFYREPORT.getValue(), message, "/thong-bao/hu-hai?phong=" + report.getClassRoomId());

                System.out.println("Send notification to " + staff.getUsername() + " - " + res);
            }
            System.out.println("End send notification from mobile to web");

            return resultDTO;
        } catch (Exception e) {
            resultDTO.setError_code(101);
            e.printStackTrace();
            return resultDTO;
        }
    }

    @RequestMapping(value = "/editReport", method = RequestMethod.POST)
    public
    @ResponseBody
    ResultDTO editReport( @RequestParam("reportId") String reportID, @RequestParam("classId") String classId,
                           @RequestParam("listDamaged") String listDamaged, @RequestParam("listPosition") String listPosition,
                           @RequestParam("listDescription") String listDescription, @RequestParam("evaluate") String evaluate,
                           @RequestParam("listEvaluate") String listEvaluate) {
        ResultDTO resultDTO = new ResultDTO();
        try {
            int classroomId = Integer.parseInt(classId);
            TblClassroomEntity room = classroomDAO.find(classroomId);

            int reportId = Integer.parseInt(reportID);
            TblReportEntity report = reportDAO.find(reportId);
            report.setEvaluate(evaluate);
            reportDAO.merge(report);

            Date nowDate = new Date();
            long time = (nowDate.getTime() - report.getCreateTime().getTime()) / 1000*60;
            if(time > 14) {
                resultDTO.setError_code(500);
                resultDTO.setError("Bạn hết thời gian sửa report!");
                return resultDTO;
            }

//            List<TblReportDetailEntity> reportDetails = report.getTblReportDetailsById();
//            for(TblReportDetailEntity detail: reportDetails) {
//                reportDetailDAO.remove(detail);
//            }

            List<TblEquipmentEntity> equipments = room.getTblEquipmentsById();
            for(TblEquipmentEntity equipment: equipments) {
                List<TblReportDetailEntity> reportDetails = reportDetailDAO.getUnresolveReportDetail(equipment.getId());
                for(TblReportDetailEntity detail: reportDetails) {
                    if(detail.getReportId() == reportId) {
                        if(reportDetails.size() < 2) {
                            equipment.setStatus(true);
                            equipmentDAO.merge(equipment);
                        }

                        reportDetailDAO.remove(detail);
                    }
                }
            }


            //position
            String[] positions = listPosition.split("-");
            //category name
            String[] categoryNames = listDamaged.split(",");
            List<Integer> categoriesId = new ArrayList<Integer>();
            //description
            String[] descriptions = listDescription.split(",");
            //list evaluate
            String[] evaluates = listEvaluate.split(",");
            String serialNumber = null;
            for (int i = 0; i < categoryNames.length; i++) {
                categoriesId.add(equipmentCategoryDAO.findEquipmentId(categoryNames[i]));
            }
            for (int j = 0; j < categoriesId.size(); j++) {
                int category = categoriesId.get(j);
                String position = positions[j];
                String damagedLevel = evaluates[j];
                String description = null;
                if (Integer.parseInt(damagedLevel) == 1) {
                    description = descriptions[j];
                }
                if(category>3){
                    serialNumber = "";
                }
                if (category < 7) {
                    TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, position, serialNumber);
                    if (tblEquipmentEntity == null) {
                        tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, position, null, false);
                        equipmentDAO.insert(tblEquipmentEntity);
                        TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                reportId, damagedLevel, description, position);
                        reportDetailDAO.persist(tblReportDetailEntity);
                    } else {
                        tblEquipmentEntity.setStatus(false);
                        equipmentDAO.merge(tblEquipmentEntity);
                        TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                reportId, damagedLevel, description, position);
                        reportDetailDAO.persist(tblReportDetailEntity);
                    }
                }
                if (category > 6) {
                    if (position.equals("[0]")) {
                        position = null;
                        TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, position, serialNumber);
                        if (tblEquipmentEntity == null) {
                            tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, "[0]", null, false);
                            equipmentDAO.insert(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, position);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        } else {
                            tblEquipmentEntity.setPosition("[0]");
                            tblEquipmentEntity.setStatus(false);
                            equipmentDAO.merge(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, position);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        }
                    } else {
                        TblEquipmentEntity tblEquipmentEntity = equipmentDAO.findEquipmentHavePosition(classroomId, category, position, serialNumber);
                        if (tblEquipmentEntity == null) {
                            tblEquipmentEntity = new TblEquipmentEntity(category, classroomId, null, null, position, null, false);
                            equipmentDAO.insert(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, position);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        } else {
                            tblEquipmentEntity.setStatus(false);
                            equipmentDAO.merge(tblEquipmentEntity);
                            TblReportDetailEntity tblReportDetailEntity = new TblReportDetailEntity(tblEquipmentEntity.getId(),
                                    reportId, damagedLevel, description, position);
                            reportDetailDAO.persist(tblReportDetailEntity);
                        }

                    }
                }
            }
            List<TblEquipmentEntity> listDamamagedEquipment = equipmentDAO.getDamagedEquipments(room.getId());

            int damagedLevel = checkDamagedLevel(listDamamagedEquipment,room);

            room.setDamagedLevel(damagedLevel);
            classroomDAO.merge(room);

            resultDTO.setError_code(100);
            resultDTO.setError("OK");
            System.out.println("Update report finish!");

            return resultDTO;
        } catch (Exception e) {
            resultDTO.setError_code(101);
            e.printStackTrace();
            return resultDTO;
        }
    }

    private TblEquipmentEntity insertEquipment(int reportId, int roomId, int category, String pos, String evaluate, String description) {
        String position = null;
        if (category < 7) {
            position = "[" + category + "]";
        } else if (pos != null && "".equals(pos) == false) {
            position = pos;
        }

        String serialNumber = "";
        if (category < 4) {
            serialNumber = null;
        }

        TblEquipmentEntity equip = equipmentDAO.findEquipmentHavePosition(roomId, category, position, serialNumber);

        if (equip != null) {
            equip.setStatus(true);
            equipmentDAO.merge(equip);
        } else {
            equip = new TblEquipmentEntity(category, roomId, null, null, position, null, true);
            equipmentDAO.persist(equip);
        }

        TblReportDetailEntity reportDetail = new TblReportDetailEntity(equip.getId(), reportId, evaluate, description, equip.getPosition());
        reportDetailDAO.persist(reportDetail);

        return equip;
    }

    //  PRIVATE METHOD
    private List<String> getEquipmentsInCategory(String[] equipments, int category) {

        List<String> result = new ArrayList<String>();
        for (int i = 0; i < equipments.length; i++) {
            String[] equip = equipments[i].split("-");
            if (Integer.parseInt(equip[0]) == category) {
                result.add(equip[1]);
            }
        }

        return result;
    }

    @RequestMapping(value = "/getReportStaff", method = RequestMethod.GET)
    public
    @ResponseBody
    List<ReportClassDTO> getReportStaff(@RequestParam("status") String status, @RequestParam("offset") int offset, @RequestParam("limit") int limit) {
        List<ReportClassDTO> result = new ArrayList<ReportClassDTO>();
        List<Integer> listClass = reportDAO.getReportByClassId(status, offset, limit);
        List<Integer> listReport = new ArrayList<Integer>();
        for (int classId : listClass) {
            //int id = Integer.parseInt(classId);
            List<TblReportDetailEntity> details = new ArrayList<TblReportDetailEntity>();
            if (status.equalsIgnoreCase("finish")) {
                details = reportDetailDAO.getReportFinishByClassID(classId);
            } else {
                details = reportDetailDAO.getReportByClassId(classId);
            }

            if (details.size() == 0) {
                continue;
            }

            TblClassroomEntity classroomEntity = classroomDAO.find(classId);
            List<EquipmentDTO> equipments = new ArrayList<EquipmentDTO>();
            int reportId = 0;
            Map<String, Integer> mapCount = new HashMap<String, Integer>();

            for (TblReportDetailEntity detail : details) {
                if (mapCount.get(detail.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName()) != null) {
                    mapCount.put(detail.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName(),
                            mapCount.get(detail.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName()) + 1);

                } else {
                    mapCount.put(detail.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName(), 1);
                }
            }

            Map<Integer, Integer> mapReport = new HashMap<Integer, Integer>();
            for (TblReportDetailEntity detail : details) {
                if (mapReport.get(detail.getReportId()) != null) {
                    mapReport.put(detail.getReportId(), mapReport.get(detail.getReportId()) + 1);
                } else {
                    mapReport.put(detail.getReportId(), 1);
                }
            }
            Map<String, Boolean> mapManage = new HashMap<String, Boolean>();
            for (TblReportDetailEntity entity : details) {
                if (mapManage.get(entity.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName()) == null) {
                    EquipmentDTO detailDTO = new EquipmentDTO();

                    detailDTO.setEquipmentName(entity.getTblEquipmentByEquipmentId().getTblEquipmentCategoryByCategoryId().getName());
                    detailDTO.setDamage(entity.getDamagedLevel());
                    detailDTO.setEvaluate(entity.getDescription());
                    detailDTO.setReportId(entity.getReportId());
                    detailDTO.setStatus(entity.isStatus());
                    detailDTO.setQuantity(mapCount.get(detailDTO.getEquipmentName()));
                    reportId = entity.getReportId();
                    listReport.add(reportId);
                    mapManage.put(detailDTO.getEquipmentName(), true);
                    equipments.add(detailDTO);
                }

            }


            ReportClassDTO reportClassDTO = new ReportClassDTO();
            String userReport = "";
            for (Map.Entry<Integer, Integer> entry : mapReport.entrySet()) {
                TblReportEntity reportEntity = reportDAO.find(entry.getKey());
                reportClassDTO.setRoomName(reportEntity.getTblClassroomByClassRoomId().getName());
                reportClassDTO.setRoomId(classId);
                reportClassDTO.setEquipments(equipments);
                reportClassDTO.setDamageLevel(classroomEntity.getDamagedLevel());
                reportClassDTO.setTimeReport(reportEntity.getCreateTime() + "");
                reportClassDTO.setEvaluate(reportEntity.getEvaluate());
                reportClassDTO.setChangedRoom(reportEntity.getChangedRoom());
                if (!userReport.contains(reportEntity.getUsername())) {
                    userReport += reportEntity.getUsername() + ", ";
                }
            }

            reportClassDTO.setUserReport(userReport.substring(0, userReport.length() - 2));
            result.add(reportClassDTO);

        }

        System.out.println("Result Size: "+ result.size());
        return result;

    }

    @RequestMapping(value = "/getAvailableRoom", method = RequestMethod.GET)
    public
    @ResponseBody
    List<String> getAvailableRoom(@RequestParam("id") int roomId) {
        List<String> availableRooms = Utils.getAvailableRoom(scheduleDAO.getScheduleInTime(null, roomId), classroomDAO.findAll());
        return availableRooms;
    }


    @RequestMapping(value = "/resolve", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultDTO resolveReport(@RequestParam("listRoomId") String listRoom) {
        ResultDTO result = new ResultDTO();
        try {
            String[] roomId = listRoom.split(",");
            for (int i = 0; i < roomId.length; i++) {
                System.out.println("RoomID" + roomId[i]);
                TblClassroomEntity room = classroomDAO.find(Integer.parseInt(roomId[i]));
                List<TblEquipmentEntity> equips = room.getTblEquipmentsById();
                for (TblEquipmentEntity equip : equips) {
                    if (!equip.isStatus()) {
                        equip.setStatus(true);
                        equipmentDAO.merge(equip);
                    }
                }

                List<TblReportEntity> reports = reportDAO.getLiveReportsInRoom(Integer.parseInt(roomId[i]));
                for (TblReportEntity report : reports) {
                    List<TblReportDetailEntity> details = report.getTblReportDetailsById();
                    for (TblReportDetailEntity detail : details) {
                        if (!detail.isStatus()) {
                            detail.setStatus(true);
                            reportDetailDAO.merge(detail);
                        }
                    }

                    report.setStatus(Enumerable.ReportStatus.FINISH.getValue());
                    reportDAO.merge(report);
                }

                TblNotificationEntity notify = notificationDAO.getNotifyOfRoom(Integer.parseInt(roomId[i]), Enumerable.MessageType.NEWREPORT.getValue());
                if (notify != null) {
                    notify.setStatus(false);
                    notificationDAO.merge(notify);
                }

                room.setDamagedLevel(0);
                classroomDAO.merge(room);
                result.setError("Success");
                result.setError_code(100);
            }

        }catch (Exception e) {
            result.setError_code(101);
            result.setError(e.getMessage());
            e.printStackTrace();
        }
        return result;

    }


    public int checkDamagedLevel(List<TblEquipmentEntity> damagedEquipment, TblClassroomEntity tblClassroomEntity) {
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

        TblRoomTypeEntity roomTypeEntity = tblClassroomEntity.getTblRoomTypeByRoomTypeId();
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
                        } else {
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
                        } else {
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
                        } else {
                            mayLanhDamagedLevel += 25;
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
                            } else {
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
                        } else if (loa.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                            loaDamagedLevel = 5;
                        } else {
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
                        } else if (den.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                            denDamagedLevel = 50;
                        } else {
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
                            } else if (ban.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                                banDamagedLevel += 5;
                            } else {
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
                            } else if (ghe.getDamagedLevel().equals(Enumerable.DamagedLevel.HIGH.getValue())) {
                                gheDamagedLevel += 3;
                            } else {
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


    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public
    @ResponseBody
    List<ScheduleDTO> getSchedule(@RequestParam("username") String username) {
        List<ScheduleDTO> result = new ArrayList<ScheduleDTO>();
        List<TblScheduleEntity> listSchedule = scheduleDAO.getSchedulesOfUser(username);
        for (TblScheduleEntity scheduleEntity : listSchedule) {
            ScheduleDTO dto = new ScheduleDTO();
            dto.setClassId(scheduleEntity.getClassroomId());
            dto.setClassName(scheduleEntity.getTblClassroomByClassroomId().getName());
            dto.setTimeFrom(scheduleEntity.getTblScheduleConfigByScheduleConfigId().getTimeFrom().getTime() + "");
            dto.setTimeTo(scheduleEntity.getTblScheduleConfigByScheduleConfigId().getTimeTo().getTime() + "");
            dto.setDate(scheduleEntity.getDate().getTime() + "");
            result.add(dto);
        }
        return result;
    }

    @RequestMapping(value = "/getChangeRoom", method = RequestMethod.GET)
    public
    @ResponseBody
    ResultDTO getChangeRoom(@RequestParam("classId") int classId) {
        ResultDTO dto = new ResultDTO();
        List<TblScheduleEntity> tblScheduleEntityList = scheduleDAO.findAllScheduleInClassroom(classId);
        List<TblClassroomEntity> tblClassroomEntities = classroomDAO.getValidClassroom();
        for (TblScheduleEntity tblScheduleEntity : tblScheduleEntityList) {
            List<String> classroom = Utils.getAvailableRoom(tblScheduleEntity, tblClassroomEntities);
            if (!classroom.isEmpty()) {
                TblClassroomEntity classroomEntity = classroomDAO.getClassroomByName(classroom.get(0));
                tblScheduleEntity.setIsActive(false);
                scheduleDAO.merge(tblScheduleEntity);
                TblScheduleEntity newSchedule = new TblScheduleEntity(tblScheduleEntity.getUsername(), classroomEntity.getId(),
                        tblScheduleEntity.getNumberOfStudents(), "Thay đổi phòng", tblScheduleEntity.getTimeFrom(),
                        tblScheduleEntity.getSlots(), tblScheduleEntity.getDate(), true);
                String message = "Đã đổi phòng cho giáo viên " + tblScheduleEntity.getUsername() + " từ phòng: " +
                        tblScheduleEntity.getTblClassroomByClassroomId().getName() + " sang phòng: " + classroomEntity.getName() + ".";
                scheduleDAO.persist(newSchedule);
                //update report status
                dto.setError(message);
                dto.setError_code(100);
                return dto;
            } else {
                String message = "Không còn phòng trống: " + tblScheduleEntity.getUsername() + " của phòng: " +
                        tblScheduleEntity.getTblClassroomByClassroomId().getName() + ".";
                dto.setError(message);
                dto.setError_code(101);
                return dto;
            }
        }
        return new ResultDTO(101, "Không có thời khóa biểu");

    }


    @RequestMapping(value = "/getEquipments", method = RequestMethod.GET)
    public
    @ResponseBody
    List<EquipmentClassDTO> getEquipment(@RequestParam("classId") int classId) {
        List<EquipmentClassDTO> result = new ArrayList<EquipmentClassDTO>();
        TblClassroomEntity classroomEntity = classroomDAO.find(classId);
        List<TblEquipmentEntity> listEquipments = classroomEntity.getTblEquipmentsById();
        TblRoomTypeEntity roomType = classroomEntity.getTblRoomTypeByRoomTypeId();
        List<String> list = new ArrayList<String>();
        TblEquipmentEntity equipmentEntity = new TblEquipmentEntity();
        if (roomType.getAirConditioning() > 0) {
            equipmentEntity = getEquipment(listEquipments, 3);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Máy Lạnh", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Máy Lạnh", null, null, true));
            }

        }
        if (roomType.getBulb() > 0) {
            equipmentEntity = getEquipment(listEquipments, 6);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Bóng Đèn", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Bóng Đèn", null, null, true));
            }
        }
        if (roomType.getFan() > 0) {
            equipmentEntity = getEquipment(listEquipments, 4);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Máy Quạt", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Máy Quạt", null, null, true));
            }
        }
        if (roomType.getProjector() > 0) {
             equipmentEntity = getEquipment(listEquipments, 1);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Máy Chiếu", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Máy Chiếu", null, null, true));
            }
        }
        if (roomType.getTelevision() > 0) {
             equipmentEntity = getEquipment(listEquipments, 2);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Tivi", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Tivi", null, null, true));
            }
        }
        if (roomType.getSpeaker() > 0) {
             equipmentEntity = getEquipment(listEquipments, 5);
            if (equipmentEntity != null) {
                result.add(new EquipmentClassDTO("Loa", equipmentEntity.getTimeRemain() + "", equipmentEntity.getName(), equipmentEntity.isStatus()));
            } else {
                result.add(new EquipmentClassDTO("Loa", null, null, true));
            }
        }
        equipmentEntity = getEquipment(listEquipments, 7);
        if (equipmentEntity != null) {
            result.add(new EquipmentClassDTO("Bàn", null, null, equipmentEntity.isStatus()));
        } else {
            result.add(new EquipmentClassDTO("Bàn", null, null, true));
        }
        equipmentEntity = getEquipment(listEquipments, 8);
        if (equipmentEntity != null) {
            result.add(new EquipmentClassDTO("Ghế", null, null, equipmentEntity.isStatus()));
        } else {
            result.add(new EquipmentClassDTO("Ghế", null, null, true));
        }

        return result;
    }


    public TblEquipmentEntity getEquipment(List<TblEquipmentEntity> listEquipments, int id) {
        TblEquipmentEntity tblEquipmentEntity = null;
        for (int i = 0; i < listEquipments.size(); i++) {
            if (listEquipments.get(i).getCategoryId() == id) {
                tblEquipmentEntity = listEquipments.get(i);

                if(tblEquipmentEntity != null && tblEquipmentEntity.isStatus() == false){
                    break;
                }
            }
        }
        return tblEquipmentEntity;
    }

    @RequestMapping(value = "/sendSMS", method = RequestMethod.GET)
    public void sendSMS(@RequestParam("message") String message, @RequestParam("ListUser") String listUsers) {
        String[] users = listUsers.split(",");
        try {
            for (int i = 0; i < users.length; i++) {
                String phoneNumber = userDAO.getPhoneNumber(users[i]);
                SmsUtils.sendMessage(phoneNumber, message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @RequestMapping(value = "/checkSchedule", method = RequestMethod.GET)
    public @ResponseBody boolean checkSchedule(@RequestParam("classId") int classId) {
        try {
            List<TblScheduleEntity> result = scheduleDAO.getScheduleNoFinishOfRoom(classId);
            if (result.size() > 0) {
                return true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @RequestMapping(value="/remove", method = RequestMethod.GET)
    public @ResponseBody boolean removeReport(@RequestParam("reportId") int reportId) {
        try {
            TblReportEntity report = reportDAO.find(reportId);
            List<TblReportDetailEntity> details = report.getTblReportDetailsById();
            for (TblReportDetailEntity detail : details) {
                detail.setStatus(true);
                reportDetailDAO.merge(detail);
                TblEquipmentEntity tblEquipmentEntity = detail.getTblEquipmentByEquipmentId();
                tblEquipmentEntity.setStatus(true);
                equipmentDAO.merge(tblEquipmentEntity);
            }
            report.setStatus(Enumerable.ReportStatus.REMOVE.getValue());
            reportDAO.merge(report);
            return true;
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @RequestMapping(value="/getCurrentTime", method = RequestMethod.GET)
    public @ResponseBody Long getCurrentTime() {
        return System.currentTimeMillis();
    }

    @RequestMapping(value="/getAllSchedule", method = RequestMethod.GET)
    public @ResponseBody
    List<ScheduleDTO> getAllSchedule(@RequestParam("username") String username) {
        List<ScheduleDTO> result = new ArrayList<ScheduleDTO>();
        List<TblScheduleEntity> listSchedule = scheduleDAO.getAllSchedulesOfUser(username);
        for (TblScheduleEntity scheduleEntity : listSchedule) {
            ScheduleDTO dto = new ScheduleDTO();
            dto.setClassId(scheduleEntity.getClassroomId());
            dto.setClassName(scheduleEntity.getTblClassroomByClassroomId().getName());
            dto.setTimeFrom(scheduleEntity.getTblScheduleConfigByScheduleConfigId().getTimeFrom().getTime() + "");
            dto.setTimeTo(scheduleEntity.getTblScheduleConfigByScheduleConfigId().getTimeTo().getTime() + "");
            dto.setDate(scheduleEntity.getDate().getTime() + "");
            result.add(dto);
        }
        return result;
    }


}


