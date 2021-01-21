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
	 *                     기현 
	 ***********************************************/
	@RequestMapping("campReservation.do")
	public String campReservation(Model model,int roomNo) {
		//1. 예약된 정보 전부 가져오기
		//2. 해당페이지에 리스트로 뿌려주고
		//3. 달력에는 배열처리로 날짜별로 전체 예약정보 넣기(null인지 아닌지로? -> 캘린더jsp 다시 고민)
		//4. 개별 예약정보는 로그인세션으로 디비에서 최근값 정렬후 가져오는걸로 해야할듯?(이것도 jsp에서 다시 고민)
		
		//user_tbl에서 포인트 가져오기
		/*
		 * int userNo = 2; //세션정보로 받아서 대체할예정 UserVO userInfo =
		 * service.selectUserPoint(userNo);
		 */
		//캠핑장룸 정보 가져오기
		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
		//캠핑장예약리스트 가져오기
		ArrayList<CampResVO> campResList = service.selectCampResList(roomNo);
		//캠핑장 정보 가져오기
		int campNo = campRoomInfo.getCampNo();
		CampVO campInfo = service.selectCampInfo(campNo);
		model.addAttribute("campRoomInfo",campRoomInfo); //캠핑장 룸
		model.addAttribute("campInfo",campInfo); //캠핑장
		/* model.addAttribute("userInfo",userInfo); */
		model.addAttribute("campResList",campResList); //예약 리스트 
		return "camp/campReservation2";
	}
	
	@RequestMapping("campRes.do")
	public String campRes(Integer userNo, Integer campNo, Integer campRoomNo, String resInDate, String resOutDate, Integer resMember, String resMemo, Integer resPrice,Integer userUsePoint, Model model) {				
		//user_tbl 포인트 업데이트
		int result = service.userPointUpdate(userNo,userUsePoint);
		//포인트 테이블 인서트
		int totalPoint = service.totalPoint(userNo); //토탈포인트 가져오기
		int result2 = service.pointUpdate(userNo,totalPoint,userUsePoint);
		//예약 테이블 인서트
		int resResult = service.campRes(userNo,campNo,campRoomNo,resInDate,resOutDate,resMember,resPrice,resMemo); //유저넘버 세션정보로 받을예정
		if(resResult >0) {
			model.addAttribute("msg","예약이 완료되었습니다.");
		}else {
			model.addAttribute("msg","예약중 오류가 발생했습니다. 다시 예약해주세요.");
			model.addAttribute("loc","/camp/campReservation2");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("commentFrm.do")
	public String commentFrm(Model model,int userNo,int campNo) {
		UserVO userInfo = service.selectUserPoint(userNo);
		model.addAttribute("userInfo",userInfo);
		//review테이블 가져오기
		ArrayList<ReviewVO> commentList = service.selectAllComment(campNo);
		model.addAttribute("commentList",commentList);
		model.addAttribute("campNo",campNo);
		return "camp/commentFrm";
	}
	
	@RequestMapping("insertComment.do")
	public String insertComment(String userId, int campNo,String revContents,Model model) {
		//리뷰작성시 포인트 인서트
		UserVO userInfo = service.selectUser(userId);
		int userNo = userInfo.getUserNo();
		int pointTotal =userInfo.getUserPoint();
		int result2 = service.insertPoint(userNo,pointTotal);
		//user_tbl 토탈포인트 업데이트
		int result3 = service.updateUserPoint(userNo);
		//review테이블 인서트
		int result = service.insertComment(userId,campNo,revContents);
		if(result>0) {
			model.addAttribute("msg","댓글 등록이 완료되었습니다.");
			model.addAttribute("loc","/campView.do?campNo="+campNo);
		}else {
			model.addAttribute("msg","댓글등록중 오류가 발생했습니다. 다시 작성해주세요.");
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
			model.addAttribute("msg","댓글이 삭제되었습니다.");
			model.addAttribute("loc","/campView.do?campNo="+campNo);
		}else {
			model.addAttribute("msg","댓글삭제중 오류가 발생했습니다. 다시 삭제해주세요.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}
		return "common/msg";
	}
	
	@RequestMapping("commentUpdate.do")
	public String commentUpdate(int revNo,Model model) {
		int result = service.commentUpdate(revNo);
		if(result>0) {
			model.addAttribute("msg","댓글이 수정되었습니다.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}else {
			model.addAttribute("msg","댓글수정중 오류가 발생했습니다. 다시 수정해주세요.");
			model.addAttribute("loc","/camp/commentFrm.do");
		}
		return "common/msg";
	}
		
	

	
	
	/***********************************************
	 *                     진우 
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
