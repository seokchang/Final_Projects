package com.campkok.camp.notice.model.vo;

import lombok.Data;

@Data
public class CampNoticeVO {
	private int ceoNoticeNo;
	private String userId;
	private String ceoNoticeTitle;
	private String ceoNoticeDate;
	private String ceoNoticeContents;
	private String ceoNoticeFilename;
	private String ceoNoticefilePath;
}
