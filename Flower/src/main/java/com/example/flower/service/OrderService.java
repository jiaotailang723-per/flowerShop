package com.example.flower.service;

import com.example.flower.dao.GoodsDao;
import com.example.flower.dao.OrderDao;
import com.example.flower.model.Order;
import com.example.flower.model.OrderItem;
import com.example.flower.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class OrderService {
    private final OrderDao orderDao;
    private final GoodsDao goodsDao;

    @Autowired
    public OrderService(OrderDao orderDao, GoodsDao goodsDao) {
        this.orderDao = orderDao;
        this.goodsDao = goodsDao;
    }

    public void addOrder(Order order) {
        // 同步itemMap到itemList
        order.syncItemList();

        orderDao.insertOrder(order);
        int orderId = orderDao.getLastInsertId();
        order.setId(orderId);

        // 使用itemList保存订单项并减少库存
        for (OrderItem item : order.getItemList()) {
            item.getOrder().setId(orderId); // 设置关联订单ID
            orderDao.insertOrderItem(item);
            // 减少商品库存
            goodsDao.decreaseStock(item.getGoods().getId(), item.getAmount());
        }
    }

    public List<Order> selectAll(int userId) {
        List<Order> orders = orderDao.selectAll(userId);
        for (Order order : orders) {
            List<OrderItem> items = orderDao.selectAllItem(order.getId());
            order.setItemList(items);
        }
        return orders;
    }

    public Page getOrderPage(int status, int pageNumber) {
        Page page = new Page();
        page.setPageNumber(pageNumber);

        int totalCount = orderDao.getOrderCount(status);
        page.setPageSizeAndTotalCount(10, totalCount);

        List<Order> orders;
        
        if (status == 2) {
            // 已付款界面：需要特殊处理排序
            // 先获取所有符合条件的订单（不分页）
            List<Order> allOrders = orderDao.selectOrderListForStatus2();
            for (Order order : allOrders) {
                List<OrderItem> items = orderDao.selectAllItem(order.getId());
                order.setItemList(items);
            }
            
            // 自定义排序：已付款订单按时间递增，配送中和已完成按时间递减，且排在已付款后面
            orders = allOrders.stream()
                    .sorted((o1, o2) -> {
                        // 先按状态排序：2在前，然后3，最后4
                        int statusCompare = Integer.compare(
                            o1.getStatus() == 2 ? 1 : (o1.getStatus() == 3 ? 2 : 3),
                            o2.getStatus() == 2 ? 1 : (o2.getStatus() == 3 ? 2 : 3)
                        );
                        if (statusCompare != 0) {
                            return statusCompare;
                        }
                        
                        // 相同状态下，按时间排序
                        if (o1.getDatetime() == null && o2.getDatetime() == null) {
                            return 0;
                        }
                        if (o1.getDatetime() == null) {
                            return 1;
                        }
                        if (o2.getDatetime() == null) {
                            return -1;
                        }
                        
                        // status=2按时间递增，status=3和4按时间递减
                        if (o1.getStatus() == 2) {
                            return o1.getDatetime().compareTo(o2.getDatetime());
                        } else {
                            return o2.getDatetime().compareTo(o1.getDatetime());
                        }
                    })
                    .collect(Collectors.toList());
            
            // 手动分页
            int pageSize = 10;
            int offset = (pageNumber - 1) * pageSize;
            int end = Math.min(offset + pageSize, orders.size());
            if (offset < orders.size()) {
                orders = orders.subList(offset, end);
            } else {
                orders = new ArrayList<>();
            }
        } else {
            // 其他状态正常查询
            orders = orderDao.selectOrderList(status, pageNumber, 10);
            for (Order order : orders) {
                List<OrderItem> items = orderDao.selectAllItem(order.getId());
                order.setItemList(items);
            }
        }
        
        page.setList(orders);

        return page;
    }



    public void updateStatus(int id, int status) {
        orderDao.updateStatus(id, status);
    }

    @Transactional
    public void delete(int id) {
        orderDao.deleteOrder(id);
    }
}