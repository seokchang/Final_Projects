package com.campkok.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.campkok.shop.model.service.ShopService;
import com.campkok.shop.model.vo.ShopListPageData;

@Controller
public class ShopController {

	@Autowired
	private ShopService service;
	
	@RequestMapping("/shopList.do")
	public String shopList(int reqPage, Model model) {
		ShopListPageData slpd = service.shopList(reqPage);
		model.addAttribute("list",slpd.getList());
		model.addAttribute("pageNavi",slpd.getPageNavi());
		return "shopping/shopList";
	}
}
