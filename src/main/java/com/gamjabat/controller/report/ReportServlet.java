package com.gamjabat.controller.report;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.model.dto.member.Member;
import com.gamjabat.model.dto.report.Report;
import com.gamjabat.service.member.MemberService;
import com.gamjabat.service.report.ReportService;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/board/report.do")
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentBoardNo = request.getParameter("currentBoardNo");
		String reportBoardNo = request.getParameter("boardNo");
        String reportCommentNo = request.getParameter("commentNo");
        String reportReasonType = request.getParameter("reason");
        String reportContent = request.getParameter("details");
        
        HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		
		Report r = Report.builder()
				.reportContent(reportContent)
				.reportReasonType(reportReasonType)
				.reportMemberNo(loginMember.getMemberNo())
				.reportBoardNo(reportBoardNo)
				.reportCommentNo(reportCommentNo)
				.build();
		
        
        int result = new ReportService().insertReport(r);
		
		String msg, loc = "/board/boarddetail.do?boardNo="+currentBoardNo;
		
		if(result > 0) {
			msg = "신고가 접수되었습니다.";
		}else {
			msg = "신고 접수가 실패되었습니다. 다시 시도해주세요.";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		response.setContentType("text/html;charset=utf-8");
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
