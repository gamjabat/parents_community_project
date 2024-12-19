package com.gamjabat.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReportBoard {
	private String reportNo;
	private String reportCode;
	private String reportTitle;
	private String reportContent;
	private String createDate;
	private String resolvedDate;
	private String postNo;
	// 신고한 사용자 정보
	private Member reportMember;
	// 신고당한 사용자 정보
	private Member suspectMember;
	// 신고상태
	private String reportStatus;
}
