package com.campkok.camplist.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.camplist.model.vo.CampList;

@Repository
public class CampListDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<CampList> selectList(int start, int end) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List<CampList> list = session.selectList("camplist.selectAllCampList",map);
		return (ArrayList<CampList>)list;
	}

	public int totalCount() {
		return session.selectOne("camplist.totalCount");
	}

	public CampList selectOneCamp(int campNo) {
		return session.selectOne("camplist.selectOneCamp",campNo);
	}

}
