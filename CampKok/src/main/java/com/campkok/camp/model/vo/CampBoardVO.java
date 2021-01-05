package com.campkok.camp.model.vo;

import lombok.Data;

@Data
public class CampBoardVO {
	private int ceoNoticeNo;
	private String userId;
	private String ceoNoticeTitle;
	private String ceoNoticeDate;
	private String ceoNoticeContents;
	private String ceoNoticeFilename;
	private String ceoNoticefilePath;
}
