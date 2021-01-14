package com.campkok.admin.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.campkok.admin.board.model.dao.AdminBoardDao;
import com.campkok.admin.board.model.vo.AdminBoardInfoPageData;
import com.campkok.admin.board.model.vo.Board;

@Service
public class AdminBoardService {
	@Autowired
	private AdminBoardDao dao;

	// ******************** Board ********************
	public Board selectBoardInfo(int boardNo) {
		return dao.selectBoardInfo(boardNo);
	}

	public AdminBoardInfoPageData selectBoardInfoList(int reqPage) {
		int totalBoardInfo = dao.getTotalBoardInfoCount();
		int numPerPage = 10;
		int totalPage = (totalBoardInfo / numPerPage == 0) ? (totalBoardInfo / numPerPage)
				: (totalBoardInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Board> list = dao.selectBoardInfoList(start, end);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + (pageNo - 1) + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "'>다음</a>";
		}
		AdminBoardInfoPageData abipd = new AdminBoardInfoPageData(list, pageNavi);

		return abipd;
	}

	@Transactional
	public int deleteBoardInfo(int boardNo) {
		return dao.deleteBoardInfo(boardNo);
	}

	public AdminBoardInfoPageData searchBoardInfoList(int reqPage, String searchCategory, String search) {
		int totalBoardInfo = dao.getTotalSearchBoardInfoCount(searchCategory, search);
		System.out.println("totalBoardInfo : " + totalBoardInfo);
		int numPerPage = 10;
		int totalPage = (totalBoardInfo / numPerPage == 0) ? (totalBoardInfo / numPerPage)
				: (totalBoardInfo / numPerPage) + 1;
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;

		ArrayList<Board> list = dao.selectBoardInfoList(start, end, searchCategory, search);

		int pageNaviSize = 5;
		String pageNavi = "";
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;

		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + (pageNo - 1) + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>이전</a>";
		}

		for (int i = 0; i < pageNaviSize; i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			} else {
				pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "&searchCategory="
						+ searchCategory + "&search=" + search + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if (pageNo > totalPage)
				break;
		}

		if (pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/selectBoardInfoList.do?reqPage=" + pageNo + "&searchCategory="
					+ searchCategory + "&search=" + search + "'>다음</a>";
		}
		AdminBoardInfoPageData abipd = new AdminBoardInfoPageData(list, pageNavi);

		return abipd;
	}

}
