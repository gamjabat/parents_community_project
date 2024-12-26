package com.gamjabat.board.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class Attachment {
	
		private String attachmentNo;
	    private String originalFileName;
	    private String storedFileName;
	    private String filePath;
	    private String attachmentBoardNo;
	    private Date createdAt;
	    
}
