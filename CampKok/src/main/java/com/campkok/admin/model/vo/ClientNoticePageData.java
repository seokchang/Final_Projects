package com.campkok.admin.model.vo;

import java.util.ArrayList;

public class ClientNoticePageData {
	private ArrayList<ClientNotice> list;
	private String pageData;

	public ClientNoticePageData() {
		// TODO Auto-generated constructor stub
	}

	public ClientNoticePageData(ArrayList<ClientNotice> list, String pageData) {
		super();
		this.list = list;
		this.pageData = pageData;
	}

	public ArrayList<ClientNotice> getList() {
		return list;
	}

	public void setList(ArrayList<ClientNotice> list) {
		this.list = list;
	}

	public String getPageData() {
		return pageData;
	}

	public void setPageData(String pageData) {
		this.pageData = pageData;
	}
}
