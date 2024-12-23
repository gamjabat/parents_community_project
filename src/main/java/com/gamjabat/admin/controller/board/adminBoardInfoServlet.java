package com.gamjabat.admin.controller.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.dto.InqueryBoard;
import com.gamjabat.admin.model.dto.Member;

/**
 * Servlet implementation class adminBoardInfoServlet
 */
@WebServlet("/admin/board/adminBoardInfo.do")
public class adminBoardInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adminBoardInfoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String inqueryNo= request.getParameter("inqueryNo");
		
		ArrayList<InqueryBoard> inqueryList = new ArrayList<>();
		
//		Member inqueryMember = Member.builder().memberId("userId");
//			
//			InqueryBoard ib = InqueryBoard.builder()
//								.inqueryNo(inqueryNo)
//							
		
		
		
		
//		try {
//			
//		}catch(NullPointerException e) {
//			
//			
//		}
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
