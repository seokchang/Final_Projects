package com.campkok.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.BoardVO;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewVO;
import com.campkok.customer.model.vo.UserVO;

@Repository
public class CustomerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public UserVO selectOneCutomer(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.mypage", userNo);
	}

	public int updateCustomer(UserVO u) {
		// TODO Auto-generated method stub
		return sqlSession.update("customer.updateCustomer",u);
	}

	public ReservationVO selectOneReserve(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.reserveInfo", userNo);
	}

	public ArrayList<ReservationVO> useSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("customer.useInfo", map);
		return (ArrayList<ReservationVO>) list;
	}

	public int useTotalCount(int userNo) {
		// TODO Auto-generated method stub
		List<ReservationVO> list = sqlSession.selectList("customer.totalUse", userNo);
		return list.size();
	}

	public ArrayList<ReviewVO> reviewSelectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("customer.reviewInfo", map);
		return (ArrayList<ReviewVO>) list;
	}

	public int reviewTotalCount(String userId) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = sqlSession.selectList("customer.totalReview", userId);
		return list.size();
	}

	public ArrayList<PointVO> pointList(int userNo) {
		// TODO Auto-generated method stub
		List<PointVO> list = sqlSession.selectList("customer.pointInfo", userNo);
		return (ArrayList<PointVO>) list;
	}

}
