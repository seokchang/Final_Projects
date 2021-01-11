package com.campkok.admin.camp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.camp.model.vo.Camp;

@Repository
public class AdminCampDao {
	@Autowired
	private SqlSessionTemplate session;

	public Camp selectCampInfo(String ceoId) {
		return session.selectOne("adminCamp.selectCampInfo", ceoId);
	}
}
