package com.campkok.camp.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.camp.model.dao.CampDao;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;

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


}
