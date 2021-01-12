package com.campkok.camp.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class NoticePageData {
	private ArrayList<CampNoticeVO> list;
	private String pageNavi;
	
	public NoticePageData(ArrayList<CampNoticeVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
}
