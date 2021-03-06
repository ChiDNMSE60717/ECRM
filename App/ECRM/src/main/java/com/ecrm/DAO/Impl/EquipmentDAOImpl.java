package com.ecrm.DAO.Impl;

import com.ecrm.DAO.BaseDAO;
import com.ecrm.DAO.EquipmentDAO;
import com.ecrm.Entity.TblEquipmentCategoryEntity;
import com.ecrm.Entity.TblEquipmentEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Htang on 6/1/2015.
 */
@Repository
public class EquipmentDAOImpl extends BaseDAO<TblEquipmentEntity, Integer> implements EquipmentDAO {

    public EquipmentDAOImpl() {
        super(TblEquipmentEntity.class);
    }

    public List<TblEquipmentEntity> findAllE(){
        Query q = entityManager.createQuery("select e from TblEquipmentEntity e");
        List<TblEquipmentEntity> tblEquipmentEntities =  q.getResultList();
        return tblEquipmentEntities;
    }

    @Override
    public List<TblEquipmentEntity> getEquipmentsInClassroom(int roomId) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblEquipmentEntity c " +
                "WHERE c.classroomId = :roomId");
        query.setParameter("roomId", roomId);

        List queryResult = query.getResultList();
        List<TblEquipmentEntity> result = new ArrayList<TblEquipmentEntity>();
        if (!queryResult.isEmpty()) {
            for (Iterator i = queryResult.iterator(); i.hasNext(); ) {
                TblEquipmentEntity item = (TblEquipmentEntity) i.next();
                result.add(item);
            }
        }

        return result;
    }

    @Override
    public TblEquipmentEntity findEquipmentHavePosition(int roomId, int category, String position, String serialNumber) {

        Query query;

        if(serialNumber == null) {
            query = entityManager.createQuery("SELECT c " +
                    "FROM TblEquipmentEntity c " +
                    "WHERE c.classroomId = :roomId " +
                    "AND c.categoryId = :category " +
                    "AND c.position = :position " +
                    "AND c.serialNumber IS NULL");
        } else {
            query = entityManager.createQuery("SELECT c " +
                    "FROM TblEquipmentEntity c " +
                    "WHERE c.classroomId = :roomId " +
                    "AND c.categoryId = :category " +
                    "AND c.position = :position");
        }
        query.setParameter("position", position);
        query.setParameter("roomId", roomId);
        query.setParameter("category", category);

        List queryResult = query.getResultList();
        if (!queryResult.isEmpty()) {
            return (TblEquipmentEntity) queryResult.get(0);
        }

        return null;
    }

    @Override
    public TblEquipmentEntity getEquipmentBySerialNumber(int roomId, String serialNumber) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblEquipmentEntity c " +
                "WHERE c.classroomId = :roomId " +
                "AND c.serialNumber = :serialNumber");
        query.setParameter("roomId", roomId);
        query.setParameter("serialNumber", serialNumber);

        List queryResult = query.getResultList();
        if (!queryResult.isEmpty()) {
            return (TblEquipmentEntity)queryResult.get(0);
        }

        return null;
    }

    @Override
    public String getDamagedEquipmentNames(int reportId) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblEquipmentCategoryEntity c " +
                "WHERE c.id IN (SELECT e.categoryId " +
                                "FROM TblEquipmentEntity e " +
                                "WHERE e.id IN (SELECT rd.equipmentId " +
                                                "FROM TblReportDetailEntity rd " +
                                                "WHERE rd.reportId = :reportId " +
                                                "GROUP BY rd.equipmentId))");
        query.setParameter("reportId", reportId);

        List queryResult = query.getResultList();
        String result = "";
        if (!queryResult.isEmpty()){
            for (Iterator i = queryResult.iterator(); i.hasNext();){
                result += ((TblEquipmentCategoryEntity) i.next()).getName() + ", ";
            }
            return result.substring(0, result.length()-2);
        }

        return null;
    }

    @Override
    public List<TblEquipmentEntity> getDamagedEquipmentsInReport(int reportId) {
        Query query = entityManager.createQuery("SELECT e " +
                                                "FROM TblEquipmentEntity e " +
                                                "WHERE e.id IN (SELECT rd.equipmentId " +
                                                                "FROM TblReportDetailEntity rd " +
                                                                "WHERE rd.reportId = :reportId " +
                                                                "GROUP BY rd.equipmentId)");
        query.setParameter("reportId", reportId);

        List result = query.getResultList();
        if(!result.isEmpty()) {
            return result;
        }

        return new ArrayList<TblEquipmentEntity>();
    }

    //    @Override
