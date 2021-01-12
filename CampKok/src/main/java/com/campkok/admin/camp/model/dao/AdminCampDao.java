package com.campkok.admin.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.camp.model.vo.Camp;

@Repository
public class AdminCampDao {
	@Autowired
	private SqlSessionTemplate session;

	public int getTotalCampCount() {
		return session.selectOne("adminCamp.getTotalCampCount");
	}

	public int getTotalSearchCampCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminCamp.getSearchCampInfoCount", map);
	}

	public Camp selectCampInfo(String userId) {
		return session.selectOne("adminCamp.selectCampInfo", userId);
	}

	public ArrayList<Camp> selectCampInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<Camp> list = session.selectList("adminCamp.selectCampInfoList", map);

		return (ArrayList<Camp>) list;
	}

	public ArrayList<Camp> searchCampInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<Camp> list = session.selectList("adminCamp.searchCampInfoList", map);

		return (ArrayList<Camp>) list;
	}
}
