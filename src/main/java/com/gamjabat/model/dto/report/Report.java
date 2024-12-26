package com.gamjabat.model.dto.report;

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
public class Report {
	private String reportNo;
	private String reportReasonType;
	private String reportContent;
	// 신고상태
	private String reportStatus;
	private String reportResult;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	private Timestamp deletedAt;
	private boolean isDeleted;
	// 신고한 사용자 정보
	private String reportMemberNo;
	// 신고당한 게시글
	private String reportBoardNo;
	// 신고당한 댓글
	private String reportCommentNo;
}
