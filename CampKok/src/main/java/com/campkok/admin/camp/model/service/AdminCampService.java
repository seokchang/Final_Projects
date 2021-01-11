package com.campkok.admin.camp.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.camp.model.vo.Camp;

@Service
public class AdminCampService {
	@Autowired
	private AdminCampDao dao;

	public AdminCampInfoPageData selectCampInfoList(int reqPage) {
		int totalCamp = dao.getTotalCampCount();
		int numPerPage = 10;
		int totalPage = (totalCamp / numPerPage == 0) ? (totalCamp / numPerPage) : (totalCamp / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.selectCampInfoList(start, end);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectCampInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

}
