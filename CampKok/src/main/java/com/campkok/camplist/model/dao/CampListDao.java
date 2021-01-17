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

	public int totalSerchCampList(String searchSelect, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchSelect", searchSelect);
		map.put("keyword", keyword);
		return session.selectOne("camplist.totalSearchCampList",map);
	}

	public ArrayList<CampList> searchCampList(int start, int end, String searchSelect, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchSelect", searchSelect);
		map.put("keyword", keyword);
		List<CampList> list = session.selectList("camplist.searchCampList",map);
		return (ArrayList<CampList>)list;
	}

	public ArrayList<CampList> mainAdCampList() {
		List<CampList> adCampList = session.selectList("camplist.mainAdCampList");
		return (ArrayList<CampList>) adCampList;
	}

	public ArrayList<CampList> mainNewCampList() {
		List<CampList> newCampList = session.selectList("camplist.mainNewCampList");
		return (ArrayList<CampList>) newCampList;
	}

	public ArrayList<CampList> mainCampRanking() {
		List<CampList> campRanking = session.selectList("camplist.mainCampRanking");
		return (ArrayList<CampList>) campRanking; 
	}

}
