package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("QnaReplyDTO")
public class QnaReplyDTO {
	private int qnaReplyNum;
	private int qnaNum;
	private String qnaReplyContent;
	private String qnaReplyStatement;
	public QnaReplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaReplyDTO(int qnaReplyNum, int qnaNum, String qnaReplyContent, String qnaReplyStatement) {
		super();
		this.qnaReplyNum = qnaReplyNum;
		this.qnaNum = qnaNum;
		this.qnaReplyContent = qnaReplyContent;
		this.qnaReplyStatement = qnaReplyStatement;
	}
	public int getQnaReplyNum() {
		return qnaReplyNum;
	}
	public void setQnaReplyNum(int qnaReplyNum) {
		this.qnaReplyNum = qnaReplyNum;
	}
	public int getQnaNum() {
		return qnaNum;
	}
	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
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
