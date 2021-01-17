package com.campkok.camp.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.camp.model.dao.CampDao;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;

@Service
public class CampService {
	@Autowired
	private CampDao dao;

	public CampRoomVO selectRoomInfo(int roomNo) {
		return dao.selectRoomInfo(roomNo);
	}

	public CampVO selectCampInfo(int campNo) {
		return dao.selectCampInfo(campNo);
	}

	public int campRes(int userNo, int campNo, int campRoomNo, String resInDate, String resOutDate, int resMember,
			int resPrice, String resMemo) {
		String resInTime = "15:00";
		String resOutTime = "10:00";
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userNo",userNo);
		map.put("campNo",campNo);
		map.put("campRoomNo",campRoomNo);
		map.put("resInDate",resInDate);
		map.put("resOutDate",resOutDate);
		map.put("resMember",resMember);
		map.put("resPrice",resPrice);
		map.put("resMemo",resMemo);
		map.put("resInTime",resInTime);
		map.put("resOutTime",resOutTime);
		return dao.campRes(map);
	}

	public UserVO selectUserPoint(int userNo) {
		return dao.selectUserPoint(userNo);
	}

	public int userPointUpdate(int userNo, int userUsePoint) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userNo",userNo);
		map.put("userUsePoint",userUsePoint);
		return dao.userPointUpdate(map);	
	}

	public int totalPoint(int userNo) {
		return dao.totalPoint(userNo);
	}

	public int pointUpdate(int userNo, int totalPoint, int userUsePoint) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("userNo",userNo);
		map.put("userUsePoint",userUsePoint);
		map.put("totalPoint",totalPoint);
		return dao.pointUpdate(map);
	}

	public int insertComment(String userId, int campNo, String revContents) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userId",userId);
		map.put("campNo",campNo);
		map.put("revContents", revContents);
		return dao.insertComment(map);
	}

	public ArrayList<ReviewVO> selectAllComment() {
		return dao.selectAllComment();
	}



}
