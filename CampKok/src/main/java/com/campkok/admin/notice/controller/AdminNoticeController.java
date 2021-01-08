package com.campkok.admin.notice.controller;

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

import com.campkok.admin.notice.model.service.AdminNoticeService;
import com.campkok.admin.notice.model.vo.CeoNotice;
import com.campkok.admin.notice.model.vo.CeoNoticePageData;
import com.campkok.admin.notice.model.vo.ClientNotice;
import com.campkok.admin.notice.model.vo.ClientNoticePageData;
import com.campkok.admin.notice.model.vo.Notice;
import com.campkok.admin.user.model.service.AdminUserService;
import com.campkok.admin.user.model.vo.AdminUserInfoPageData;
import com.campkok.hik.common.FileNameOverlap;

@Controller
public class AdminNoticeController {
	@Autowired
	private AdminNoticeService nService;
	@Autowired
	private AdminUserService uService;

	/* **************************************************
	 * Admin Page
	 * **************************************************
	*/
	@RequestMapping("/pageAdmin.do")
	public String pageAdmin(int reqPage, Model model) {
		CeoNoticePageData ceoNPD = nService.selectCeoNoticeList(reqPage);
		ClientNoticePageData clientNPD = nService.selectClientNoticeList(reqPage);
		AdminUserInfoPageData clientInfoList = uService.selectClientInfoList(reqPage);

		model.addAttribute("ceoNoticeList", ceoNPD.getList());
		model.addAttribute("clientNoticeList", clientNPD.getList());
		model.addAttribute("clientInfoList", clientInfoList.getList());

		return "/admin/admin";
	}

	/* **************************************************
	 * Notice
	 * **************************************************
	*/
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

		int result = nService.insertNotice(notice);

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
		CeoNotice ceoNotice = nService.selectCeoNotice(ceoNoticeNo);

		model.addAttribute("ceoNotice", ceoNotice);

		return "/admin/ceoNoticeView";
	}

	@RequestMapping("/selectCeoNoticeList.do")
	public String selectCeoNoticeList(int reqPage, Model model) {
		CeoNoticePageData cnpd = nService.selectCeoNoticeList(reqPage);

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

			if (oldFile != null) {
				File deleteFile = new File(path + oldFile);

				System.out.println(deleteFile);

				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}
		}

		int result = nService.updateCeoNotice(ceoNotice);

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
			}
		}

		int result = nService.deleteCeoNotice(ceoNoticeNo);

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
		ClientNotice clientNotice = nService.selectClientNotice(clientNoticeNo);

		model.addAttribute("clientNotice", clientNotice);

		return "/admin/clientNoticeView";
	}

	@RequestMapping("/selectClientNoticeList.do")
	public String selectClientNoticeList(int reqPage, Model model) {
		ClientNoticePageData cnpd = nService.selectClientNoticeList(reqPage);

		model.addAttribute("list", cnpd.getList());
		model.addAttribute("pageNavi", cnpd.getPageNavi());

		return "/admin/clientNoticeList";
	}

	@RequestMapping(value = "/updateClientNotice.do", method = RequestMethod.POST)
	public String updateClientNotice(ClientNotice clientNotice, MultipartFile clientNoticeFile, String oldFile,
			Model model) {
		if (clientNoticeFile != null) {
			String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";
			String fileName = clientNoticeFile.getOriginalFilename();
			String filePath = new FileNameOverlap().reName(path, fileName);

			try {
				byte[] bytes = clientNoticeFile.getBytes();
				File newFile = new File(path + filePath);
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(newFile));

				bos.write(bytes);
				bos.close();

				clientNotice.setClientNoticeFileName(fileName);
				clientNotice.setClientNoticeFilePath(filePath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if (oldFile != null) {
				File deleteFile = new File(path + oldFile);

				if (deleteFile.exists())
					deleteFile.delete();
			}
		}

		int result = nService.updateClientNotice(clientNotice);

		if (result > 0) {
			model.addAttribute("msg", "고객 공지사항 수정 성공");
		} else {
			model.addAttribute("msg", "고객 공지사항 수정 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/common/msg";
	}

	@RequestMapping("/deleteClientNotice.do")
	public String deleteClientNotice(int clientNoticeNo, String clientNoticeFilePath, Model model) {
		if (clientNoticeFilePath != null) {
			String path = "/Users/seohong/Desktop/HSC/Projects/02_Final_Project/02_uploadFiles/";
			String fileName = clientNoticeFilePath;
			File deleteFile = new File(path + fileName);

			if (deleteFile.exists()) {
				deleteFile.delete();
			}
		}

		int result = nService.deleteClientNotice(clientNoticeNo);

		if (result > 0) {
			model.addAttribute("msg", "고객 공지사항 삭제 성공");
		} else {
			model.addAttribute("msg", "고객 공지사항 삭제 실패");
		}
		model.addAttribute("loc", "/selectClientNoticeList.do?reqPage=1");

		return "/common/msg";
	}
}
