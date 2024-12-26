package com.gamjabat.service.member;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

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

	public Member loginInvalidCheck(Member checkMember) {
		SqlSession session = getSession();
		
		Member invalidMember = dao.loginInvlidCheck(session,checkMember);
		return invalidMember;
	}
	
	public Member selectMemberById(String id) {
		SqlSession session = getSession();
		Member m = dao.selectMemberById(session, id);
		session.close();
		return m;
	}
	
	public Member selectMemberToFindIdPwd(Map<String, String> param) {
		SqlSession session = getSession();
		Member m = dao.selectMemberToFindIdPwd(session, param);
		session.close();
		return m;
	}
	
	public int updateMemberInfo(Map<String, Object> param) {
		SqlSession session = getSession();
		int result = dao.updateMemberInfo(session, param);
		if (result > 0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}
	
	public List<Map<String, Object>> selectTopLikedMembers() {
        SqlSession session = getSession();
        List<Map<String, Object>> result = dao.selectTopLikedMembers(session);
        session.close();
        return result;
    }
	
}
