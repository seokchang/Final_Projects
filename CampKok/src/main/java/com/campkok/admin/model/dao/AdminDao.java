package com.campkok.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.admin.model.vo.CeoNotice;
import com.campkok.admin.model.vo.ClientNotice;
import com.campkok.admin.model.vo.Notice;

@Repository
public class AdminDao {
	@Autowired
	private SqlSessionTemplate session;

	public int getTotalCeoNotice() {
		return session.selectOne("adminNotice.getCeoNoticeCount");
	}

	public CeoNotice selectCeoNotice(int ceoNoticeNo) {
		return session.selectOne("adminNotice.selectCeoNotice", ceoNoticeNo);
	}

	public ArrayList<CeoNotice> selectCeoNoticeList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<CeoNotice> list = session.selectList("adminNotice.selectCeoNoticeList", map);

		return (ArrayList<CeoNotice>) list;
	}

	public int insertNotice(Notice notice) {
		return session.insert("adminNotice.insertNotice", notice);
	}

	public int updateCeoNotice(CeoNotice ceoNotice) {
		return session.update("adminNotice.updateCeoNotice", ceoNotice);
	}

	public int deleteCeoNotice(int ceoNoticeNo) {
		return session.delete("adminNotice.deleteCeoNotice", ceoNoticeNo);
	}

	// *************************************************************************************

	public int getTotalClientNotice() {
		return session.selectOne("adminNotice.getClientNoticeCount");
	}

	public ArrayList<ClientNotice> selectClientNoticeList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		List<ClientNotice> list = session.selectList("adminNotice.selectClientNoticeList", map);

		return (ArrayList<ClientNotice>) list;
	}

	public ClientNotice selectClientNotice(int clientNoticeNo) {
		return session.selectOne("adminNotice.selectClientNotice", clientNoticeNo);
	}

	public int updateClientNotice(ClientNotice clientNotice) {
		return session.update("adminNotice.updateClientNotice", clientNotice);
	}

	public int deleteClientNotice(int clientNoticeNo) {
		return session.delete("adminNotice.deleteClientNotice", clientNoticeNo);
	}

}
