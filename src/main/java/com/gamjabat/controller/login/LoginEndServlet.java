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
		//String memberId = request.getParameter("memberId");
		//String memberPwd = request.getParameter("password");
		
		Member loginMember = (Member)request.getAttribute("loginMember");
		
		System.out.println("loginMember::"+loginMember);
		
		// origin code
		//============================================================
		// 원래 아이디가 있는지 확인하기 위한 코드이나, 
		// 해당 로직전 필터단계에서 유효성 검사를 하기 때문에, 우선 주석처리
		// 협의 필요 
		// 1. 현재 데이터베이스 암호화로 로그인 정보를 알수 없어서 로그인 체크 필요!
		// 2. 아이디와 패스워드가 틀려서 유효성검사가 실패한경우, '아이디와 패스워드가 일치하지 않습니다'
		//    팝업이 나온 후, 다시 메인화면으로 랜더링되고 있어 , 다시 로그인 페이지로 이동 필요  
		//Member m = new MemberService().selectMemberById(memberId);
		
		//==============================================================
		
		if(loginMember!=null) {
			// 아이디가 일치하는 회원이 있음 -> 로그인 성공
			// 세션에 저장해줘야 함
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
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
