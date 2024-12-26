package com.gamjabat.board.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardComments {
		 	private String commentNo;          // 댓글 고유 번호
		    private String commentContent;     // 댓글 내용
		    private int commentLikeCount;      // 좋아요 수
		    private int commentLevel;          // 댓글 레벨 (1, 2)
		    private Date createdAt;          // 생성일
		    private Date updatedAt;          // 수정일
		    private Date deletedAt;          // 삭제일 (nullable)
		    private String isDeleted;            // 삭제 여부 ('Y', 'N')
		    
		    //왜래키
		    private String commentMemberNo;    // 댓글 작성자 (MEMBER 테이블의 MEMBER_NO 참조)
		    private String parentCommentNo;    // 부모 댓글 (COMMENTS 테이블의 COMMENT_NO 참조)
		    private String commentBoardNo;     // 댓글이 속한 게시글 (BOARD 테이블의 BOARD_NO 참조)
	}
