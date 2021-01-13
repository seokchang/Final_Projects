package com.campkok.camplist.model.vo;

import java.util.ArrayList;

import com.campkok.camp.model.vo.CampVO;

public class CampListPageData {
	private ArrayList<CampVO> list;
	private String pageNavi;
	public CampListPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CampListPageData(ArrayList<CampVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<CampVO> getList() {
		return list;
	}
	public void setList(ArrayList<CampVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
