package com.gamjabat.model.dao.report;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dto.report.Report;

public class ReportDao {
	public int insertReport(SqlSession session, Report r) {
		return session.insert("report.insertReport", r);
	}
	
	public List<Report> selectReportAllByMemberNo(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		String memberNo = (String)param.get("memberNo");
    	
    	return session.selectList("report.selectReportAllByMemberNo", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage, "memberNo", memberNo));

    }
    
    public int selectReportAllByMemberNoCount(SqlSession session, String memberNo){	
    	return session.selectOne("report.selectReportAllByMemberNoCount", memberNo);
    }
}
