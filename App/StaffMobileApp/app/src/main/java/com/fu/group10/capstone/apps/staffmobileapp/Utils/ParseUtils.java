package com.fu.group10.capstone.apps.staffmobileapp.Utils;


import android.util.Log;

import com.fu.group10.capstone.apps.staffmobileapp.model.ClassInfo;
import com.fu.group10.capstone.apps.staffmobileapp.model.Equipment;
import com.fu.group10.capstone.apps.staffmobileapp.model.EquipmentCategory;
import com.fu.group10.capstone.apps.staffmobileapp.model.ReportInfo;
import com.fu.group10.capstone.apps.staffmobileapp.model.Result;
import com.fu.group10.capstone.apps.staffmobileapp.model.User;
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

    public static User parseUserJson(String json) {
        User result = new User();
        try {
            if (json == null) {
                return result;
            }

            JSONObject user = new JSONObject(json);

            // Get movie object
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

    public static List<ReportInfo> parseReportFromJSON(String response) {
        try {
            List<ReportInfo> reports = new ArrayList<ReportInfo>();
            if (response == null) {
                return reports;
            }
            JSONArray result = new JSONArray(response);
            for (int i = 0; i < result.length(); i++) {
                JSONObject report = result.getJSONObject(i);
                JSONArray equipments = report.getJSONArray("equipments");
                List<Equipment> equipmentList = new ArrayList<Equipment>();
                for (int j = 0; j < equipments.length(); j++) {
                    JSONObject equipment = equipments.getJSONObject(j);

                    equipmentList.add(new Equipment(equipment.getInt("reportId"), equipment.getString("equipmentName"),
                            equipment.getInt("quantity"), equipment.getBoolean("status"), equipment.getString("evaluate"),
                            equipment.getString("damage")));


                }

                reports.add(new ReportInfo(
                        result.getJSONObject(i).getInt("roomId"),
                        result.getJSONObject(i).getString("roomName"),
                        result.getJSONObject(i).getString("timeReport"),
                        result.getJSONObject(i).getInt("damageLevel"),
                        result.getJSONObject(i).getString("evaluate"),
                        result.getJSONObject(i).getString("userReport"),
                        result.getJSONObject(i).getInt("systemEvaluate"), result.getJSONObject(i).getString("changedRoom"),
                        equipmentList
                ));
            }


            return reports;
        } catch (JSONException e) {
            Log.d("Utils", "Wrong JSON format");
            e.printStackTrace();
            return new ArrayList<ReportInfo>();
        }
    }

    public static Result parseResult(String json) {
        Result result = new Result();
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

    public static String[] parseListRoom(String json) {

        try {
            JSONArray jsonListRoom = new JSONArray(json);
            if (jsonListRoom.length() == 0) {
                return new String[0];
            }
            String[] result = new String[jsonListRoom.length()];
            for (int i = 0; i < jsonListRoom.length(); i++) {
                result[i] = jsonListRoom.getString(i);
            }
            return result;


        } catch (Exception e) {
            e.printStackTrace();

        }
        return new String[0];
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
                equipment.setId(object.getString("id"));
                equipment.setName(object.getString("name"));
                equipment.setImageUrl(object.getString("imageUrl"));
                result.add(equipment);

            }
            return result;
        }catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<EquipmentCategory>();
        }
    }

    public static List<List<ClassInfo>> parseClassInfo(String json) {
        List<List<ClassInfo>> result = new ArrayList<>();
        try {
            if (json == null) {
                return result;
            }

            JSONArray listClass = new JSONArray(json);
            for (int i = 0; i < listClass.length(); i++) {
                List<ClassInfo> infos = new ArrayList<>();
                JSONArray listRoom = listClass.getJSONArray(i);
                for (int j = 0; j < listRoom.length(); j++) {
                    ClassInfo info = new ClassInfo();
                    JSONObject object = listRoom.getJSONObject(j);
                    info.setDamageLevel(object.getInt("damageLevel"));
                    info.setName(object.getString("className"));
                    info.setId(object.getInt("classId"));
                    infos.add(info);
                }
                result.add(infos);
            }

            return result;
        } catch (Exception e) {
            Log.d("Parse JSON", "Wrong format");
            e.printStackTrace();
        }
        return result;
    }
}
