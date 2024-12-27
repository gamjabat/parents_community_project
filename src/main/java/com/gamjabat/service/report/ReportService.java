package com.gamjabat.service.report;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

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
	
	public List<Report> selectReportAllByMemberNo(Map<String, Object> param){
	 	SqlSession session = getSession();
		List<Report> reports = dao.selectReportAllByMemberNo(session, param);
		session.close();
		return reports;
	 }
	 
	 public int selectReportAllByMemberNoCount(String memberNo) {
		SqlSession session = getSession();
		int count = dao.selectReportAllByMemberNoCount(session, memberNo);
		session.close();
		return count;
	}
	 
	 public Report selectReport(String reportNo) {
			SqlSession session = getSession();
			Report report = dao.selectReport(session, reportNo);
			session.close();
			return report;
		}
}
