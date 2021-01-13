package com.campkok.camplist.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.camp.model.vo.CampVO;
import com.campkok.camplist.model.dao.CampListDao;
import com.campkok.camplist.model.vo.CampListPageData;

@Service
public class CampListService {

	@Autowired
	private CampListDao dao;
	
	public CampListPageData campList(int reqPage) {
		int numPerPage = 12;	// 한 페이지당 게시물 수
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<CampVO> list = dao.selectList(start,end);
		
		/****** pageNavi ******/
		int totalCount = dao.totalCount();	// 총 게시물 수
		int totalPage = 0;	// 총 페이지 수
		
		// 109개일 경우 11페이지 보여주고, 100개면 10페이지 보여주는 코드
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		// pageNavi 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		// pageNavi 작성
		String pageNavi = "";
		
		// 이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/campList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='campList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		// 다음버튼
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/campList.do?reqPage="+pageNo+"'>다음</a>";
		}
		CampListPageData clpd = new CampListPageData(list, pageNavi);
		return clpd;
	}
	
	public CampVO selectOneCamp(int campNo) {
		CampVO c = dao.selectOneCamp(campNo);
		return c;
	}

}