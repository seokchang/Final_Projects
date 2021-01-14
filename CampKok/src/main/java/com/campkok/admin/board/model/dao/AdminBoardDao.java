package com.campkok.admin.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.board.model.vo.Board;

@Repository
public class AdminBoardDao {
	@Autowired
	private SqlSessionTemplate session;

	// ******************** Board ********************
	public int getTotalBoardInfoCount() {
		return session.selectOne("adminBoard.getTotalBoardInfoCount");
	}

	public int getTotalSearchBoardInfoCount(String searchCategory, String search) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("searchCategory", searchCategory);
		map.put("search", search);

		return session.selectOne("adminBoard.getTotalSearchBoardInfoCount", map);
	}

	public Board selectBoardInfo(int boardNo) {
		return session.selectOne("adminBoard.selectBoardInfo", boardNo);
	}

	public ArrayList<Board> selectBoardInfoList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<Board> list = session.selectList("adminBoard.selectBoardInfoList", map);

		return (ArrayList<Board>) list;
	}

	public ArrayList<Board> selectBoardInfoList(int start, int end, String searchCategory, String search) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("searchCategory", searchCategory);
		map.put("search", search);

		List<Board> list = session.selectList("adminBoard.getSearchBoardInfoList", map);

		return (ArrayList<Board>) list;
	}

	public int deleteBoardInfo(int boardNo) {
		return session.delete("adminBoard.deleteBoardInfo", boardNo);
	}

}
