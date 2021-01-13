package com.campkok.admin.camp.model.vo;

import java.util.ArrayList;

import com.campkok.admin.user.model.vo.User;

public class Camp {
	private int rNum;
	private int campNo;
	private String ceoId;
	private String campName;
	private String campAddr;
	private String campSite;
	private String campTel;
	private String campTheme;
	private String campFac;
	private String campCtg;
	private CampEnv campEnv;
	private ArrayList<CampFile> campFiles;
	private User ceoInfo;

	public Camp() {
		// TODO Auto-generated constructor stub
	}

	public Camp(int rNum, int campNo, String ceoId, String campName, String campAddr, String campSite, String campTel,
			String campTheme, String campFac, String campCtg, CampEnv campEnv, ArrayList<CampFile> campFiles,
			User ceoInfo) {
		super();
		this.rNum = rNum;
		this.campNo = campNo;
		this.ceoId = ceoId;
		this.campName = campName;
		this.campAddr = campAddr;
		this.campSite = campSite;
		this.campTel = campTel;
		this.campTheme = campTheme;
		this.campFac = campFac;
		this.campCtg = campCtg;
		this.campEnv = campEnv;
		this.campFiles = campFiles;
		this.ceoInfo = ceoInfo;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getCampNo() {
		return campNo;
	}

	public void setCampNo(int campNo) {
		this.campNo = campNo;
	}

	public String getCeoId() {
		return ceoId;
	}

	public void setCeoId(String ceoId) {
		this.ceoId = ceoId;
	}

	public String getCampName() {
		return campName;
	}

	public void setCampName(String campName) {
		this.campName = campName;
	}

	public String getCampAddr() {
		return campAddr;
	}

	public void setCampAddr(String campAddr) {
		this.campAddr = campAddr;
	}

	public String getCampSite() {
		return campSite;
	}

	public void setCampSite(String campSite) {
		this.campSite = campSite;
	}

	public String getCampTel() {
		return campTel;
	}

	public void setCampTel(String campTel) {
		this.campTel = campTel;
	}

	public String getCampTheme() {
		return campTheme;
	}

	public void setCampTheme(String campTheme) {
		this.campTheme = campTheme;
	}

	public String getCampFac() {
		return campFac;
	}

	public void setCampFac(String campFac) {
		this.campFac = campFac;
	}

	public String getCampCtg() {
		return campCtg;
	}

	public void setCampCtg(String campCtg) {
		this.campCtg = campCtg;
	}

	public CampEnv getCampEnv() {
		return campEnv;
	}

	public void setCampEnv(CampEnv campEnv) {
		this.campEnv = campEnv;
	}

	public ArrayList<CampFile> getCampFiles() {
		return campFiles;
	}

	public void setCampFiles(ArrayList<CampFile> campFiles) {
		this.campFiles = campFiles;
	}

	public User getCeoInfo() {
		return ceoInfo;
	}

	public void setCeoInfo(User ceoInfo) {
		this.ceoInfo = ceoInfo;
	}

}
