package com.fu.group10.capstone.apps.teachermobileapp.utils;


import android.support.annotation.Nullable;
import android.util.Log;

import com.fu.group10.capstone.apps.teachermobileapp.dao.ClassroomDAO;
import com.fu.group10.capstone.apps.teachermobileapp.model.ClassroomInfo;
import com.fu.group10.capstone.apps.teachermobileapp.model.Equipment;
import com.fu.group10.capstone.apps.teachermobileapp.model.EquipmentCategory;
import com.fu.group10.capstone.apps.teachermobileapp.model.EquipmentQuantity;
import com.fu.group10.capstone.apps.teachermobileapp.model.EquipmentReportInfo;
import com.fu.group10.capstone.apps.teachermobileapp.model.ReportInfo;
import com.fu.group10.capstone.apps.teachermobileapp.model.Result;
import com.fu.group10.capstone.apps.teachermobileapp.model.User;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by QuangTV on 5/30/2015.
 */
public class ParseUtils {

    public static JSONArray parseMoviesJson(String json){
        try {
            JSONArray movies = new JSONArray(json);
            return movies;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return new JSONArray();
    }

    public static String[] parseCategoriesJson(String json){
        try {
            JSONArray jsonCategories = new JSONArray(json);
            String[] categories = new String[jsonCategories.length() + 1];
            categories[0] = "Home";
            for (int i = 0; i < jsonCategories.length(); i++){
                categories[i + 1] = jsonCategories.getString(i);
            }
            return categories;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return new String[0];
    }

    public static List<Equipment> parseEquipmentJson(String json){
        List<Equipment> result = new ArrayList<Equipment>();
        try {
            if (json == null) {
                   return result;
            }
            JSONArray jsonEquipment = new JSONArray(json);
            for (int i = 0; i < jsonEquipment.length(); i++) {
                Equipment equipment = new Equipment(jsonEquipment.getJSONObject(i).getString("equipmentName"),
                        jsonEquipment.getJSONObject(i).getString("timeRemain"),
                        jsonEquipment.getJSONObject(i).getString("company"), jsonEquipment.getJSONObject(i).getBoolean("damaged"));
                result.add(equipment);
            }

            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ArrayList<>();
    }


    public static List<ClassroomInfo> parseClassroom(String json) {
        List<ClassroomInfo> result = new ArrayList<ClassroomInfo>();
        try {
            if (json == null) {
                return result;
            }

            JSONArray jsonClassroom = new JSONArray(json);

            for (int i = 0 ; i< jsonClassroom.length(); i++) {
                ClassroomInfo classroomInfo = new ClassroomInfo();
                classroomInfo.setClassid(jsonClassroom.getJSONObject(i).getInt("classId"));
                classroomInfo.setClassName(jsonClassroom.getJSONObject(i).getString("className"));
                classroomInfo.setTimeFrom(jsonClassroom.getJSONObject(i).getString("timeFrom"));
                classroomInfo.setTimeTo(jsonClassroom.getJSONObject(i).getString("timeTo"));
                classroomInfo.setDate(jsonClassroom.getJSONObject(i).getString("date"));
                result.add(classroomInfo);
            }
        }catch (Exception e) {
            Log.d("Wrong json", "Parse Class");
            e.printStackTrace();
        }
        return result;
    }

    public static User parseUserJson(String json) {
        User result = null;
        try {
            if (json == null) {
                return result;
            }

            JSONObject user = new JSONObject(json);

            result = new User(
                    user.getString("username"), user.getString("password"), user.getString("fullname"),
                    user.getString("phone"), user.getString("role"), user.getLong("lastLogin"),
                    user.getBoolean("status"));

        } catch (JSONException e) {
            Log.d("Parse User", "Wrong format");
            e.printStackTrace();
        }
        return result;
    }

    public static List<EquipmentQuantity> parseEquipmentQuantity(String json) {
        List<EquipmentQuantity> result = new ArrayList<>();
        try {
            if (json == null) {
                return result;
            }

            JSONArray listEq = new JSONArray(json);
            for (int i = 0; i< listEq.length(); i++) {
                EquipmentQuantity eq = new EquipmentQuantity();
                JSONObject object = listEq.getJSONObject(i);
                eq.setClassId(object.getInt("classId"));
                eq.setEquipmentName(object.getString("equipmentName"));
                eq.setPriority(object.getInt("priority"));
                eq.setQuantity(object.getInt("quantity"));
                eq.setIsDeleted(object.getBoolean("deleted"));
                result.add(eq);
            }
            return result;
        }catch (JSONException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public static Result parseResult(String json) {
        Result result = null;
        try {
            if (json == null) {
                return result;
            }

            JSONObject object = new JSONObject(json);

            result = new Result(object.getInt("error_code"), object.getString("error"));

        } catch (JSONException e) {
            Log.d("Parse Result", "Wrong format");
            e.printStackTrace();
        }
        return result;
    }

    public static List<ReportInfo> parseReportFromJSON(String response) {
        try {
            List<ReportInfo> reports = new ArrayList<ReportInfo>();
            if (response == null) {
                return reports;
            }
            JSONArray result = new JSONArray(response);

            for (int i = 0; i < result.length(); i++) {
                JSONObject report = result.getJSONObject(i);
                List<EquipmentReportInfo> reportInfoList = new ArrayList<EquipmentReportInfo>();

                JSONArray equipments = report.getJSONArray("equipments");
                for (int j = 0; j < equipments.length(); j++) {
                    EquipmentReportInfo reportInfo = new EquipmentReportInfo(
                            equipments.getJSONObject(j).getString("equipmentName"),
                            equipments.getJSONObject(j).getString("description"),
                            equipments.getJSONObject(j).getString("damaged"),
                            equipments.getJSONObject(j).getBoolean("status"),
                            equipments.getJSONObject(j).getString("solution"),
                            equipments.getJSONObject(j).getString("resolveTime"));
                    reportInfoList.add(reportInfo);
                }


                reports.add(new ReportInfo(report.getInt("reportId"), report.getString("username"),
                        report.getString("fullname"),report.getInt("classId"), report.getString("className"), report.getString("createTime"),
                        report.getString("evaluate"),  report.getInt("status"),report.getInt("damageLevel"),
                        report.getString("changedRoom"), reportInfoList ));
            }


            return reports;
        } catch (JSONException e) {
            Log.d("Utils", "Wrong JSON format");
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public static ClassroomDAO parseClassroomDAO(String json) {
        ClassroomDAO result = new ClassroomDAO();
        if (json == null) {
            return result;
        }

        try {
            JSONObject object = new JSONObject(json);

            result = new ClassroomDAO(object.getInt("classId"), object.getString("className"), object.getInt("damageLevel"));
            return result;
        }catch (Exception e) {
            e.printStackTrace();
            Log.d("Parse Class", "Json format incorrect!");

        }
        return result;
    }

    public static List<EquipmentCategory> parseEquipmentCategory(String json) {

        List<EquipmentCategory> result = new ArrayList<EquipmentCategory>();
        try {

            if (json == null) {
                return  result;
            }

            JSONArray listEquipments = new JSONArray(json);
            for (int i = 0; i < listEquipments.length(); i++) {
                JSONObject object = listEquipments.getJSONObject(i);
                EquipmentCategory equipment = new EquipmentCategory();
                equipment.setName(object.getString("name"));
                equipment.setImageUrl(object.getString("imageUrl"));
                equipment.setId(object.getString("id"));
                result.add(equipment);

            }
            return result;
        }catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
