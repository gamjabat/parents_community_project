package com.gamjabat.admin.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.model.dto.member.Member;

/**
 * Servlet implementation class AdminMemberInfoServlet
 */
@WebServlet("/admin/memberInfo.do")
public class AdminMemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = request.getParameter("memberNo");
		String memberId = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String birthday = request.getParameter("birth");
		String nickName = request.getParameter("nickName");
		String createDate = request.getParameter("createDate");
		String updateDate = request.getParameter("updateDate");
		String deleteDate = request.getParameter("deleteDate");
		boolean isDelete = Boolean.parseBoolean(request.getParameter("isDelete"));
		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//		Date barthDt;
//		Date createDt;
//		Date updateDt;
//		Date deleteDt;
//		try {
//			barthDt=new Date(sdf.parse(birthday).getTime());
//			createDt=new Date(sdf.parse(createDate).getTime());
//			updateDt=new Date(sdf.parse(updateDate).getTime());
//			deleteDt=new Date(sdf.parse(deleteDate).getTime());
//		}catch(ParseException | NullPointerException e) {
//			e.printStackTrace();
//			barthDt=null;
//			createDt=null;
//			updateDt=null;
//			deleteDt=null;
//		}
		
		
		// 현재 createDate값으로 날짜값을 통일함 
		
		Member member = Member.builder()
				.memberNo("1")
				.memberId("mickySung")
				.memberName("성윤모")
				.email("ironDrogon@ndn.com")
				.phone("011-1111-1112")
				.address("고니는 가지마")
				.birthday(Date.valueOf("1922-11-11"))
				.nickname("곽철용")
				.isDeleted(false)
				.build();
		
		
		System.out.println(member.toString());
		
		request.setAttribute("member", member);
		
		request.getRequestDispatcher("/WEB-INF/views/admin/member/memberInfo.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
