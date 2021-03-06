package com.fu.group10.apps.teacher.utils;

/**
 * Created by QuangTV on 5/30/2015.
 */
public class Constants {
    private static final String API_SOURCE = "http://192.168.1.126:8080/api/";
    public static final String API_LOGIN = API_SOURCE + "login";
    public static final String API_SCHEDULE = API_SOURCE + "schedule?username=";
    public static final String API_GET_REPORT_BY_USERNAME = API_SOURCE + "getReportByUsername?username=";
    public static final String API_LOAD_MAP = API_SOURCE + "map?id=";
    public static final String API_GET_EQUIPMENT = API_SOURCE + "getEquipments?classId=";
    public static final String API_CREATE_REPORT = API_SOURCE + "createReport";
    public static final String PROJECTOR = "[1]";
    public static final String TELEVISION = "[2]";
    public static final String AIR = "[3]";
    public static final String FAN = "[4]";
    public static final String SPEAKER = "[5]";
    public static final String BULB = "[6]";
    public static final String TABLE = "[0]";
    public static final String APP_SERVER_URL = "http://192.168.1.126:8080/notification/register";

    // GCM server using java
    // static final String APP_SERVER_URL =
    // "http://192.168.1.17:8080/GCM-App-Server/GCMNotification?shareRegId=1";

    // Google Project Number
    public static final String GOOGLE_PROJECT_ID = "683842465097";
    public static final String MESSAGE_KEY = "message";


    public static String getPosition(String name) {
        if (name.equalsIgnoreCase("Máy Chiếu")) {
            return PROJECTOR;
        } else if (name.equalsIgnoreCase("Tivi")) {
            return TELEVISION;
        }else if (name.equalsIgnoreCase("Máy Lạnh")) {
            return AIR;
        }else if (name.equalsIgnoreCase("Máy Quạt")) {
            return FAN;
        }else if (name.equalsIgnoreCase("Loa")) {
            return SPEAKER;
        }else if (name.equalsIgnoreCase("Bóng Đèn")) {
            return BULB;
        } else {
            return TABLE;
        }
    }
}
