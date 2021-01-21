package com.campkok.shop.model.vo;

import java.util.ArrayList;

public class ShopListPageData {
	private ArrayList<Shop> list;
	private String pageNavi;
	public ShopListPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShopListPageData(ArrayList<Shop> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Shop> getList() {
		return list;
	}
	public void setList(ArrayList<Shop> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
