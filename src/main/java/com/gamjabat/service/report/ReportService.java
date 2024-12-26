package com.gamjabat.service.report;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dao.report.ReportDao;
import com.gamjabat.model.dto.report.Report;

public class ReportService {
	private ReportDao dao = new ReportDao();
	
	public int insertReport(Report r) {
		SqlSession session = getSession();
		int result = dao.insertReport(session, r);
		if(result>0) session.commit();
		else session.rollback(); session.close();
		return result;
	}
}
