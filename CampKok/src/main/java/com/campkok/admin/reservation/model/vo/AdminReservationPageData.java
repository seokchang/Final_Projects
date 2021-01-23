package com.campkok.admin.reservation.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class AdminReservationPageData {
	private ArrayList<Reservation> list;
	private String pageNavi;

	public AdminReservationPageData(ArrayList<Reservation> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
}
