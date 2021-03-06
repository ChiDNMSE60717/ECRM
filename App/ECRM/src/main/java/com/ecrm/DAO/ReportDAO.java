package com.ecrm.DAO;

import com.ecrm.DTO.StatisticDTO;
import com.ecrm.Entity.TblReportEntity;
import com.ecrm.Utils.Enumerable.*;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ChiDNMSE60717 on 5/30/2015.
 */
@Repository
public interface ReportDAO {

    public List<Integer> getDamagedRoom();

    public List<TblReportEntity> getLiveReportsInRoom(int room);

    public List<TblReportEntity> getReportByUserId(String username, int offset, int limit);

    public List<TblReportEntity> getPagingReportByUser(String username, int page, int size);

    public int getNumberOfUserReport(String username);

    public String getReportersInRoom(int room);

    public TblReportEntity getReportOfUsernameInDay(String username, int roomId);

    public TblReportEntity getReportNewest(int room);

    public List<TblReportEntity> getFinishReport(int limit, int offset);

    public int getNumberOfFinishReport();

    public List<TblReportEntity> getAllReport(int limit, int offset);

    public boolean createReport();

    public List<Integer> getReportByClassId(String status, int offset, int limit);

    public boolean resolveReport(int reportId, int equipmentId, String solution);

    public boolean updateDamageLevel(int damageLevel, int reportId);

    public boolean resolveAll(String solution);

    public boolean removeReport(int reportId);

    public List<StatisticDTO.StatisticRow> getNumberOfChangeRoomByMonth(int year);
}
