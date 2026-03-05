package com.example.flower.model;

public class User {
    private int id;
    private String username;
    private String userphone;
    private String password;
    private String name;
    private String phone;
    private String address;
    private boolean isadmin = false;  // 字段名恢复为 isadmin
    private boolean isvalidate = false;

    // 修正 getter/setter 方法命名以匹配原有代码
    public boolean isIsadmin() {
        return isadmin;
    }

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

    public boolean isIsvalidate() {
        return isvalidate;
    }

    public void setIsvalidate(boolean isvalidate) {
        this.isvalidate = isvalidate;
    }

    // 以下原有代码保持不变
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User(int id, String username, String userphone, String password, String name, String phone, String address,
                boolean isadmin, boolean isvalidate) {
        super();
        this.id = id;
        this.username = username;
        this.userphone = userphone;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.isadmin = isadmin;
        this.isvalidate = isvalidate;
    }

    public User(String username, String userphone, String password, String name, String phone, String address) {
        this.username = username;
        this.userphone = userphone;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
    }

    public User() {
        super();
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", username=" + username + ", userphone=" + userphone + ", password=" + password
                + ", name=" + name + ", phone=" + phone + ", address=" + address + ", isadmin=" + isadmin
                + ", isvalidate=" + isvalidate + "]";
    }
}