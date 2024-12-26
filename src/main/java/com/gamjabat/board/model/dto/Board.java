package com.gamjabat.board.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Board {

		private String boardNo;
		private String writer;

	    private String title;
	    private String content;
	    
	    private int likeCount;
	    private int viewCount;
	    
	    private Timestamp createdAt;
	    private Timestamp updatedAt;
	    private Timestamp deletedAt;
	    
	    private String isDeleted;
	    private String memberNo;
	    private String boardTypeNumber;
	    private String categoryName; // 추가된 카테고리 이름 필드
	    
	    private String writerNickname; // 작성자 닉네임 필드 추가
	    
	    
	    private String[] tag;
	    private String writerMemberNo;
	    



	}

	
	


