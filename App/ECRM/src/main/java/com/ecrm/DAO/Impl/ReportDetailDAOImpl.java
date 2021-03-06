package com.ecrm.DAO.Impl;

import com.ecrm.DAO.BaseDAO;
import com.ecrm.DAO.ReportDetailDAO;
import com.ecrm.Entity.TblReportDetailEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by ChiDNMSE60717 on 5/30/2015.
 */
@Repository
public class ReportDetailDAOImpl extends BaseDAO<TblReportDetailEntity, Integer> implements ReportDetailDAO {

    public ReportDetailDAOImpl() {
        super(TblReportDetailEntity.class);
    }

    @Override
    public List<TblReportDetailEntity> getReportDetailsInReport(int reportId) {

        Query query = entityManager.createQuery("SELECT rd " +
                "FROM TblReportDetailEntity rd " +
                "WHERE rd.reportId = :reportId");
        query.setParameter("reportId", reportId);

        List queryResult = query.getResultList();
        List<TblReportDetailEntity> result = new ArrayList<TblReportDetailEntity>();
        if(!queryResult.isEmpty()){
            for(Iterator i = queryResult.iterator(); i.hasNext();){
                TblReportDetailEntity item = (TblReportDetailEntity) i.next();
                result.add(item);
            }
        }

        return result;
    }

    @Override
    public List<TblReportDetailEntity> getUnresolveReportDetail(int equipmentId){
        Query q = entityManager.createQuery("Select rd from TblReportDetailEntity rd where rd.equipmentId = :equipmentId " +
                "and rd.status = false");
        q.setParameter("equipmentId", equipmentId);
        List<TblReportDetailEntity> tblReportDetailEntities = q.getResultList();
        return tblReportDetailEntities;
    }

    @Override
    public List<TblReportDetailEntity> getReportByClassId(int classId) {
        Query query = entityManager.createQuery("Select rd from TblReportDetailEntity rd join rd.tblReportByReportId re " +
                "where rd.status = false and re.classRoomId= :classId ");
        query.setParameter("classId", classId);

        return query.getResultList();
    }

    public List<TblReportDetailEntity> getReportFinishByClassID(int classID) {
        Query query = entityManager.createQuery("Select rd from TblReportDetailEntity rd join rd.tblReportByReportId re " +
                "where rd.status = true and re.classRoomId= :classId ");
        query.setParameter("classId", classID);

        return query.getResultList();
    }

    @Override
    public TblReportDetailEntity getReportDetail(int reportId, int equipmentId) {
        Query query = entityManager.createQuery("SELECT rd FROM TblReportDetailEntity rd WHERE rd.reportId = :report AND rd.equipmentId = :equipment");
        query.setParameter("report", reportId);
        query.setParameter("equipment", equipmentId);

        List queryResult = query.getResultList();
        if(!queryResult.isEmpty()) {
            return (TblReportDetailEntity) queryResult.get(0);
        }

        return null;
    }

    public List<TblReportDetailEntity> findAllReportDTInOneMonth(){
        Query query = entityManager.createQuery("select rd from TblReportDetailEntity rd, TblReportEntity r where r.id = rd.reportId and" +
                " r.createTime between DATE_FORMAT(CURDATE() ,'%Y-%m-01') and LAST_DAY(CURDATE())");
        List<TblReportDetailEntity> tblReportDetailEntities = query.getResultList();
        return tblReportDetailEntities;
    }
}
