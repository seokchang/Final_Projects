package com.campkok.admin.user.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.user.model.dao.AdminUserDao;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;
import com.campkok.admin.user.model.vo.User;

@Service
public class AdminUserService {
	@Autowired
	private AdminUserDao dao;

	// ********** Client Info **********
	public AdminUserInfoPageData selectClientInfoList(int reqPage) {
		int totalClientInfo = dao.getTotalClientInfo();
		int numPerPage = 10;
		int totalPage = (totalClientInfo / numPerPage == 0) ? (totalClientInfo / numPerPage)
				: (totalClientInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.selectClientInfoList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전 버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectClientInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}

	// ********** CEO Info **********
	public AdminUserInfoPageData selectCeoInfoList(int reqPage) {
		int totalCeoInfo = dao.getTotalCeoInfo();
		int numPerPage = 10;
		int totalPage = (totalCeoInfo / numPerPage) == 0 ? (totalCeoInfo / numPerPage)
				: (totalCeoInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<User> list = dao.selectCeoInfoList(start, end);

		// 페이징
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;

			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCeoInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminUserInfoPageData auipd = new AdminUserInfoPageData(list, pageNavi);

		return auipd;
	}
}
