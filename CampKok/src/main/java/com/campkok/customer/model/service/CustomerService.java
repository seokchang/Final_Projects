package com.campkok.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.CustomerDao;
import com.campkok.customer.model.vo.PointVO;
import com.campkok.customer.model.vo.ReservationVO;
import com.campkok.customer.model.vo.ReviewInfoPageData;
import com.campkok.customer.model.vo.ReviewVO;
import com.campkok.customer.model.vo.UseInfoPageData;
import com.campkok.customer.model.vo.UserVO;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao dao;

	public UserVO selectOneCustomer(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCutomer(userNo);
	}

	public int updateCustomer(UserVO u) {
		// TODO Auto-generated method stub
		return dao.updateCustomer(u);
	}

	public ReservationVO selectOneReserve(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectOneReserve(userNo);
	}

	public UseInfoPageData reserveList(int reqPage, int userNo) {
		//�Խù� ���ؿ� ��
		int numPerPage = 8; 	//�� �������� �Խù� ��
		//�Խù� 10�� ��������
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("userNo",userNo);
		ArrayList<ReservationVO> list = dao.useSelectList(map);
		//pageNavi ����
		//�� �Խù� ��
		int totalCount = dao.useTotalCount(userNo);
		//�� ������ ��
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//�������׺��� ����
		int pageNaviSize = 5;
		//������ �׺� ���۹�ȣ
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//�������׺� �ۼ�
		String pageNavi = "";
		//���� ��ư ����
		if(pageNo != 1) {
	         pageNavi += "<a href='/reserveAll.do?reqPage="+(pageNo-1)+"&userNo="+userNo+"'>[����]</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/reserveAll.do?reqPage="+pageNo+"&userNo="+userNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//������ư
		if(pageNo <= totalPage) {
	         pageNavi += "<a href='/reserveAll.do?reqPage="+pageNo+"&userNo="+userNo+"'>[����]</a>";
	      }
		UseInfoPageData uipf = new UseInfoPageData(list, pageNavi);
		return uipf;
	}

	public ReviewInfoPageData reviewList(int reqPage, String userId) {
		//�Խù� ���ؿ� ��
		int numPerPage = 8; 	//�� �������� �Խù� ��
		//�Խù� 10�� ��������
		int end = reqPage * numPerPage;
		int start = end - numPerPage +1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("userId",userId);
		ArrayList<ReviewVO> list = dao.reviewSelectList(map);
		//pageNavi ����
		//�� �Խù� ��
		int totalCount = dao.reviewTotalCount(userId);
		//�� ������ ��
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//�������׺��� ����
		int pageNaviSize = 5;
		//������ �׺� ���۹�ȣ
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//�������׺� �ۼ�
		String pageNavi = "";
		//���� ��ư ����
		if(pageNo != 1) {
	         pageNavi += "<a href='/review.do?reqPage="+(pageNo-1)+"&userId="+userId+"'>[����]</a>";
	      }
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo != reqPage) {
				pageNavi += "<a href='/review.do?reqPage="+pageNo+"&userId="+userId+"'>"+pageNo+"</a>";
			}else {
				pageNavi += "<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//������ư
		if(pageNo <= totalPage) {
	         pageNavi += "<a href='/review.do?reqPage="+pageNo+"&userNo="+userId+"'>[����]</a>";
	      }
		ReviewInfoPageData ripf = new ReviewInfoPageData(list, pageNavi);
		return ripf;
	}

	public ArrayList<PointVO> pointList(int userNo) {
		// TODO Auto-generated method stub
		return dao.pointList(userNo);
	}
}
