package com.gamjabat.controller.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.service.member.MemberService;

/**
 * Servlet implementation class IdDuplicateServlet
 */
//@WebServlet("/member/idduplicate.do")
public class checkDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String nickname = request.getParameter("nickname");
//		String phone = request.getParameter("phone");
//		String email = request.getParameter("email");
//		
//		Map<String, Object> param = new HashMap<>();
//		
//		boolean isDuplicate = new MemberService().selectMemberToCheckDuplicate(param);
//		
//		boolean isDuplicate = (m != null);
//
//        response.setContentType("application/json;charset=utf-8");
//        response.getWriter().write("{\"isDuplicate\": " + isDuplicate + "}");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
