package com.gamjabat.model.dao.report;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.model.dto.report.Report;

public class ReportDao {
	public int insertReport(SqlSession session, Report r) {
		return session.insert("report.insertReport", r);
	}

}
