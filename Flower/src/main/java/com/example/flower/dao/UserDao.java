package com.example.flower.dao;

import com.example.flower.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public UserDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void addUser(User user) {
        String sql = "INSERT INTO user (username, userphone, password, name, phone, address, isadmin, isvalidate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, user.getUsername(), user.getUserphone(), user.getPassword(), user.getName(), user.getPhone(), user.getAddress(), user.isIsadmin(), user.isIsvalidate());
    }

    public boolean isUsernameExist(String username) {
        String sql = "SELECT COUNT(*) FROM user WHERE username = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{username}, Integer.class);
        return count > 0;
    }

    public boolean isUserphoneExist(String userphone) {
        String sql = "SELECT COUNT(*) FROM user WHERE userphone = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{userphone}, Integer.class);
        return count > 0;
    }

    public User selectByUsername(String username) {
        String sql = "SELECT * FROM user WHERE username = ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class), username).stream().findFirst().orElse(null);
    }

    public User selectByUserphone(String userphone) {
        String sql = "SELECT * FROM user WHERE userphone = ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class), userphone).stream().findFirst().orElse(null);
    }

    public User selectById(int id) {
        String sql = "SELECT * FROM user WHERE id = ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class), id).stream().findFirst().orElse(null);
    }

    public void updateUserAddress(User user) {
        String sql = "UPDATE user SET name = ?, phone = ?, address = ? WHERE id = ?";
        jdbcTemplate.update(sql, user.getName(), user.getPhone(), user.getAddress(), user.getId());
    }

    public void updatePwd(User user) {
        String sql = "UPDATE user SET password = ? WHERE id = ?";
        jdbcTemplate.update(sql, user.getPassword(), user.getId());
    }

    public int selectUserCount() {
        String sql = "SELECT COUNT(*) FROM user";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public List<User> selectUserList(int pageNo, int pageSize) {
        String sql = "SELECT * FROM user LIMIT ?, ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(User.class), (pageNo - 1) * pageSize, pageSize);
    }

    public void delete(int id) {
        String sql = "DELETE FROM user WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}