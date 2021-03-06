package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("SoQnaDTO")
public class SoQnaDTO {
	private int qnaNum;
	private String soId;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWritedate;
	private String qnaCategory;
	private String qnaComplete;
	private String qnaReplyContent;
	private String qnaReplyStatement;
	public SoQnaDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SoQnaDTO(int qnaNum, String soId, String qnaTitle, String qnaContent, String qnaWritedate,
			String qnaCategory, String qnaComplete) {
		super();
		this.qnaNum = qnaNum;
		this.soId = soId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWritedate = qnaWritedate;
		this.qnaCategory = qnaCategory;
		this.qnaComplete = qnaComplete;
	}
	
	
	public SoQnaDTO(int qnaNum, String soId, String qnaTitle, String qnaContent, String qnaWritedate,
			String qnaCategory, String qnaComplete, String qnaReplyContent, String qnaReplyStatement) {
		super();
		this.qnaNum = qnaNum;
		this.soId = soId;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaWritedate = qnaWritedate;
		this.qnaCategory = qnaCategory;
		this.qnaComplete = qnaComplete;
		this.qnaReplyContent = qnaReplyContent;
		this.qnaReplyStatement = qnaReplyStatement;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}
	public String getsoId() {
		return soId;
	}
	public void setsoId(String soId) {
		this.soId = soId;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaWritedate() {
		return qnaWritedate;
	}
	public void setQnaWritedate(String qnaWritedate) {
		this.qnaWritedate = qnaWritedate;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaComplete() {
		return qnaComplete;
	}
	public void setQnaComplete(String qnaComplete) {
		this.qnaComplete = qnaComplete;
	}
	public String getQnaReplyContent() {
		return qnaReplyContent;
	}
	public void setQnaReplyContent(String qnaReplyContent) {
		this.qnaReplyContent = qnaReplyContent;
	}
	public String getQnaReplyStatement() {
		return qnaReplyStatement;
	}
	public void setQnaReplyStatement(String qnaReplyStatement) {
		this.qnaReplyStatement = qnaReplyStatement;
	}
}
