package com.campkok.admin.reservation.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.Camp;
import com.campkok.admin.reservation.model.dao.AdminReservationDao;
import com.campkok.admin.reservation.model.vo.AdminReservationPageData;
import com.campkok.admin.reservation.model.vo.CampRoom;
import com.campkok.admin.reservation.model.vo.Reservation;
import com.campkok.admin.user.model.dao.AdminUserDao;
import com.campkok.admin.user.model.vo.User;

@Service
public class AdminReservationService {
	@Autowired
	private AdminReservationDao dao;
	@Autowired
	private AdminUserDao uDao;
	@Autowired
	private AdminCampDao cDao;

	public Reservation selectReservationInfo(int resNo) {
		Reservation reservationInfo = dao.selectReservationInfo(resNo);

		if (reservationInfo != null) {
			User clientInfo = uDao.selectCeoInfo(reservationInfo.getUserNo());
			Camp campInfo = cDao.selectCampInfo(reservationInfo.getCampNo());
			CampRoom campRoomInfo = dao.selectCampRoomInfo(reservationInfo.getCampRoom());

			reservationInfo.setClientInfo(clientInfo);
			reservationInfo.setCampInfo(campInfo);
			reservationInfo.setCampRoomInfo(campRoomInfo);
		}

		return reservationInfo;
	}

	public AdminReservationPageData selectReservationInfoList(int reqPage, int userNo) {
		int totalReservation = dao.getTotalReservationCount(userNo);
		int numPerPage = 10;
		int totalPage = (totalReservation / numPerPage == 0) ? (totalReservation / numPerPage)
				: (totalReservation / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Reservation> list = dao.selectReservationInfoList(start, end, userNo);

		if (!list.isEmpty()) {
			for (Reservation res : list) {
				User clientInfo = uDao.selectClientInfo(res.getUserNo());
				Camp campInfo = cDao.selectCampInfo(res.getCampNo());

				res.setClientInfo(clientInfo);
				res.setCampInfo(campInfo);
			}
		}

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectReservationInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectReservationInfoList.do?reqPage" + pageNo + "'>" + pageNo
						+ "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectReservationInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminReservationPageData arpd = new AdminReservationPageData(list, pageNavi);

		return arpd;
	}

}
