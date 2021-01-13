package com.campkok.camplist.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.camp.model.vo.CampVO;

@Repository
public class CampListDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<CampVO> selectList(int start, int end) {
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List<CampVO> list = session.selectList("camp.selectAllCampList",map);
		return (ArrayList<CampVO>)list;
	}

	public int totalCount() {
		return session.selectOne("camp.totalCount");
	}

	public CampVO selectOneCamp(int campNo) {
		return session.selectOne("camp.selectOneCamp",campNo);
	}

}
