package com.gamjabat.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.model.dto.report.Report;
import com.gamjabat.service.report.ReportService;

/**
 * Servlet implementation class MypageReportDetailServlet
 */
@WebServlet(name = "MypageReportDetailServlet" , urlPatterns = {"/member/reportdetail.do"})
public class MypageReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageReportDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportNo = request.getParameter("reportNo");
		
		HttpSession session = request.getSession();
		
		Report report = new ReportService().selectReport(reportNo);
		
		session.setAttribute("report", report);
		
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypageReportDetail.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
