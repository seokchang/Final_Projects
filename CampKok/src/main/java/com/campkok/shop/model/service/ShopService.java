package com.campkok.shop.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.shop.model.dao.ShopDao;
import com.campkok.shop.model.vo.Shop;
import com.campkok.shop.model.vo.ShopListPageData;

@Service
public class ShopService {

	@Autowired
	private ShopDao dao;

	public ShopListPageData shopList(int reqPage) {
		int numPerPage = 12;	// 한 페이지 당 게시물 수
		// 1 : 1~12, 2 : 13~24, 3 : 25~37
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<Shop> list = dao.selectList(start,end);
		
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
		
		// pageNavi 작성
		String pageNavi = "";
		
		// 이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/shopList.do?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='shopList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
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
			pageNavi += "<a href='/shopList.do?reqPage="+pageNo+"'>다음</a>";
		}
		ShopListPageData slpd = new ShopListPageData(list, pageNavi);
		return slpd;
	}
}
