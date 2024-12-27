package com.gamjabat.model.dto.likes;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Likes {
	private String likesNo;
    private String memberNo;
    private String boardNo;
    private String commentNo;
    private Timestamp createdAt;
    
    private String boardTitle;
    private String commentBoardNo;
    private String commentContent;
    private int likeCount;
    private int viewCount;
    
}
