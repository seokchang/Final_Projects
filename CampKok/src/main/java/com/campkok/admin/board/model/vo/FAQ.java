package com.campkok.admin.board.model.vo;

public class FAQ {
	private int faqNo;
	private String faqUser;
	private String faqTitle;
	private String faqContents;
	private String faqDate;

	public FAQ() {
		// TODO Auto-generated constructor stub
	}

	public FAQ(int faqNo, String faqUser, String faqTitle, String faqContents, String faqDate) {
		super();
		this.faqNo = faqNo;
		this.faqUser = faqUser;
		this.faqTitle = faqTitle;
		this.faqContents = faqContents;
		this.faqDate = faqDate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqUser() {
		return faqUser;
	}

	public void setFaqUser(String faqUser) {
		this.faqUser = faqUser;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContents() {
		return faqContents;
	}

	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}

	public String getFaqDate() {
		return faqDate;
	}

	public void setFaqDate(String faqDate) {
		this.faqDate = faqDate;
	}
}
