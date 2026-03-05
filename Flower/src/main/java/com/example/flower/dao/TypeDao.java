package com.example.flower.dao;

import com.example.flower.model.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TypeDao {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public TypeDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Type> getAllType() {
        String sql = "SELECT * FROM type";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Type.class));
    }

    public Type selectTypeNameByID(int typeid) {
        String sql = "SELECT * FROM type WHERE id = ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Type.class), typeid).stream().findFirst().orElse(null);
    }

    public Type select(int id) {
        String sql = "SELECT * FROM type WHERE id = ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Type.class), id).stream().findFirst().orElse(null);
    }

    public void insert(Type type) {
        String sql = "INSERT INTO type (name) VALUES (?)";
        jdbcTemplate.update(sql, type.getName());
    }

    public void update(Type type) {
        String sql = "UPDATE type SET name = ? WHERE id = ?";
        jdbcTemplate.update(sql, type.getName(), type.getId());
    }

    public void delete(int id) {
        String sql = "DELETE FROM type WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}