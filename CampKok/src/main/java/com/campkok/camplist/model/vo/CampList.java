package com.campkok.camplist.model.vo;

import lombok.Data;

@Data
public class CampList {
	private int campNo;
	private String campName;
	private String campAddr;
	private String campSite;
	private String campTel;
	private String campTheme;
	private String campFac;			// 캠핑장 시설
	private String campCtg;			// 캠핑장 카테고리
	private String campEnv;			// 캠핑장 주변환경
	private String campMinPrice;	// 캠핑장 최저
	private String campStar;		// 캠핑장 별점
}