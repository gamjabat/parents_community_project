package com.gamjabat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dto.likes.Likes;
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
	public List<Map<String, Object>> selectTopLikedMembers(SqlSession session) {
        return session.selectList("member.selectTopLikedMembers");
    }
	
	public List<Likes> selectLikeAllByMemberNo(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		String memberNo = (String)param.get("memberNo");
    	
    	return session.selectList("member.selectLikeAllByMemberNo", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage, "memberNo", memberNo));

    }
    
    public int selectLikeAllByMemberNoCount(SqlSession session, String memberNo){	
    	return session.selectOne("member.selectLikeAllByMemberNoCount", memberNo);
    }
    
    public boolean isNicknameDuplicate(SqlSession session, String nickname) {
        return session.selectOne("member.isNicknameDuplicate", nickname) != null;
    }

    public boolean isPhoneDuplicate(SqlSession session, String phone) {
        return session.selectOne("member.isPhoneDuplicate", phone) != null;
    }

    public boolean isEmailDuplicate(SqlSession session, String email) {
        return session.selectOne("member.isEmailDuplicate", email) != null;
    }
}
