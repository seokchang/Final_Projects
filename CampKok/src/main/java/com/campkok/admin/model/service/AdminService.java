package com.campkok.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.model.dao.AdminDao;
import com.campkok.admin.model.vo.CeoNotice;
import com.campkok.admin.model.vo.CeoNoticePageData;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public CeoNotice selectCeoNotice(String ceoNoticeTitle) {
		CeoNotice notice = dao.selectCeoNotice(ceoNoticeTitle);

		return notice;
	}

	public CeoNoticePageData selectCeoNoticeList(int reqPage) {
		int totalCeoNotice = dao.getTotalCeoNotice();
		int numPerPage = 10;
		int totalPage = (totalCeoNotice / numPerPage == 0) ? (totalCeoNotice / numPerPage)
				: (totalCeoNotice / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<CeoNotice> list = dao.selectCeoNoticeList(start, end);

		// 페이징 처리
		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		// 이전버튼 만들기
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		// 숫자 버튼 만들기
		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		// 다음 버튼 만들기
		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCeoNoticeList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		CeoNoticePageData cnpd = new CeoNoticePageData(list, pageNavi);

		return cnpd;
	}
}
