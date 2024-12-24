package com.gamjabat.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dto.Member;

public class AdminMemberDao {

	public List<Member> selectMemberAll(SqlSession session, Map<String, Integer> param) {
		
		int cPage=param.get("cPage");
		int numPerPage=param.get("numPerPage");
		
		return session.selectList("admin.selectMemberAll",
				Map.of("start",(cPage-1)*numPerPage+1,"end",cPage*numPerPage));
		
	}

	public int selectMemberCount(SqlSession session) {
		return session.selectOne("admin.selectMemberCount");
	}

}
