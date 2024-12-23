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
@WebFilter(servletNames= {"loginCheckServlet"})
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
			Member checkMember = Member.builder().memberId(userId).memberPwd(pe.getParameter(userPwd)).build();
			System.out.println("checkMember:::"+checkMember);
			Member invlidMember = service.loginInvalidCheck(checkMember);
			
			System.out.println("invlidMember::::"+invlidMember);
			
			if(invlidMember!=null) {
				session.setAttribute("loginMember", invlidMember);
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
