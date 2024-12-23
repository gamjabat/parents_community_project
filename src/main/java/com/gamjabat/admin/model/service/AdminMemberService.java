package com.gamjabat.admin.model.service;

import static com.gamjabat.admin.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dao.AdminMemberDao;
import com.gamjabat.admin.model.dto.Member;

public class AdminMemberService {

	AdminMemberDao memberDao = new AdminMemberDao();
	
	
	public List<Member> selectMemberAll() {
		
		SqlSession session= getSession();
		
		List<Member> m = memberDao.selectMemberAll(session);
		
		
		return m;
		
	}
	
}
