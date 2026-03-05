package com.example.flower.dao;

import com.example.flower.model.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
public class GoodsDao {
    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public GoodsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Map<String, Object>> getScrollGood() {
        String sql = "SELECT g.id, g.name, g.cover, g.price FROM recommend r, goods g WHERE r.goods_id = g.id";
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String, Object>> getGoodsList(int recommendType) {
        String sql = "SELECT g.id, g.name, g.cover, g.price, t.name AS typename FROM recommend r, goods g, type t WHERE r.type = ? AND r.goods_id = g.id AND g.type_id = t.id";
        return jdbcTemplate.queryForList(sql, recommendType);
    }

    public List<Goods> selectGoodsByTypeID(int typeID, int pageNumber, int pageSize) {
        String sql;
        Object[] params;
        if (typeID == 0) {
            sql = "SELECT * FROM goods LIMIT ?, ?";
            params = new Object[]{(pageNumber - 1) * pageSize, pageSize};
        } else {
            sql = "SELECT * FROM goods WHERE type_id = ? LIMIT ?, ?";
            params = new Object[]{typeID, (pageNumber - 1) * pageSize, pageSize};
        }
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Goods.class), params);
    }

    public int getCountOfGoodsByTypeID(int typeID) {
        String sql;
        Object[] params;
        if (typeID == 0) {
            sql = "SELECT COUNT(*) FROM goods";
            params = new Object[]{};
        } else {
            sql = "SELECT COUNT(*) FROM goods WHERE type_id = ?";
            params = new Object[]{typeID};
        }
        return jdbcTemplate.queryForObject(sql, params, Integer.class);
    }

    public List<Goods> selectGoodsbyRecommend(int type, int pageNumber, int pageSize) {
        String sql;
        Object[] params;
        if (type == 0) {
            sql = "SELECT g.id, g.name, g.cover, g.image1, g.image2, g.intro, g.price, g.stock, t.name AS typename FROM goods g, type t WHERE g.type_id = t.id ORDER BY g.id LIMIT ?, ?";
            params = new Object[]{(pageNumber - 1) * pageSize, pageSize};
        } else {
            sql = "SELECT g.id, g.name, g.cover, g.image1, g.image2, g.intro, g.price, g.stock, t.name AS typename FROM goods g, recommend r, type t WHERE g.id = r.goods_id AND g.type_id = t.id AND r.type = ? ORDER BY g.id LIMIT ?, ?";
            params = new Object[]{type, (pageNumber - 1) * pageSize, pageSize};
        }
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Goods.class), params);
    }

    public int getRecommendCountOfGoodsByTypeID(int type) {
        if (type == 0) {
            return getCountOfGoodsByTypeID(0);
        }
        String sql = "SELECT COUNT(*) FROM recommend WHERE type = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{type}, Integer.class);
    }

    public Goods getGoodsById(int id) {
        String sql = "SELECT g.id, g.name, g.cover, g.image1, g.image2, g.price, g.intro, g.stock, t.id AS typeid, t.name AS typename FROM goods g, type t WHERE g.id = ? AND g.type_id = t.id";
        List<Goods> goodsList = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Goods.class), id);
        return goodsList.isEmpty() ? null : goodsList.get(0);
    }

    public int getSearchCount(String keyword) {
        String sql = "SELECT COUNT(*) FROM goods WHERE name LIKE ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{"%" + keyword + "%"}, Integer.class);
    }

    public List<Goods> selectSearchGoods(String keyword, int pageNumber, int pageSize) {
        String sql = "SELECT * FROM goods WHERE name LIKE ? LIMIT ?, ?";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Goods.class), "%" + keyword + "%", (pageNumber - 1) * pageSize, pageSize);
    }

    public boolean isScroll(Goods goods) {
        return isRecommend(goods, 1);
    }

    public boolean isHot(Goods goods) {
        return isRecommend(goods, 2);
    }

    public boolean isNew(Goods goods) {
        return isRecommend(goods, 3);
    }

    private boolean isRecommend(Goods goods, int type) {
        String sql = "SELECT COUNT(*) FROM recommend WHERE type = ? AND goods_id = ?";
        int count = jdbcTemplate.queryForObject(sql, new Object[]{type, goods.getId()}, Integer.class);
        return count > 0;
    }

    public void addRecommend(int id, int type) {
        String sql = "INSERT INTO recommend (type, goods_id) VALUES (?, ?)";
        jdbcTemplate.update(sql, type, id);
    }

    public void removeRecommend(int id, int type) {
        String sql = "DELETE FROM recommend WHERE type = ? AND goods_id = ?";
        jdbcTemplate.update(sql, type, id);
    }

    public void insert(Goods goods) {
        String sql = "INSERT INTO goods (name, cover, image1, image2, price, intro, stock, type_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, goods.getName(), goods.getCover(), goods.getImage1(), goods.getImage2(), goods.getPrice(), goods.getIntro(), goods.getStock(), goods.getType().getId());
    }

    public void update(Goods goods) {
        String sql = "UPDATE goods SET name = ?, cover = ?, image1 = ?, image2 = ?, price = ?, intro = ?, stock = ?, type_id = ? WHERE id = ?";
        jdbcTemplate.update(sql, goods.getName(), goods.getCover(), goods.getImage1(), goods.getImage2(), goods.getPrice(), goods.getIntro(), goods.getStock(), goods.getType().getId(), goods.getId());
    }

    public int delete(int id) {
        String sql = "DELETE FROM goods WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    public int deleteRecommendations(int goodsId) {
        String sql = "DELETE FROM recommend WHERE goods_id = ?";
        return jdbcTemplate.update(sql, goodsId);
    }

    /**
     * 减少商品库存
     * @param goodsId 商品ID
     * @param amount 减少的数量
     */
    public void decreaseStock(int goodsId, int amount) {
        String sql = "UPDATE goods SET stock = stock - ? WHERE id = ? AND stock >= ?";
        jdbcTemplate.update(sql, amount, goodsId, amount);
    }
}