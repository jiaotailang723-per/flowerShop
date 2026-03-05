package com.example.flower.dao;

import com.example.flower.model.Order;
import com.example.flower.model.OrderItem;
import com.example.flower.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@Repository
public class OrderDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertOrder(Order order) {
        String sql = "INSERT INTO `order`(total, amount, status, paytype, name, phone, address, datetime, user_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, order.getTotal(), order.getAmount(), order.getStatus(), order.getPaytype(), order.getName(), order.getPhone(), order.getAddress(), order.getDatetime(), order.getUser().getId());
    }

    public int getLastInsertId() {
        String sql = "SELECT last_insert_id()";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    public void insertOrderItem(OrderItem item) {
        String sql = "INSERT INTO orderitem(price, amount, goods_id, order_id) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, item.getPrice(), item.getAmount(), item.getGoods().getId(), item.getOrder().getId());
    }

    public List<Order> selectAll(int userid) {
        String sql = "SELECT * FROM `order` WHERE user_id = ? ORDER BY datetime DESC";
        return jdbcTemplate.query(sql, new Object[]{userid}, (rs, rowNum) -> {
            Order order = new Order();
            order.setId(rs.getInt("id"));
            order.setTotal(rs.getFloat("total"));
            order.setAmount(rs.getInt("amount"));
            order.setStatus(rs.getInt("status"));
            order.setPaytype(rs.getInt("paytype"));
            order.setName(rs.getString("name"));
            order.setPhone(rs.getString("phone"));
            order.setAddress(rs.getString("address"));
            order.setDatetime(rs.getTimestamp("datetime"));
            // 注意：这里不设置user对象，因为列表页不需要完整用户信息
            return order;
        });
    }

    public List<OrderItem> selectAllItem(int orderid) {
        String sql = "SELECT i.id, i.price, i.amount, g.name as goods_name " +
                "FROM orderitem i, goods g " +
                "WHERE order_id = ? AND i.goods_id = g.id";
        return jdbcTemplate.query(sql, new Object[]{orderid}, (rs, rowNum) -> {
            OrderItem orderItem = new OrderItem();
            orderItem.setId(rs.getInt("id"));
            orderItem.setPrice(rs.getFloat("price"));
            orderItem.setAmount(rs.getInt("amount"));
            orderItem.setGoodsName(rs.getString("goods_name")); // 设置商品名称
            return orderItem;
        });
    }

    public int getOrderCount(int status) {
        if (status == 0) {
            String sql = "SELECT COUNT(*) FROM `order`";
            return jdbcTemplate.queryForObject(sql, Integer.class);
        } else if (status == 2) {
            // 已付款界面需要显示已付款、配送中、已完成的订单
            String sql = "SELECT COUNT(*) FROM `order` WHERE status IN (2, 3, 4)";
            return jdbcTemplate.queryForObject(sql, Integer.class);
        } else {
            String sql = "SELECT COUNT(*) FROM `order` WHERE status = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{status}, Integer.class);
        }
    }

    public List<Order> selectOrderList(int status, int pageNumber, int pageSize) {
        int offset = (pageNumber - 1) * pageSize;

        if (status == 0) {
            String sql = "SELECT o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, o.datetime, u.username " +
                    "FROM `order` o, user u WHERE o.user_id = u.id ORDER BY o.datetime DESC LIMIT ?, ?";
            return jdbcTemplate.query(sql, new Object[]{offset, pageSize}, (rs, rowNum) -> {
                return createOrderFromResultSet(rs);
            });
        } else if (status == 2) {
            // 已付款界面：显示已付款、配送中、已完成的订单
            // 注意：这里的排序会在Service层重新处理，所以这里只做简单排序
            String sql = "SELECT o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, o.datetime, u.username " +
                    "FROM `order` o, user u WHERE o.user_id = u.id AND o.status IN (2, 3, 4) " +
                    "ORDER BY o.status, o.datetime DESC LIMIT ?, ?";
            return jdbcTemplate.query(sql, new Object[]{offset, pageSize}, (rs, rowNum) -> {
                return createOrderFromResultSet(rs);
            });
        } else {
            String sql = "SELECT o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, o.datetime, u.username " +
                    "FROM `order` o, user u WHERE o.user_id = u.id AND o.status = ? ORDER BY o.datetime DESC LIMIT ?, ?";
            return jdbcTemplate.query(sql, new Object[]{status, offset, pageSize}, (rs, rowNum) -> {
                return createOrderFromResultSet(rs);
            });
        }
    }

    /**
     * 获取所有已付款相关的订单（status IN (2,3,4)），用于已付款界面的特殊排序
     */
    public List<Order> selectOrderListForStatus2() {
        String sql = "SELECT o.id, o.total, o.amount, o.status, o.paytype, o.name, o.phone, o.address, o.datetime, u.username " +
                "FROM `order` o, user u WHERE o.user_id = u.id AND o.status IN (2, 3, 4)";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            return createOrderFromResultSet(rs);
        });
    }

    private Order createOrderFromResultSet(ResultSet rs) throws SQLException {
        Order order = new Order();
        order.setId(rs.getInt("id"));
        order.setTotal(rs.getFloat("total"));
        order.setAmount(rs.getInt("amount"));
        order.setStatus(rs.getInt("status"));
        order.setPaytype(rs.getInt("paytype"));
        order.setName(rs.getString("name"));
        order.setPhone(rs.getString("phone"));
        order.setAddress(rs.getString("address"));
        order.setDatetime(rs.getTimestamp("datetime"));

        User user = new User();
        user.setUsername(rs.getString("username"));
        order.setUser(user);

        return order;
    }

    public void updateStatus(int id, int status) {
        String sql = "UPDATE `order` SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }

    @Transactional
    public void deleteOrder(int id) {
        String sql1 = "DELETE FROM orderitem WHERE order_id = ?";
        String sql2 = "DELETE FROM `order` WHERE id = ?";
        jdbcTemplate.update(sql1, id);
        jdbcTemplate.update(sql2, id);
    }

    public void deleteOrderItemsByGoodsId(int goodsId) {
        String sql = "DELETE FROM orderitem WHERE goods_id = ?";
        jdbcTemplate.update(sql, goodsId);
    }
}