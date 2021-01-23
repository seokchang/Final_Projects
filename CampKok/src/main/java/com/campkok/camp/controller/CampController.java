package com.campkok.camp.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.campkok.camp.model.service.CampService;
import com.campkok.camp.model.vo.CampEnv;
import com.campkok.camp.model.vo.CampNoticePageData;
import com.campkok.camp.model.vo.CampNoticeVO;
import com.campkok.camp.model.vo.CampResVO;
import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.FileTBL;
import com.campkok.camp.model.vo.Rent;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;
import com.campkok.hik.common.FileNameOverlap;

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
//	@ResponseBody
//	@RequestMapping("campReservation.do")
//
//	public String campReservation(Model model,int roomNo) {
//
//		CampRoomVO campRoomInfo = service.selectRoomInfo(roomNo);
//		ArrayList<CampResVO> campResList = service.selectCampResList(roomNo);
//		int campNo = campRoomInfo.getCampNo();
//		CampVO campInfo = service.selectCampInfo(campNo);
//		model.addAttribute("campRoomInfo",campRoomInfo); //ķ���� ��
//		model.addAttribute("campInfo",campInfo); //ķ����
//		/* model.addAttribute("userInfo",userInfo); */
//		model.addAttribute("campResList",campResList); //���� ����Ʈ 
//		return "camp/campReservation2";
//	}
	@ResponseBody
	@RequestMapping("campReservation.do")

	public CampRoomVO campReservation(Model model, int roomNo) {
		return service.selectRoomInfo(roomNo);
	}
	@RequestMapping("reservationPage.do")
	public String reservationPage(int roomNo,Model model) {
		CampRoomVO campRoom = service.selectRoomInfo(roomNo);
		ArrayList<CampResVO> campResList = service.selectCampResList(roomNo);
		if(campResList.isEmpty()) {
			System.out.println("Dd");
		}
		model.addAttribute("campRoomInfo",campRoom);
		model.addAttribute("campResList",campResList);
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
	public String insertComment(String userId, int campNo,String revStar,String revContents,Model model) {
		//�����ۼ��� ����Ʈ �μ�Ʈ
		UserVO userInfo = service.selectUser(userId);
		System.out.println(revStar);
		userInfo.setUserPoint(1000);
		int userNo = userInfo.getUserNo();
		int pointTotal =userInfo.getUserPoint();
		System.out.println(pointTotal);

		//review���̺� �μ�Ʈ
		
		
		if(revStar.equals("")) {
			model.addAttribute("msg","별점을 찍어주세요!");
			model.addAttribute("loc","/camp/commentFrm.do?userNo="+userNo+"&campNo="+campNo);
		}else {
			
			int star = Integer.parseInt(revStar);
			int result2 = service.insertPoint(userNo,pointTotal);
//			int result3 = service.updateUserPoint(userNo);
			int result = service.insertComment(userId,campNo,revContents,star);
			if(result>0) {
				model.addAttribute("msg","후기가 등록되었습니다.");
				model.addAttribute("loc","/campView.do?campNo="+campNo);
			}else {
				model.addAttribute("msg","후기등록중 오류가 발생했습니다.");
				model.addAttribute("loc","/camp/commentFrm.do");
			}
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
	//회원가입 페이지 이동
	@RequestMapping("/campjoinFrm.do")
	public String campjoinFrm() {
		return "camp/campjoin";
	}
	
	@RequestMapping("/campjoin.do")
	public String campjoin(Model model) {
		return "camp/campjoin2";
	}
	@RequestMapping("/campjoin2.do")
	public String campjoin2(HttpServletRequest request,Model model,String theme, String fac, String ctg) {
		
		int campNo = service.insertCampSeq();
		CampVO c = new CampVO();
		c.setCeoId(request.getParameter("ceoId"));
		c.setCampNo(campNo);
		c.setCampAddr(request.getParameter("campaddr2")+request.getParameter("campaddr3"));
		c.setCampName(request.getParameter("campname"));
		c.setCampSite(request.getParameter("campsite"));
		c.setCampTel(request.getParameter("camptel"));
		c.setCampTheme(theme);
		c.setCampFac(fac);
		c.setCampCtg(ctg);
		int result = service.insertCamp(c);
		model.addAttribute("campNo",campNo);
		if(result>0) {
			return "camp/campjoin3";
		}else {
			return "camp/campjoin2";
		}
		
	}
	@RequestMapping("/campjoin3.do")
	public String campjoin3(CampEnv ce, MultipartFile envimage, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/camp/";
			if(!envimage.isEmpty()) {
				String filename = envimage.getOriginalFilename();
				String filepath = new FileNameOverlap().reName(path, filename);
				try {
					byte[]bytes = envimage.getBytes();
					File upFile = new File(path+filepath);                                                                                                   
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					ce.setEnvFilename(filename);
					ce.setEnvFilepath(filepath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		int result = service.insertCampEnv(ce);
		model.addAttribute("campNo",ce.getCampNo());
		if(result>0) {
			return "camp/campjoin4";
		}else {
			return "camp/campjoin3";
		}
	}
	@RequestMapping("/campjoin4.do")
	public String campjoin4(Rent r, MultipartFile rentimage, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/camp/";
			if(!rentimage.isEmpty()) {
				String filename = rentimage.getOriginalFilename();
				String filepath = new FileNameOverlap().reName(path, filename);
				try {
					byte[]bytes = rentimage.getBytes();
					File upFile = new File(path+filepath);                                                                                                   
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					r.setRentFilename(filename);
					r.setRentFilepath(filepath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		int result = service.insertRent(r);
		model.addAttribute("campNo",r.getCampNo());
		if(result>0) {
			return "camp/campjoin5";
		}else {
			return "camp/campjoin4";
		}
	}
	@RequestMapping("/campjoin5.do")
	public String campjoin5(FileTBL ft, MultipartFile campimage, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/camp/";
			if(!campimage.isEmpty()) {
				String filename = campimage.getOriginalFilename();
				String filepath = new FileNameOverlap().reName(path, filename);
				try {
					byte[]bytes = campimage.getBytes();
					File upFile = new File(path+filepath);                                                                                                   
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					ft.setCampFileName(filename);
					ft.setCampFilePath(filepath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		int result = service.insertFileTBL(ft);
		model.addAttribute("campNo",ft.getCampNo());
		if(result>0) {
			return "camp/campjoin6";
		}else {
			return "camp/campjoin5";
		}
	}
	@RequestMapping("/campjoin6.do")
	public String campjoin6(CampRoomVO cr, FileTBL ft, MultipartFile roomimage, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String path = root + "resources/upload/camp/";
			if(!roomimage.isEmpty()) {
				String filename = roomimage.getOriginalFilename();
				String filepath = new FileNameOverlap().reName(path, filename);
				try {
					byte[]bytes = roomimage.getBytes();
					File upFile = new File(path+filepath);                                                                                                   
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					ft.setCampFileName(filename);
					ft.setCampFilePath(filepath);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		int result = service.insertCampRoom(cr);
		model.addAttribute("campNo",cr.getCampNo());
		if(result>0) {
			return "camp/campjoin7";
		}else {
			return "camp/campjoin6";
		}
	}
	//마이페이지 이동
	@RequestMapping("/campmypage.do")
	public String campmypage(Model model, String userId) {
		CampVO c = service.selectOneCamp(userId);
		model.addAttribute("c",c);
		return "camp/campmypage";
	}
	@RequestMapping("/nextpage.do")
	public String nextpage(Model model, int campNo) {
		CampEnv ce = service.selectOneCampEnv(campNo);
		model.addAttribute("ce",ce);
		return "camp/campmypage2";
	}
	@RequestMapping("campmypageupdate.do")
	public String campmypageupdate(HttpServletRequest request, Model model,String theme, String fac, String ctg, int campNo) {
		CampVO c = new CampVO();
		c.setCeoId(request.getParameter("ceoId"));
		c.setCampAddr(request.getParameter("campaddr2")+request.getParameter("campaddr3"));
		c.setCampName(request.getParameter("campname"));
		c.setCampSite(request.getParameter("campsite"));
		c.setCampTel(request.getParameter("camptel"));
		c.setCampTheme(theme);
		c.setCampFac(fac);
		c.setCampCtg(ctg);
		int result = service.updateCamp(c);
		model.addAttribute("campNo",c.getCampNo());
		if(result>0) {
			return "nextpage.do";
		}else {
			return "main.do";
		}
	}
}
