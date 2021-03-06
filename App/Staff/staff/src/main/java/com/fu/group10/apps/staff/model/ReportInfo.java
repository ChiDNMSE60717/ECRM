package com.fu.group10.apps.staff.model;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by QuangTV on 6/4/2015.
 */
public class ReportInfo implements Parcelable{
   private int roomId;
    private String roomName;
   private String timeReport;
   private int damageLevel;
   private String evaluate;
   private String userReport;
   private int systemEvaluate;
    private String changedRoom;
   private List<Equipment> equipments;


    public ReportInfo(int roomId, String roomName, String timeReport, int damageLevel, String evaluate,
                      String userReport, int systemEvaluate, String changedRoom, List<Equipment> equipments) {
        this.roomId = roomId;
        this.roomName = roomName;
        this.timeReport = timeReport;
        this.damageLevel = damageLevel;
        this.evaluate = evaluate;
        this.userReport = userReport;
        this.systemEvaluate = systemEvaluate;
        this.changedRoom = changedRoom;
        this.equipments = equipments;
    }

    public ReportInfo(Parcel in) {
        this.roomId = in.readInt();
        this.roomName = in.readString();
        this.timeReport = in.readString();
        this.damageLevel = in.readInt();
        this.evaluate = in.readString();
        this.userReport = in.readString();
        this.systemEvaluate = in.readInt();
        this.changedRoom = in.readString();
        if (equipments == null) {
            equipments = new ArrayList<Equipment>();
        }
        in.readTypedList(equipments, Equipment.CREATOR);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(roomId);
        parcel.writeString(roomName);
        parcel.writeString(timeReport);
        parcel.writeInt(damageLevel);
        parcel.writeString(evaluate);
        parcel.writeString(userReport);
        parcel.writeInt(systemEvaluate);
        parcel.writeString(changedRoom);
        parcel.writeTypedList(equipments);

    }

    public static final Parcelable.Creator CREATOR = new Parcelable.Creator() {
        public ReportInfo createFromParcel(Parcel in) {
            return new ReportInfo(in);
        }

        public ReportInfo[] newArray(int size) {
            return new ReportInfo[size];
        }
    };


    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getTimeReport() {
        return timeReport;
    }

    public void setTimeReport(String timeReport) {
        this.timeReport = timeReport;
    }

    public int getDamageLevel() {
        return damageLevel;
    }

    public void setDamageLevel(int damageLevel) {
        this.damageLevel = damageLevel;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public String getUserReport() {
        return userReport;
    }

    public void setUserReport(String userReport) {
        this.userReport = userReport;
    }

    public int getSystemEvaluate() {
        return systemEvaluate;
    }

    public void setSystemEvaluate(int systemEvaluate) {
        this.systemEvaluate = systemEvaluate;
    }

    public List<Equipment> getEquipments() {
        return equipments;
    }

    public void setEquipments(List<Equipment> equipments) {
        this.equipments = equipments;
    }


    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }


    public String getChangedRoom() {
        return changedRoom;
    }

    public void setChangedRoom(String changedRoom) {
        this.changedRoom = changedRoom;
    }
}
