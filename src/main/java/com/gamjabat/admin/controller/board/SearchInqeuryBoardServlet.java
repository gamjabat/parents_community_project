package com.gamjabat.admin.controller.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.dto.InqueryBoard;
import com.gamjabat.admin.model.dto.Member;
import com.gamjabat.admin.model.dto.ReportBoard;
import com.google.gson.Gson;

/**
 * Servlet implementation class SearchInqeuryBoardServlet
 */
@WebServlet("/admin/searchInqueryboard.do")
public class SearchInqeuryBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchInqeuryBoardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<InqueryBoard> ibs = new ArrayList<>();

		// json으로 데이터 전송하기
		response.setContentType("application/json;charset=utf-8");
		Gson gson = new Gson();

		Member inqueryMember = Member.builder().memberId("user" + 1).build();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
