package com.campkok.admin.camp.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.AdminCampInfoPageData;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.camp.model.vo.CampEnv;
import com.campkok.admin.camp.model.vo.CampFile;
import com.campkok.admin.user.model.dao.AdminUserDao;
import com.campkok.admin.user.model.vo.User;

@Service
public class AdminCampService {
	@Autowired
	private AdminCampDao dao;
	@Autowired
	private AdminUserDao userDao;

	public Camp selectCampInfo(int campNo) {
		Camp campInfo = dao.selectCampInfo(campNo);
		CampEnv campEnvInfo = dao.selectCampEnvInfo(campNo);
		ArrayList<CampFile> campFiles = dao.selectCampFiles(campNo);
		User ceoInfo = userDao.selectCeoInfo(campInfo.getCeoId());

		campInfo.setCampEnv(campEnvInfo);
		campInfo.setCampFiles(campFiles);
		campInfo.setCeoInfo(ceoInfo);

		return campInfo;
	}

	public AdminCampInfoPageData selectCampInfoList(int reqPage) {
		int totalCamp = dao.getTotalCampCount();
		int numPerPage = 10;
		int totalPage = (totalCamp / numPerPage == 0) ? (totalCamp / numPerPage) : (totalCamp / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.selectCampInfoList(start, end);

		for (Camp camp : list) {
			User ceoInfo = userDao.selectCeoInfo(camp.getCeoId());

			camp.setCeoInfo(ceoInfo);
		}

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

	public AdminCampInfoPageData searchCampInfoList(int reqPage, String searchCategory, String search) {
		int totalSearchCampInfo = dao.getTotalSearchCampCount(searchCategory, search);
		int numPerPage = 10;
		int totalPage = (totalSearchCampInfo / numPerPage == 0) ? (totalSearchCampInfo / numPerPage)
				: (totalSearchCampInfo / numPerPage) + 1;
		int start = (reqPage - 1) / numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Camp> list = dao.searchCampInfoList(start, end, searchCategory, search);

		for (Camp camp : list) {
			User user = userDao.selectCeoInfo(camp.getCeoId());

			camp.setCeoInfo(user);
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/searchCampInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminCampInfoPageData acipd = new AdminCampInfoPageData(list, pageNavi);

		return acipd;
	}

	@Transactional
	public int deleteCampInfo(int campNo) {
		return dao.deleteCampInfo(campNo);
	}

}
