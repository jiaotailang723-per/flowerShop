package com.example.flower.service;

import com.example.flower.dao.TypeDao;
import com.example.flower.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TypeService {
    private final TypeDao typeDao;

    @Autowired
    public TypeService(TypeDao typeDao) {
        this.typeDao = typeDao;
    }

    public List<Type> getAllType() {
        return typeDao.getAllType();
    }

    public Type selectTypeNameByID(int typeId) {
        return typeDao.selectTypeNameByID(typeId);
    }

    public Type select(int id) {
        return typeDao.select(id);
    }

    public void insert(Type type) {
        typeDao.insert(type);
    }

    public void update(Type type) {
        typeDao.update(type);
    }

    public boolean delete(int id) {
        try {
            typeDao.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}