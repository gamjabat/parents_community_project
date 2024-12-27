package com.gamjabat.admin.model.service.report;

import static com.gamjabat.admin.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.admin.model.dao.board.AdminBoardDao;
import com.gamjabat.admin.model.dto.InqueryBoard;
import com.gamjabat.admin.model.dto.Member;
import com.gamjabat.admin.model.dto.ReportBoard;

public class AdminReportService {
	AdminBoardDao boardDao = new AdminBoardDao();

	public List<InqueryBoard> selectInqueryBoardAll(Map<String, Integer> param) {
		SqlSession session = getSession();
		List<InqueryBoard> inqueryBoard = boardDao.selectInqueryBoardAll(session, param);
		return inqueryBoard;
	}

	public List<ReportBoard> selectReportBoardAll(Map<String, Integer> param) {
		SqlSession session = getSession();
		
		List<ReportBoard> reportBoard = boardDao.selectReportBoardAll(session, param);
		return reportBoard;
	}

	public ReportBoard selectReportBoardByNo(String reportNo) {
		SqlSession session = getSession();
		
		ReportBoard reportBoard = boardDao.selectReportBoardByNo(session,reportNo);
		
		return reportBoard;
		
		
	}
}
