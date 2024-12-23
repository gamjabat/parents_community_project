package com.gamjabat.service.member;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dao.MemberDao;
import com.gamjabat.model.dto.member.Member;

public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public int signupMember(Member m) throws RuntimeException {
		SqlSession session = getSession();
		int result = dao.signupMember(session, m);

		if (result > 0)
			session.commit();
		else
			session.rollback();

		session.close();

		return result;
	}
	
}
