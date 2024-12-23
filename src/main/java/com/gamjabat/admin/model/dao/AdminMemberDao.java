package com.gamjabat.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dto.Member;

public class AdminMemberDao {

	public List<Member> selectMemberAll(SqlSession session) {
		return session.selectList("admin.selectMemberAll");
	}

}
