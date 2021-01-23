package com.campkok.admin.reservation.model.vo;

import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.user.model.vo.User;

import lombok.Data;

@Data
public class Reservation {
	private int rNum;
	private int resNo;
	private int userNo;
	private int campNo;
	private int campRoom;
	private String resInTime;
	private String resOutTime;
	private String resInDate;
	private String resOutDate;
	private int resMember;
	private int resPrice;
	private String resMemo;
	private int resCount;
	private User clientInfo;
	private Camp campInfo;
	private CampRoom campRoomInfo;

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

}
