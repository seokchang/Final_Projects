package com.campkok.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.shop.model.vo.Shop;

@Repository
public class ShopDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Shop> selectList(int start, int end) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Shop> list = sqlSession.selectList("shop.selectShopList",map);
		return (ArrayList<Shop>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("shop.totalCount");
	}
}
