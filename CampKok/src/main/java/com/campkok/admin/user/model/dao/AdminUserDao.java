package com.campkok.admin.user.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.user.model.vo.User;

@Repository
public class AdminUserDao {
	@Autowired
	private SqlSessionTemplate session;

	public int getTotalClientInfo() {
		return session.selectOne("adminUserInfo.getClientInfoCount");
	}

	public ArrayList<User> selectClientInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<User> list = session.selectList("adminUserInfo.selectClientInfoList", map);

		return (ArrayList<User>) list;
	}
}
