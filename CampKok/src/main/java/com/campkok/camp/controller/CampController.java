package com.campkok.camp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.camp.model.service.CampService;
import com.campkok.camp.model.vo.CampNoticePageData;
import com.campkok.camp.model.vo.CampNoticeVO;
import com.campkok.camp.model.vo.CampResVO;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;

@Controller
@RequestMapping("/camp")
public class CampController {
	@Autowired
	private CampService service;
	
	/***********************************************
	 *                     ���� 
	 ***********************************************/
	/*
	 * @RequestMapping("test.do") public String test() { return "camp/test"; }
	 */
	@RequestMapping("campReservation.do")
	public String campReservation(Model model,int roomNo) {
		//1. ����� ���� ���� ��������
		//2. �ش��������� ����Ʈ�� �ѷ��ְ�
		//3. �޷¿��� �迭ó���� ��¥���� ��ü �������� �ֱ�(null���� �ƴ�����? -> Ķ����jsp �ٽ� ���)
		//4. ���� ���������� �α��μ������� ��񿡼� �ֱٰ� ������ �������°ɷ� �ؾ��ҵ�?(�̰͵� jsp���� �ٽ� ���)
		 
		//user_tbl���� ����Ʈ ��������
		/*
		 * int userNo = 2; //���������� �޾Ƽ� ��ü�ҿ��� UserVO userInfo =
		 * service.selectUserPoint(userNo);
		 */
		//ķ����� ���� ��������
		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
		//ķ���忹�ฮ��Ʈ ��������
		ArrayList<CampResVO> campResList = service.selectCampResList(roomNo);
		//ķ���� ���� ��������
		int campNo = campRoomInfo.getCampNo();
		CampVO campInfo = service.selectCampInfo(campNo);
		model.addAttribute("campRoomInfo",campRoomInfo); //ķ���� ��
		model.addAttribute("campInfo",campInfo); //ķ����
		/* model.addAttribute("userInfo",userInfo); */
		model.addAttribute("campResList",campResList); //���� ����Ʈ 
		return "camp/campReservation2";
	}
	
	@RequestMapping("campRes.do")
	public String campRes(Integer userNo, Integer campNo, Integer campRoomNo, String resInDate, String resOutDate, Integer resMember, String resMemo, Integer resPrice,Integer userUsePoint, Model model) {				
		//user_tbl ����Ʈ ������Ʈ
		int result = service.userPointUpdate(userNo,userUsePoint);
		//����Ʈ ���̺� �μ�Ʈ
		int totalPoint = service.totalPoint(userNo); //��Ż����Ʈ ��������
		int result2 = service.pointUpdate(userNo,totalPoint,userUsePoint);
		//���� ���̺� �μ�Ʈ
		int resResult = service.campRes(userNo,campNo,campRoomNo,resInDate,resOutDate,resMember,resPrice,resMemo); //�����ѹ� ���������� ��������
		if(resResult >0) {
			model.addAttribute("msg","예약이 완료되었습니다.");
		}else {
			model.addAttribute("msg","예약등록중 오류가 발생했습니다.");
			model.addAttribute("loc","/");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("commentFrm.do")
	public String commentFrm(Model model,int userNo,int campNo) {
		UserVO userInfo = service.selectUserPoint(userNo);
		model.addAttribute("userInfo",userInfo);
		//review���̺� ��������
		ArrayList<ReviewVO> commentList = service.selectAllComment(campNo);
		model.addAttribute("commentList",commentList);
		model.addAttribute("campNo",campNo);
		return "camp/test";
	}
	
	@RequestMapping("insertComment.do")
	public String insertComment(String userId, int campNo,String revContents,Model model) {
		//�����ۼ��� ����Ʈ �μ�Ʈ
		UserVO userInfo = service.selectUser(userId);
		int userNo = userInfo.getUserNo();
		int pointTotal =userInfo.getUserPoint();
		int result2 = service.insertPoint(userNo,pointTotal);
		//user_tbl ��Ż����Ʈ ������Ʈ
		int result3 = service.updateUserPoint(userNo);
		//review���̺� �μ�Ʈ
		int result = service.insertComment(userId,campNo,revContents);
		if(result>0) {
			model.addAttribute("msg","후기가 등록되었습니다.");
			model.addAttribute("loc","/campView.do?campNo="+campNo);
		}else {
			model.addAttribute("msg","후기등록중 오류가 발생했습니다.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("campNotice2.do")
	public String selectCampNoticeList(int reqPage, Model model) {
		CampNoticePageData npd = service.selectCampNoticeList(reqPage);
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		return "camp/campNoticeList";
	}
	
	@RequestMapping("selectCampNotice.do")
	public String selectCampNotice(int campNoticeNo,Model model) {
		CampNoticeVO campNotice = service.selectCampNotice(campNoticeNo);
		model.addAttribute("campNotice",campNotice);
		return "camp/campNoticeView";
	}
	
	@RequestMapping("commentDelete.do")
	public String commentDelete(int revNo,Model model,int campNo) {
		int result = service.commentDelete(revNo);
		if(result>0) {
			model.addAttribute("msg","후기가 삭제되었습니다.");
			model.addAttribute("loc","/campView.do?campNo="+campNo);
		}else {
			model.addAttribute("msg","후기 삭제중 오류가 발생했습니다.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("commentUpdate.do")
	public String commentUpdate(int revNo,Model model) {
		int result = service.commentUpdate(revNo);
		if(result>0) {
			model.addAttribute("msg","후기 수정이 완료되었습니다.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}else {
			model.addAttribute("msg","후기 수정중 오류가 발생했습니다.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}
		return "common/msg";
	}
		
	

	
	
	/***********************************************
	 *                     ���� 
	 ***********************************************/
	@RequestMapping("jinwoo.do")
	public String start() {
		return "camp/start";
	}
	
	@RequestMapping("/campBoard.do")
	public String campBoard(Model model) {
		return null;
	}
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "camp/campjoin";
	}
	@RequestMapping("/campjoin.do")
	public String campjoin() {
		return "camp/campjoin2";
	}
	@RequestMapping("/campjoin2.do")
	public String campjoin2() {
		return "camp/campjoin3";
	}
	@RequestMapping("/campjoin3.do")
	public String campjoin3() {
		return "camp/campjoin4";
	}
}
