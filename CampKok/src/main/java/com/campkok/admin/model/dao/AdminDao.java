package com.campkok.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.model.vo.CeoNotice;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	public int getTotalCeoNotice() {
		return session.selectOne("admin.getCeoNoticeCount");
	}

	public ArrayList<CeoNotice> selectCeoNoticeList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<CeoNotice> list = session.selectList("admin.selectCeoNoticeList", map);

		return (ArrayList<CeoNotice>) list;
	}

}
