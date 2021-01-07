package com.campkok.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.campkok.admin.model.service.AdminService;
import com.campkok.admin.model.vo.CeoNotice;
import com.campkok.admin.model.vo.CeoNoticePageData;
import com.campkok.admin.model.vo.ClientNotice;
import com.campkok.admin.model.vo.ClientNoticePageData;
import com.campkok.admin.model.vo.Notice;
import com.campkok.hik.common.FileNameOverlap;

@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	//	private String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";

	@RequestMapping("/pageAdmin.do")
	public String pageAdmin(int reqPage, Model model) {
		CeoNoticePageData ceoNPD = service.selectCeoNoticeList(reqPage);
		ClientNoticePageData clientNPD = service.selectClientNoticeList(reqPage);

		model.addAttribute("ceoNoticeList", ceoNPD.getList());
		model.addAttribute("clientNoticeList", clientNPD.getList());

		return "/admin/admin";
	}

	@RequestMapping("/pageNoticeForm.do")
	public String pageNoticeForm() {

		return "/admin/noticeForm";
	}

	@RequestMapping(value = "/insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(Notice notice, MultipartFile noticeFile, Model model) {
		String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";
		// 파일 업로드
		if (noticeFile != null) {
			String fileName = noticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			try {
				byte[] bytes = noticeFile.getBytes();
				File uploadFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(uploadFile));

				bos.write(bytes);
				bos.close();

				notice.setNoticeFileName(fileName);
				notice.setNoticeFilePath(filePath);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		int result = service.insertNotice(notice);

		if (result > 0) {
			model.addAttribute("msg", notice.getUserCategory() + "공지사항 등록 성공");
		} else {
			model.addAttribute("msg", notice.getUserCategory() + "공지사항 등록 실패");
		}
		model.addAttribute("loc", "/pageAdmin.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/selectCeoNotice.do")
	public String selectCeoNotice(int ceoNoticeNo, Model model) {
		CeoNotice ceoNotice = service.selectCeoNotice(ceoNoticeNo);

		model.addAttribute("ceoNotice", ceoNotice);

		return "/admin/ceoNoticeView";
	}

	@RequestMapping("/selectCeoNoticeList.do")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = service.selectCeoNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getpageNavi());

		return "/admin/ceoNoticeList";
	}

	@RequestMapping(value = "/updateCeoNotice.do", method = RequestMethod.POST)
	public String updateCeoNotice(CeoNotice ceoNotice, MultipartFile ceoNoticeFile, String oldFile, Model model) {
		if (ceoNoticeFile != null) {
			String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";
			String fileName = ceoNoticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			if (oldFile != null) {
				File deleteFile = new File(path + oldFile);

				System.out.println(deleteFile);

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}

			try {
				byte[] bytes = ceoNoticeFile.getBytes();
				File newFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(newFile));

				bos.write(bytes);
				bos.close();

				ceoNotice.setCeoNoticeFileName(fileName);
				ceoNotice.setCeoNoticeFilePath(filePath);

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int result = service.updateCeoNotice(ceoNotice);

		if (result > 0) {
			model.addAttribute("msg", "사업자 공지사항 수정 성공");
		} else {
			model.addAttribute("msg", "사업자 공지사항 수정 실패");
		}
		model.addAttribute("loc", "/selectCeoNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteCeoNotice.do")
	public String deleteCeoNotice(int ceoNoticeNo, String ceoNoticeFilePath, Model model) {
		if (ceoNoticeFilePath != null) {
			String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";
			String filePath = ceoNoticeFilePath;
			File deleteFile = new File(path + filePath);

			if (deleteFile.exists()) {
				deleteFile.delete();
				System.out.println(deleteFile + "파일 삭제 성공");
			}
		}

		int result = service.deleteCeoNotice(ceoNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "사업자 공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "사업자 공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectCeoNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/selectClientNotice.do")
	public String selectClientNotice(int clientNoticeNo, Model model) {
		ClientNotice clientNotice = service.selectClientNotice(clientNoticeNo);

		model.addAttribute("clientNotice", clientNotice);

		return "/admin/clientNoticeView";
	}

	@RequestMapping("/selectClientNoticeList.do")
	public String selectClientNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = service.selectClientNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "/admin/clientNoticeList";
	}

	@RequestMapping("/deleteClientNotice.do")
	public String deleteClientNotice(int clientNoticeNo, Model model) {
		int result = service.deleteClientNotice(clientNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "고객 공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "고객 공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/common/msg";
	}

}
