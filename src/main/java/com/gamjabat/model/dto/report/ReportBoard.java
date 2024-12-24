package com.gamjabat.model.dto.report;

import java.sql.Timestamp;

import com.gamjabat.admin.model.dto.Board;
import com.gamjabat.model.dto.member.Member;

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
	private String reportReasonCode;
	private String reportContent;
	// 신고상태
	private String reportStatus;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private boolean isDeleted;
	private String postNo;
	// 신고한 사용자 정보
	private Member reportMemberNo;
	// 신고당한 게시글
	private Board reportBoardNo;
	// 신고당한 댓글
	//private Comment reportCommentNo;
}
