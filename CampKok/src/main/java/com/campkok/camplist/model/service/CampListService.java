package com.campkok.camplist.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.camp.model.vo.CampFile;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.notice.model.vo.CampNoticeVO;
import com.campkok.camplist.model.dao.CampListDao;
import com.campkok.camplist.model.vo.CampList;
import com.campkok.camplist.model.vo.CampListPageData;
import com.campkok.camplist.model.vo.CampRoomList;

@Service
public class CampListService {

	@Autowired
	private CampListDao dao;
	
	// 캠핑장 리스트
	public CampListPageData campList(int reqPage) {
		int numPerPage = 12;	// 한 페이지 당 게시물 수
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<CampList> list = dao.selectList(start,end);
		
		/****** pageNavi ******/
		int totalCount = dao.totalCount();	// 총 게시물 수
		int totalPage = 0;	// 총 페이지 수
		
		// 109개일 경우 11페이지 보여주고, 100개면 10페이지 보요주는 코드
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		// pageNavi 길이
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		// 10/5 2  10  11 
		
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
	
	// 캠핑장 상세 페이지
	public CampList selectOneCamp(int campNo) {
		CampList cl = dao.selectOneCamp(campNo);
		ArrayList<CampFile> campFiles = dao.selectCampFiles(campNo);
		cl.setCampFiles(campFiles);
		return cl;
	}

	// 캠핑장 검색
	public CampListPageData searchCampList(int reqPage, String searchSelect, String keyword) {
		int numPerPage = 12;
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<CampList> list = dao.searchCampList(start,end,searchSelect,keyword);
		
		/****** pageNavi ******/
		int totalSearchCampList = dao.totalSerchCampList(searchSelect, keyword);
		int totalPage = 0;
		
		if(totalSearchCampList%numPerPage == 0) {
			totalPage = totalSearchCampList/numPerPage;
		}else {
			totalPage = totalSearchCampList/numPerPage+1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/campList.do?reqPage="+(pageNo-1)+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>�씠�쟾</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='campList.do?reqPage="+pageNo+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='/campList.do?reqPage="+pageNo+"&searchSelect="+searchSelect+"&keyword="+keyword+"'>�떎�쓬</a>";
		}
		CampListPageData clpd = new CampListPageData(list, pageNavi);
		return clpd;
	}

	public ArrayList<CampList> mainAdCampList() {
		return dao.mainAdCampList();
	}

	public ArrayList<CampList> mainNewCampList() {
		return dao.mainNewCampList();
	}

	public ArrayList<CampList> mainCampRanking() {
		return dao.mainCampRanking();
	}

	public ArrayList<CampNoticeVO> selectCampNoticeList(int campNo) {
		return dao.selectCampNoticeList(campNo);
	}

	public ArrayList<ReviewVO> selectCampReviewList(int campNo) {
		return dao.selectCampReviewList(campNo);
	}

	public ArrayList<CampRoomList> campRoomList(int campNo) {
		return dao.campRoomList(campNo);
	}



}
