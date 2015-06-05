package com.ecrm.Entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;

/**
 * Created by Htang on 6/5/2015.
 */
@Entity
@Table(name = "tblClassroom", schema = "dbo", catalog = "ecrm")
public class TblClassroomEntity {
    private int id;
    private Integer roomTypeId;
    private String name;
    private Integer damagedLevel;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Boolean isDelete;
    private TblRoomTypeEntity tblRoomTypeByRoomTypeId;
    private Collection<TblEquipmentEntity> tblEquipmentsById;
    private Collection<TblReportEntity> tblReportsById;
    private Collection<TblScheduleEntity> tblSchedulesById;

    @Id
    @GeneratedValue
    @Column(name = "Id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RoomTypeId")
    public Integer getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(Integer roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    @Basic
    @Column(name = "Name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "DamagedLevel")
    public Integer getDamagedLevel() {
        return damagedLevel;
    }

    public void setDamagedLevel(Integer damagedLevel) {
        this.damagedLevel = damagedLevel;
    }

    @Basic
    @Column(name = "CreateTime")
    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    @Basic
    @Column(name = "UpdateTime")
    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    @Basic
    @Column(name = "IsDelete")
    public Boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TblClassroomEntity that = (TblClassroomEntity) o;

        if (id != that.id) return false;
        if (roomTypeId != null ? !roomTypeId.equals(that.roomTypeId) : that.roomTypeId != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (damagedLevel != null ? !damagedLevel.equals(that.damagedLevel) : that.damagedLevel != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;
        if (updateTime != null ? !updateTime.equals(that.updateTime) : that.updateTime != null) return false;
        if (isDelete != null ? !isDelete.equals(that.isDelete) : that.isDelete != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (roomTypeId != null ? roomTypeId.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (damagedLevel != null ? damagedLevel.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (updateTime != null ? updateTime.hashCode() : 0);
        result = 31 * result + (isDelete != null ? isDelete.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "RoomTypeId", referencedColumnName = "Id", insertable = false, updatable = false)
    public TblRoomTypeEntity getTblRoomTypeByRoomTypeId() {
        return tblRoomTypeByRoomTypeId;
    }

    public void setTblRoomTypeByRoomTypeId(TblRoomTypeEntity tblRoomTypeByRoomTypeId) {
        this.tblRoomTypeByRoomTypeId = tblRoomTypeByRoomTypeId;
    }

    @OneToMany(mappedBy = "tblClassroomByClassroomId")
    public Collection<TblEquipmentEntity> getTblEquipmentsById() {
        return tblEquipmentsById;
    }

    public void setTblEquipmentsById(Collection<TblEquipmentEntity> tblEquipmentsById) {
        this.tblEquipmentsById = tblEquipmentsById;
    }

    @OneToMany(mappedBy = "tblClassroomByClassRoomId")
    public Collection<TblReportEntity> getTblReportsById() {
        return tblReportsById;
    }

    public void setTblReportsById(Collection<TblReportEntity> tblReportsById) {
        this.tblReportsById = tblReportsById;
    }

    @OneToMany(mappedBy = "tblClassroomByClassroomId")
    public Collection<TblScheduleEntity> getTblSchedulesById() {
        return tblSchedulesById;
    }

    public void setTblSchedulesById(Collection<TblScheduleEntity> tblSchedulesById) {
        this.tblSchedulesById = tblSchedulesById;
    }

    public TblClassroomEntity() {
    }

    public TblClassroomEntity(int id, Integer roomTypeId, String name, Integer damagedLevel, Timestamp createTime,
                              Timestamp updateTime, Boolean isDelete) {
        this.id = id;
        this.roomTypeId = roomTypeId;
        this.name = name;
        this.damagedLevel = damagedLevel;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.isDelete = isDelete;
    }
}
