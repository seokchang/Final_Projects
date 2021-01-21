package com.campkok.shop.model.vo;

import lombok.Data;

@Data
public class Shop {
	private int shopNo;
	private String userName;
	private String productName;
	private String shopFilename;
	private String shopFilepath;
	private String productContents;
	private String productPrice;
}
