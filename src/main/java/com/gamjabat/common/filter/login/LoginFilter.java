package com.gamjabat.common.filter.login;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.common.PasswordEncoding;
import com.gamjabat.model.dto.member.Member;
import com.gamjabat.service.member.MemberService;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(servletNames= {"loginCheckServlet","loginEndServlet"})
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {

		String userId = request.getParameter("memberId");
		String userPwd = request.getParameter("password");
		
		System.out.println("userPwd::"+userPwd);

		

//		String saveId=request.getParameter("saveId");
//		System.out.println(saveId);
//		if(saveId!=null) {
//			//아이디 저장해
//			//Cookie를 이용해서 처리한다.
//			Cookie c=new Cookie("saveId",userId);
//			c.setMaxAge(60*60*24*100);
//			c.setPath("/");
//			response.addCookie(c);
//		}else {
//			Cookie c=new Cookie("saveId","");
//			c.setMaxAge(0);
//			c.setPath("/");
//			response.addCookie(c);
//		}
//		
//		
//		Member m = Member.builder().memberId(userId).build();
//
//		HttpSession session = request.getSession();
//		session.setAttribute("loginMember", m);

////		Member m=new MemberService().selectMemberById(userId);
//		if(m!=null&&m.getPassword().equals(password)) {
//			//아이디가 일치하는 회원이 있음 -> 로그인 성공
//			HttpSession session=request.getSession();
//			//메인화면으로 리다이렉트 시킴
//			response.sendRedirect(request.getContextPath());
//		}else {
//			//로그인 실패
//			request.setAttribute("msg","아이디와 패스워드가 일치하지 않습니다.");
//			request.setAttribute("loc","/");
//			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
//			.forward(request,response);
//		}
		
		
		
		

		//request 인코딩 utf-8로 변환 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
//		Member m = Member.builder().memberId(userId).build();
		
		HttpSession session = request.getSession();

		
		if(userId.equals("admin")) {			
			request.getRequestDispatcher("/admin/main.do").forward(request, response);
		}else {
			PasswordEncoding pe = new PasswordEncoding(request);
			MemberService service = new MemberService();
			Member checkMember = Member.builder().memberId(userId).memberPwd(pe.getParameter("password")).build();
			System.out.println("checkMember:::"+checkMember);
			System.out.println("pe.getParameter(userPwd)::"+pe.getParameter(userPwd));
			Member invlidMember = service.loginInvalidCheck(checkMember);
			
			System.out.println("invlidMember::::"+invlidMember);
			
			
			
			if(invlidMember!=null) {
				session.setAttribute("loginMember", invlidMember);
				request.setAttribute("loginMember", invlidMember);
			}
			request.getRequestDispatcher("/main/login.do").forward(request, response);
		}
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
