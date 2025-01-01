package com.gamjabat.admin.controller.report;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.dto.ReportBoard;
import com.gamjabat.admin.model.service.report.AdminReportService;

/**
 * Servlet implementation class ReportCheckServlet
 */
@WebServlet("/admin/reportCheck.do")
public class ReportCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String reportNo = request.getParameter("reportNo");
		
		//신고글 정보 가져오기
		ReportBoard reportBoard = new AdminReportService().selectReportBoardByNo(reportNo);
		
		
		reportBoard.setReportFromContent(reportBoard.getReportFromContent().split("글내용:")[0]
									+"<br><br>글 내용 <br>"
									+reportBoard.getReportFromContent().split("글내용:")[1]);
		
		
		request.setAttribute("reportBoard", reportBoard);
		request.getRequestDispatcher("/WEB-INF/views/admin/board/reportProcessing.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
