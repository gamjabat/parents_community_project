package com.gamjabat.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dto.member.Member;

public class MemberDao {
	public int signupMember(SqlSession session, Member m) throws RuntimeException {
		return session.insert("member.signupMember" , m);
	}

	public Member loginInvlidCheck(SqlSession session, Member checkMember) {
		return session.selectOne("member.loginInvlidCheck",checkMember);

	}
	public Member selectMemberById(SqlSession session, String id) {
		return session.selectOne("member.selectMemberById", id);
	}
	
	public Member selectMemberToFindIdPwd(SqlSession session, Map<String, String> param) {
		return session.selectOne("member.selectMemberToFindIdPwd", param);
	}
	public int updateMemberInfo(SqlSession session, Map<String, Object> param) {
		return session.update("member.updateMemberInfo", param);
	}
}
