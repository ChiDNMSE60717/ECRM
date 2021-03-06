package com.ecrm.Entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

/**
 * Created by Htang on 6/5/2015.
 */
@Entity
@Table(name = "tblUser")
public class TblUserEntity {
    private int roleId;
    private String username;
    private String password;
    private boolean status;
    private List<TblReportEntity> tblReportsByUsername;
    private List<TblScheduleEntity> tblSchedulesByUsername;
    private TblRoleEntity tblRoleByRoleId;
    private TblUserInfoEntity tblUserInfoByUsername;
    private List<TblMessageEntity> tblMessageById;

    public TblUserEntity() {
    }

    public TblUserEntity(String username, String password, boolean status) {
        this.username = username;
        this.password = password;
        this.status = status;
        this.roleId = 1;
    }

    @Basic
    @Column(name = "RoleId")
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    @Id
    @Column(name = "Username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "Password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "Status")
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TblUserEntity that = (TblUserEntity) o;

        if (roleId != that.roleId) return false;
        if (status != that.status) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (status ? 1 : 0);
        return result;
    }

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "tblUserByUserId")
    public List<TblReportEntity> getTblReportsByUsername() {
        return tblReportsByUsername;
    }

    public void setTblReportsByUsername(List<TblReportEntity> tblReportsByUsername) {
        this.tblReportsByUsername = tblReportsByUsername;
    }

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "tblUserByUserId")
    public List<TblScheduleEntity> getTblSchedulesByUsername() {
        return tblSchedulesByUsername;
    }

    public void setTblSchedulesByUsername(List<TblScheduleEntity> tblSchedulesByUsername) {
        this.tblSchedulesByUsername = tblSchedulesByUsername;
    }

    @ManyToOne
    @JoinColumn(name = "RoleId", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public TblRoleEntity getTblRoleByRoleId() {
        return tblRoleByRoleId;
    }

    public void setTblRoleByRoleId(TblRoleEntity tblRoleByRoleId) {
        this.tblRoleByRoleId = tblRoleByRoleId;
    }

    @OneToOne(mappedBy = "tblUserByUsername")
    public TblUserInfoEntity getTblUserInfoByUsername() {
        return tblUserInfoByUsername;
    }

    public void setTblUserInfoByUsername(TblUserInfoEntity tblUserInfoByUsername) {
        this.tblUserInfoByUsername = tblUserInfoByUsername;
    }

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(mappedBy = "tblUserByUsername")
    public List<TblMessageEntity> getTblMessageById() {
        return tblMessageById;
    }

    public void setTblMessageById(List<TblMessageEntity> tblMessageById) {
        this.tblMessageById = tblMessageById;
    }
}