//    public List<TblEquipmentEntity> getActiveEquipments(int roomId) {
//
//        Query query = entityManager.createQuery("SELECT c " +
//                "FROM TblEquipmentEntity c " +
//                "WHERE c.classroomId = :roomId " +
//                "AND c.position != null");
//        query.setParameter("roomId", roomId);
//
//        List queryResult = query.getResultList();
//        List<TblEquipmentEntity> result = new ArrayList<TblEquipmentEntity>();
//        if (!queryResult.isEmpty()) {
//            for (Iterator i = queryResult.iterator(); i.hasNext(); ) {
//                TblEquipmentEntity item = (TblEquipmentEntity) i.next();
//                result.add(item);
//            }
//        }
//
//        return result;
//    }

    @Override
    public List<TblEquipmentEntity> getDamagedEquipments(int roomId) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblEquipmentEntity c " +
                "WHERE c.classroomId = :roomId " +
                "AND c.status = false");
        query.setParameter("roomId", roomId);

        List queryResult = query.getResultList();
        List<TblEquipmentEntity> result = new ArrayList<TblEquipmentEntity>();
        if (!queryResult.isEmpty()) {
            for (Iterator i = queryResult.iterator(); i.hasNext(); ) {
                TblEquipmentEntity item = (TblEquipmentEntity) i.next();
                result.add(item);
            }
        }

        return result;
    }

    @Override
    public List<TblEquipmentEntity> getDamagedEquipmentsByCategory(int roomId, int category) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblEquipmentEntity c " +
                "WHERE c.classroomId = :roomId " +
                "AND c.status = false " +
                "And c.categoryId = :category");
        query.setParameter("roomId", roomId);
        query.setParameter("category", category);

        List queryResult = query.getResultList();
        List<TblEquipmentEntity> result = new ArrayList<TblEquipmentEntity>();
        if (!queryResult.isEmpty()) {
            for (Iterator i = queryResult.iterator(); i.hasNext(); ) {
                TblEquipmentEntity item = (TblEquipmentEntity) i.next();
                result.add(item);
            }
        }

        return result;
    }

    public List<TblEquipmentEntity> getProjector(int classroomId){
        Query q = entityManager.createQuery("select e from TblEquipmentEntity e where e.classroomId =:classroomId " +
                "and e.serialNumber!=null and e.name != null and e.isDelete = false");
        q.setParameter("classroomId", classroomId);
        List<TblEquipmentEntity> tblEquipmentEntities = q.getResultList();
        return tblEquipmentEntities;
    }

    public List<TblEquipmentEntity> getEquipmentBySN(String serialNumber){
        Query q = entityManager.createQuery("select e from TblEquipmentEntity e where e.serialNumber =:serialNumber");
        q.setParameter("serialNumber", serialNumber);
        List<TblEquipmentEntity> tblEquipmentEntities = q.getResultList();
        return tblEquipmentEntities;
    }

    public List<TblEquipmentEntity> getEquipmentByCategory(int categoryId){
        Query query = entityManager.createQuery("select e from TblEquipmentEntity e where " +
                "e.categoryId =:categoryId and e.status = true and e.isDelete = false and " +
                "e.classroomId = null and e.serialNumber != null");
        query.setParameter("categoryId", categoryId);
        List<TblEquipmentEntity> tblEquipmentEntities = query.getResultList();
        return tblEquipmentEntities;
    }

    public List<TblEquipmentEntity> getEquipmentByCategoryAndClassroomId(int categoryId, int classroomId){
        Query query = entityManager.createQuery("select e from TblEquipmentEntity e where " +
                "e.categoryId =:categoryId and e.status = true and e.isDelete = false and " +
                "e.classroomId =:classroomId and e.serialNumber != null");
        query.setParameter("categoryId", categoryId);
        query.setParameter("classroomId", classroomId);
        List<TblEquipmentEntity> tblEquipmentEntities = query.getResultList();
        return tblEquipmentEntities;
    }

    public List<TblEquipmentEntity> getAllEquipmentOrderByClassroom(){
        Query query = entityManager.createQuery("select e from TblEquipmentEntity e, TblEquipmentCategoryEntity ec where " +
                "e.categoryId = ec.id and ec.isManaged = true and e.name !=null and e.serialNumber != null order by e.classroomId");
        List<TblEquipmentEntity> tblEquipmentEntities = query.getResultList();
        return tblEquipmentEntities;
    }
}
