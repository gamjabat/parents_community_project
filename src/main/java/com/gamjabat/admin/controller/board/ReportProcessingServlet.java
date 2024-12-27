package com.gamjabat.admin.controller.board;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.service.board.AdminBoardService;

/**
 * Servlet implementation class ReportProcessingServlet
 */
@WebServlet("/admin/board/reportProcessing.do")
public class ReportProcessingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportProcessingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String processingContent = request.getParameter("details");
		String reason = request.getParameter("reason");
		String reportNo = request.getParameter("reportNo");
		
		System.out.println("프로세싱 ::"+processingContent+"사유::"+reason+"asdf:: "+ reportNo);
		
		Map<String, String> param = new HashMap<>();
		param.put("pContent", processingContent);
		param.put("reason", reason);
		param.put("reportNo", reportNo);
		
		
		
		int result = new AdminBoardService().updateReportProcessing(param);
		
		String msg, loc = "/admin/reportCheck.do?reportNo=" + reportNo;
		if (result > 0) {

			msg = "신고처리성공";
		} else {
			msg = "신고처리실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath") + "/common/msg.jsp")
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
