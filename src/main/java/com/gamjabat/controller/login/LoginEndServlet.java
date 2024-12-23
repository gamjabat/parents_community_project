package com.gamjabat.controller.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.model.dto.member.Member;
import com.gamjabat.service.member.MemberService;

/**
 * Servlet implementation class LoginEndServlet
 */
@WebServlet(name="loginEndServlet", urlPatterns="/login/loginend.do")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("password");
		
		Member m = new MemberService().selectMemberById(memberId);
		if(m != null && m.getMemberPwd().equals(memberPwd)) {
			// 아이디가 일치하는 회원이 있음 -> 로그인 성공
			// 세션에 저장해줘야 함
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", m);
			// 메인화면을 리다이렉트 시킴
			System.out.println(request.getContextPath());
			response.sendRedirect(request.getContextPath());
			
		} else {
			// 로그인 실패
			request.setAttribute("msg", "아이디와 패스워드가 일치하지 않습니다.");
			request.setAttribute("loc","/");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
