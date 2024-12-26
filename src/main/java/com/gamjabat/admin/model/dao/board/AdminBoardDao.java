package com.gamjabat.admin.model.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dto.InqueryBoard;
import com.gamjabat.admin.model.dto.ReportBoard;

public class AdminBoardDao {

	public List<InqueryBoard> selectInqueryBoardAll(SqlSession session, Map<String, Integer> param) {
		int cPage=param.get("cPage");
		int numPerPage=param.get("numPerPage");
		
		return session.selectList("admin.selectInqueryBoardAll",
				Map.of("start",(cPage-1)*numPerPage+1,"end",cPage*numPerPage));
		
	}

	public List<ReportBoard> selectReportBoardAll(SqlSession session, Map<String, Integer> param) {
		int cPage=param.get("cPage");
		int numPerPage=param.get("numPerPage");
		
		return session.selectList("admin.selectReportBoardAll",
				Map.of("start",(cPage-1)*numPerPage+1,"end",cPage*numPerPage));
		
	}

}