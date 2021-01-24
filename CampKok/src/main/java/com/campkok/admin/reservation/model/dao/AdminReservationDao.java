package com.campkok.admin.reservation.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.reservation.model.vo.CampRoom;
import com.campkok.admin.reservation.model.vo.Reservation;

@Repository
public class AdminReservationDao {
	@Autowired
	private SqlSessionTemplate session;

	public CampRoom selectCampRoomInfo(int campRoom) {
		return session.selectOne("adminReservation.getCampRoomInfo", campRoom);
	}

	public int getTotalReservationCount(int userNo) {
		return session.selectOne("adminReservation.getTotalReservationCount", userNo);
	}

	public Reservation selectReservationInfo(int resNo) {
		return session.selectOne("adminReservation.selectReservationInfo", resNo);
	}

	public ArrayList<Reservation> selectReservationInfoList(int start, int end, int userNo) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("userNo", userNo);

		List<Reservation> list = session.selectList("adminReservation.selectReservationInfoList", map);

		return (ArrayList<Reservation>) list;
	}

}
