package com.example.flower.service;

import com.example.flower.dao.GoodsDao;
import com.example.flower.dao.OrderDao;
import com.example.flower.model.Goods;
import com.example.flower.model.Page;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GoodsService {
    @Autowired
    private final GoodsDao goodsDao;
    @Autowired
    private  OrderDao orderDao;

    @Autowired
    public GoodsService(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    public List<Map<String, Object>> getScrollGood() {
        return goodsDao.getScrollGood();
    }

    public List<Map<String, Object>> getGoodsList(int recommendType) {
        return goodsDao.getGoodsList(recommendType);
    }

    public List<Goods> selectGoodsByTypeID(int typeID, int pageNumber, int pageSize) {
        return goodsDao.selectGoodsByTypeID(typeID, pageNumber, pageSize);
    }

    public Page selectPageByTypeID(int typeID, int pageNumber) {
        Page page = new Page();
        page.setPageNumber(pageNumber);

        int totalCount = goodsDao.getCountOfGoodsByTypeID(typeID);
        page.setPageSizeAndTotalCount(8, totalCount);

        List<Goods> goodsList = goodsDao.selectGoodsByTypeID(typeID, pageNumber, 8);
        page.setList(goodsList);

        return page;
    }

    public Page getGoodsRecommendPage(int type, int pageNumber) {
        Page page = new Page();
        page.setPageNumber(pageNumber);

        int totalCount = goodsDao.getRecommendCountOfGoodsByTypeID(type);
        page.setPageSizeAndTotalCount(8, totalCount);

        List<Goods> goodsList = goodsDao.selectGoodsbyRecommend(type, pageNumber, 8);
        for (Goods goods : goodsList) {
            goods.setScroll(goodsDao.isScroll(goods));
            goods.setHot(goodsDao.isHot(goods));
            goods.setNew(goodsDao.isNew(goods));
        }
        page.setList(goodsList);

        return page;
    }

    public Goods getGoodsById(int id) {
        return goodsDao.getGoodsById(id);
    }

    public Page getSearchGoodsPage(String keyword, int pageNumber) {
        Page page = new Page();
        page.setPageNumber(pageNumber);

        int totalCount = goodsDao.getSearchCount(keyword);
        page.setPageSizeAndTotalCount(8, totalCount);

        List<Goods> goodsList = goodsDao.selectSearchGoods(keyword, pageNumber, 8);
        page.setList(goodsList);

        return page;
    }

    public void addRecommend(int id, int type) {
        goodsDao.addRecommend(id, type);
    }

    public void removeRecommend(int id, int type) {
        goodsDao.removeRecommend(id, type);
    }

    public void insert(Goods goods) {
        goodsDao.insert(goods);
    }

    public void update(Goods goods) {
        goodsDao.update(goods);
    }

    @Transactional
    public boolean delete(int id) {
        try {
            // 先删除关联的订单项
            orderDao.deleteOrderItemsByGoodsId(id);

            // 1. 删除商品相关的订单项
            orderDao.deleteOrderItemsByGoodsId(id);

            // 2. 删除商品相关的推荐记录
            goodsDao.deleteRecommendations(id);

            // 3. 删除商品
            return goodsDao.delete(id) > 0;
        } catch (Exception e) {
            return false;
        }
    }

}