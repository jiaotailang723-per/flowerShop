package com.example.flower.service;

import com.example.flower.dao.UserDao;
import com.example.flower.model.Page;
import com.example.flower.model.User;
import com.example.flower.utils.PasswordUtils;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private final UserDao userDao;

    @Autowired
    public UserService(UserDao userDao) {
        this.userDao = userDao;
    }

    @Transactional
    public boolean register(User user) {
        if (userDao.isUsernameExist(user.getUsername()) ||
                userDao.isUserphoneExist(user.getUserphone())) {
            return false;
        }

        try {
            // 对密码进行SHA-256加密
            String encryptedPassword = PasswordUtils.encrypt(user.getPassword());
            user.setPassword(encryptedPassword);
            userDao.addUser(user);
            return true;
        } catch (Exception e) {
            throw new RuntimeException("用户注册失败", e);
        }
    }

    public User login(String ue, String password) {
        // 先根据用户名查找用户
        User user = userDao.selectByUsername(ue);
        if (user != null) {
            // 验证密码（比较加密后的密码）
            if (PasswordUtils.matches(password, user.getPassword())) {
                return user;
            }
        }
        
        // 如果用户名查找失败，尝试根据手机号查找
        user = userDao.selectByUserphone(ue);
        if (user != null) {
            // 验证密码（比较加密后的密码）
            if (PasswordUtils.matches(password, user.getPassword())) {
                return user;
            }
        }
        
        return null;
    }

    public User selectById(int id) {
        return userDao.selectById(id);
    }

    // 补充原项目中缺失的方法
    public void updateUserAddress(User user) {
        userDao.updateUserAddress(user);
    }

    public void updatePwd(User user) {
        // 对新密码进行SHA-256加密
        String encryptedPassword = PasswordUtils.encrypt(user.getPassword());
        user.setPassword(encryptedPassword);
        userDao.updatePwd(user);
    }

    public Page getUserPage(int pageNumber) {
        Page page = new Page();
        page.setPageNumber(pageNumber);

        int totalCount = userDao.selectUserCount();
        page.setPageSizeAndTotalCount(7, totalCount);

        List<User> users = userDao.selectUserList(pageNumber, 7);
        page.setList(users);

        return page;
    }

    public boolean delete(int id) {
        try {
            userDao.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean isUsernameExist(String username) {
        return userDao.isUsernameExist(username);
    }

    public boolean isUserphoneExist(String userphone) {
        return userDao.isUserphoneExist(userphone);
    }
}