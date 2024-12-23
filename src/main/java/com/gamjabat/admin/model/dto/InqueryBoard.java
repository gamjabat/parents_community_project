package com.gamjabat.admin.model.dto;

import com.gamjabat.model.dto.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InqueryBoard {
	private String inqueryNo;
	private Member inqueryMember;
	private String inqueryCode;
	private String inqueryTitle;
	private String inqueryContent;
	private String createDate;
	private String resolvedDate;
	private String postNo;
	private String status;

}
