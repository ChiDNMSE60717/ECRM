package com.ecrm.Controller;

import com.ecrm.DAO.Impl.ClassroomDAOImpl;
import com.ecrm.DAO.Impl.ScheduleConfigDAOImpl;
import com.ecrm.DAO.Impl.ScheduleDAOImpl;
import com.ecrm.DAO.Impl.UserDAOImpl;
import com.ecrm.DAO.ScheduleConfigDAO;
import com.ecrm.Entity.*;
import com.ecrm.Service.ClassroomService;
import com.ecrm.Service.ScheduleConfigService;
import com.ecrm.Service.ScheduleService;
import com.ecrm.Service.UserService;
import com.ecrm.Utils.SmsUtils;
import com.twilio.sdk.TwilioRestException;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Htang on 6/10/2015.
 */
@Controller
@RequestMapping("/staff")
public class ScheduleController {
    public static final String ERROR = "Error";

    @Autowired
    ScheduleConfigService scheduleConfigService;
    @Autowired
    UserService userService;
    @Autowired
    ClassroomService classroomService;
    @Autowired
    ScheduleService scheduleService;

    @RequestMapping(value = "schedule")
    public String mappingSchedule(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session != null) {
            List<TblClassroomEntity> tblClassroomEntities = classroomService.getAllClassroom();
            List<String> classrooms =new ArrayList<String>();
            for(TblClassroomEntity classroomEntity :  tblClassroomEntities){
                classrooms.add(classroomEntity.getName());
            }
            request.setAttribute("CLASSROOMS", classrooms);
            List<TblUserEntity> tblUserEntities = userService.getAllTeacher();
            List<String> teachers = new ArrayList<String>();
            for(TblUserEntity tblUserEntity:tblUserEntities){
                teachers.add(tblUserEntity.getUsername());
            }
            List<TblScheduleConfigEntity> tblScheduleConfigEntities = scheduleConfigService.findAll();
            request.setAttribute("TEACHERS", teachers);
            request.setAttribute("TABCONTROL", "STAFF_SCHEDULE");
            request.setAttribute("SCHEDULECONFIG", tblScheduleConfigEntities);
            request.setAttribute("TABCONTROL", "STAFF_SCHEDULE");
            return "Staff_Schedule";
        } else {
            return "Login";
        }
    }

    @RequestMapping(value = "import")
    public String importFile(HttpServletRequest request) throws IOException, InvalidFormatException, ParseException {
        HttpSession session = request.getSession();
        if (session != null) {
            String fileName = "";
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "/path/to/uploads";
            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                // maximum size that will be stored in memory
                factory.setSizeThreshold(maxMemSize);
                // Location to save data that is larger than maxMemSize.
                factory.setRepository(new File("/path/to/uploads"));
                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);
                // maximum file size to be uploaded.
                upload.setSizeMax(maxFileSize);

                try {
                    // Parse the request to get file items.
                    List fileItems = upload.parseRequest(request);

                    // Process the uploaded file items
                    Iterator i = fileItems.iterator();

                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            // Get the uploaded file parameters
                            fileName = fi.getName();
                            ServletContext servletContext = request.getSession().getServletContext();
                            filePath = servletContext.getRealPath(fileName);
                            // Write the file
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath);
                            } else {
                                file = new File(filePath);
                            }
                            fi.write(file);
                        }
                    }

                } catch (Exception ex) {
                    System.out.println(ex);
                }
                return scheduleService.importSchedule(filePath);
            }

            return "redirect:/staff/schedule";
        } else {
            return "Login";
        }
    }

    @RequestMapping(value = "download")
    public String download(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ServletContext servletContext = request.getSession().getServletContext();

        String filename = servletContext.getRealPath("Schedule_Sample.xlsx");

        File file = new File(filename);

        response.setContentType(new MimetypesFileTypeMap().getContentType(file));
        response.setContentLength((int) file.length());
        response.setHeader("content-disposition", "attachment; filename=" + URLEncoder.encode(filename, "UTF-8"));

        InputStream is = new FileInputStream(file);
        FileCopyUtils.copy(is, response.getOutputStream());

        return null;
    }

    //Manually import
    @RequestMapping(value = "importManually", method = RequestMethod.POST)
    public String importManually(HttpServletRequest request, @RequestParam("username") String username, @RequestParam("all") String all, @RequestParam("avai") String avai,
                                 @RequestParam("slot") int slot, @RequestParam("numberOfSlots") int numberOfSlots,
                                 @RequestParam("numberOfStudent") int numberOfStudent, @RequestParam("dateF") String dateFrom,
                                 @RequestParam("dateT") String dateTo, @RequestParam("sms")String sms) throws ParseException, TwilioRestException {
        HttpSession session = request.getSession();
        if (session != null) {
            int classroom= 0;
            boolean importManually = scheduleService.importManually(username,all,avai,slot,numberOfSlots,numberOfStudent,dateFrom,dateTo,sms,classroom);
            if(importManually){
                return "redirect:/staff/schedule";
            }else {
                return ERROR;
            }


        } else {
            return "Login";
        }
    }

}
