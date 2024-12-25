package com.gamjabat.admin.model.dto;

import java.sql.Timestamp;

import com.gamjabat.board.model.dto.Board;
//github.com/gamjabat/parents_community_project.git
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
	private String reportTitle;
	private String reportContent;
	// 신고상태
	private String reportStatus;
	private String createdAt;
	private String updatedAt;
	private String deletedAt;
	private boolean isDeleted;
	private String postNo;
	// 신고한 사용자 정보
	private String reportMemberId;
	// 신고당한 게시글
	private Board reportBoardNo;
	// 신고당한 댓글
	//private Comment reportCommentNo;
	private String status;
}
