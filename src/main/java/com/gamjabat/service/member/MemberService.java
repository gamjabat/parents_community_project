package com.gamjabat.service.member;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dao.MemberDao;
import com.gamjabat.model.dto.likes.Likes;
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
	
	public List<Likes> selectLikeAllByMemberNo(Map<String, Object> param){
	 	SqlSession session = getSession();
		List<Likes> likes = dao.selectLikeAllByMemberNo(session, param);
		session.close();
		return likes;
	 }
	 
	 public int selectLikeAllByMemberNoCount(String memberNo) {
		SqlSession session = getSession();
		int count = dao.selectLikeAllByMemberNoCount(session, memberNo);
		session.close();
		return count;
	
	}
	 
	 public Map<String, Boolean> checkDuplicate(String nickname, String phone, String email) {
		SqlSession session = getSession();
        Map<String, Boolean> result = new HashMap<>();
        result.put("nicknameIsDuplicate", dao.isNicknameDuplicate(session, nickname));
        result.put("phoneIsDuplicate", dao.isPhoneDuplicate(session, phone));
        result.put("emailIsDuplicate", dao.isEmailDuplicate(session, email));
        session.close();
        return result;
	 }
	
}
