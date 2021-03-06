package com.ecrm.DTO;

import com.ecrm.Entity.TblClassroomEntity;
import com.ecrm.Entity.TblEquipmentEntity;
import com.ecrm.Entity.TblReportEntity;
import com.ecrm.Entity.TblRoomTypeEntity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by ChiDNMSE60717 on 6/13/2015.
 */
public class DamagedRoomDTO {
    private int roomId;
    private String roomName;
    private String reporters;
    private Date reportDate;
    private int damagedLevel;
    private boolean free;
    private String evaluate;

    private List<String> suggestRooms;
    private RoomTypeDTO roomtype;
    private List<EquipmentDamaged> equipmentCategory;
    private List<TblEquipmentEntity> equipment;

    public DamagedRoomDTO(TblClassroomEntity room, TblReportEntity report, List<TblEquipmentEntity> equipments) {
        this.roomId = room.getId();
        this.roomName = room.getName();
        this.reportDate = report.getCreateTime();
        this.evaluate = report.getEvaluate();
        this.equipment = equipments;
        this.free = false;

        this.equipmentCategory = new ArrayList<EquipmentDamaged>();
        int position = -1;

        for (TblEquipmentEntity item: equipments) {
            if(item.isStatus() == false) {
                position = checkContain(item.getCategoryId());
                if (position == -1) {
                    this.equipmentCategory.add(new EquipmentDamaged(item.getCategoryId(), item.getTblEquipmentCategoryByCategoryId().getName(), 0, item.getTblEquipmentCategoryByCategoryId().getImageUrl()));
                }
            }
        }

        for (TblEquipmentEntity item: equipments) {
            position = checkContain(item.getCategoryId());
            if (position != -1) {
                if (item.getSerialNumber() != null) {
                    this.equipmentCategory.get(position).getSerialNumber().add(item.getSerialNumber());
                }

                if(item.isStatus() == false && !item.getTblEquipmentCategoryByCategoryId().getName().equals("Bàn") && !item.getTblEquipmentCategoryByCategoryId().getName().equals("Ghế")) {
                    this.equipmentCategory.get(position).setSize(1);
                } else if((item.getTblEquipmentCategoryByCategoryId().getName().equals("Bàn") || item.getTblEquipmentCategoryByCategoryId().getName().equals("Ghế")) && "[0]".equals(item.getPosition()) == false) {
                    this.equipmentCategory.get(position).addSize();
                }
            }
        }
     }

    private int checkContain(int cate) {

        for (int i = 0; i < this.equipmentCategory.size(); i++){
            if(this.equipmentCategory.get(i).getId() == cate) {
                return i;
            }
        }

        return -1;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getReporters() {
        return reporters;
    }

    public void setReporters(String reporters) {
        this.reporters = reporters;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public int getDamagedLevel() {
        return damagedLevel;
    }

    public void setDamagedLevel(int damagedLevel) {
        this.damagedLevel = damagedLevel;
    }

    public boolean isFree() {
        return free;
    }

    public void setFree(boolean free) {
        this.free = free;
    }

    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate;
    }

    public List<String> getSuggestRooms() {
        return suggestRooms;
    }

    public void setSuggestRooms(List<String> suggestRooms) {
        this.suggestRooms = suggestRooms;
    }

    public RoomTypeDTO getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(RoomTypeDTO roomtype) {
        this.roomtype = roomtype;
    }

    public List<EquipmentDamaged> getEquipmentCategory() {
        return equipmentCategory;
    }

    public void setEquipmentCategory(List<EquipmentDamaged> equipmentCategory) {
        this.equipmentCategory = equipmentCategory;
    }

    public List<TblEquipmentEntity> getEquipment() {
        return equipment;
    }

    public void setEquipment(List<TblEquipmentEntity> equipment) {
        this.equipment = equipment;
    }

    public class EquipmentDamaged {
        private int id;
        private int size;
        private String name;
        private String urlImage;
        private List<String> serialNumber;

        public EquipmentDamaged(int id, String name, int size, String urlImage){
            this.id = id;
            this.name = name;
            this.size = size;
            this.urlImage = urlImage;
            this.serialNumber = new ArrayList<String>();
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getSize() {
            return size;
        }

        public void setSize(int size) {
            this.size = size;
        }

        public void addSize() {
            this.size++;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getUrlImage() {
            return urlImage;
        }

        public void setUrlImage(String urlImage) {
            this.urlImage = urlImage;
        }

        public List<String> getSerialNumber() {
            return serialNumber;
        }

        public void setSerialNumber(List<String> serialNumber) {
            this.serialNumber = serialNumber;
        }

        @Override
        public String toString() {
            return " " + this.name;
        }
    }
}
