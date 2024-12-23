package com.gamjabat.admin.model.service;

import static com.gamjabat.admin.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dao.AdminMemberDao;
import com.gamjabat.admin.model.dto.Member;

public class AdminMemberService {

	AdminMemberDao memberDao = new AdminMemberDao();
	
	
	public List<Member> selectMemberAll(Map<String, Integer> param) {
		
		SqlSession session= getSession();
		
		List<Member> m = memberDao.selectMemberAll(session,param);
		session.close();
		
		return m;
		
	}

	public int selectMemberCount() {
		SqlSession session=getSession();
		int count=memberDao.selectMemberCount(session);
		session.close();
		return count;
	}
}
