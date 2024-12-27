package com.gamjabat.controller.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.service.member.MemberService;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetTopLikedMembersServlet
 */
@WebServlet("/member/gettoplikedmembers.do")
public class GetTopLikedMembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTopLikedMembersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService memberService = new MemberService();
        List<Map<String, Object>> topLikedMembers = memberService.selectTopLikedMembers();

        // JSON으로 변환 후 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        new Gson().toJson(topLikedMembers, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
