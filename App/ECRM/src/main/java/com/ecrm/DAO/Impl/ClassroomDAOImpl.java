package com.ecrm.DAO.Impl;

import com.ecrm.DAO.BaseDAO;
import com.ecrm.DAO.ClassroomDAO;
import com.ecrm.Entity.TblClassroomEntity;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.Query;
import java.util.List;

/**
 * Created by Htang on 5/29/2015.
 */
@Repository
public class ClassroomDAOImpl extends BaseDAO<TblClassroomEntity, Integer> implements ClassroomDAO{
    public  ClassroomDAOImpl(){
        super(TblClassroomEntity.class);
    }

    @Override
    public int getId(String name) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblClassroomEntity c " +
                "WHERE c.name = :name");
        query.setParameter("name", name);

        List queryResult = query.getResultList();
        if(!queryResult.isEmpty()){
            TblClassroomEntity room = (TblClassroomEntity)queryResult.get(0);
            return room.getId();
        }

        return 0;
    }

    @Override
    public TblClassroomEntity getClassroomByName(String name) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblClassroomEntity c " +
                "WHERE c.name = :name and c.isDelete = false ");
        query.setParameter("name", name);

        List queryResult = query.getResultList();
        if(!queryResult.isEmpty()){
            return (TblClassroomEntity)queryResult.get(0);
        }

        return null;
    }

    @Transactional
    @Override
    public boolean updateDamageLevel(int damageLevel, int classId) {
        Query query = entityManager.createQuery("Update TblClassroomEntity r set r.damagedLevel = :damageLevel where r.id = :classId");
        query.setParameter("damageLevel", damageLevel);
        query.setParameter("classId", classId);

        int rows = query.executeUpdate();
        return rows > 0 ? true : false;

    }

    @Override
    public TblClassroomEntity getClassroomById(int id) {

        Query query = entityManager.createQuery("SELECT c " +
                "FROM TblClassroomEntity c " +
                "WHERE c.id = :id");
        query.setParameter("id", id);

        List queryResult = query.getResultList();
        if(!queryResult.isEmpty()){
            return (TblClassroomEntity)queryResult.get(0);
        }

        return null;
    }

    public List<TblClassroomEntity> getValidClassroom(){
        Query q = entityManager.createQuery("SELECT c from TblClassroomEntity c where c.isDelete = false and" +
                " c.damagedLevel <50");
        List<TblClassroomEntity> tblClassroomEntities = q.getResultList();
        return tblClassroomEntities;
    }

    public List<TblClassroomEntity> getAllClassroom(){
        Query q = entityManager.createQuery("SELECT c from TblClassroomEntity c where c.isDelete = false ORDER BY c.name ASC");
        List<TblClassroomEntity> tblClassroomEntities = q.getResultList();
        return tblClassroomEntities;
    }

    public List<TblClassroomEntity> getDamagedClassroom(){
        Query q = entityManager.createQuery("SELECT  c from TblClassroomEntity c where c.isDelete = false  and c.damagedLevel >=50");
        List<TblClassroomEntity> tblClassroomEntities = q.getResultList();
        return tblClassroomEntities;
    }
}
