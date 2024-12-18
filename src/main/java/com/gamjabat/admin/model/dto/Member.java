package com.gamjabat.admin.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Member {
	private String memberNo;
	private String memberId;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String birthday;
	private String nickName;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private boolean isDelete;
}
