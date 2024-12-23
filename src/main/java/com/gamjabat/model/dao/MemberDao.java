package com.gamjabat.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dto.member.Member;

public class MemberDao {
	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}
	public Member loginInvlidCheck(SqlSession session, Member checkMember) {
		return session.selectOne("member.loginInvlidCheck",checkMember);
	}
}
