package com.gamjabat.admin.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Board {
	private String postNo;
	private String postTitle;
	private String postContent;
	private String likeCount;
	private String hashTag;
	private String createDt;
	private String updateDt;
	private String deleteDt;
	private boolean isDelete;
	//작성자 정보 
	private Member author;
}
