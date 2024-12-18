package com.gamjabat.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.dto.Member;

/**
 * Servlet implementation class AdminMainServlet
 */
@WebServlet("/admin/main.do")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//db연동시, Service,dao, dto를 통해 db에서 데이터를 가져와 Attribute로 넘겨줄 예정
		//우선 Member객체를 만들어서, ArrayList에 넣고,임의의 데이터를 넣어 화면 구현예정 
		ArrayList<Member> m = new ArrayList<>();
		
		
//		String strDate = "20200806";
//		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyyMMdd");
//		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy-MM-dd");
//		// String 타입을 Date 타입으로 변환
//		Date formatDate = null;
//		try {
//			formatDate = (Date) dtFormat.parse(strDate);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		for(int i=1;i<=100;i++) {
//			Member m1 = Member.builder()
//					.memberNo("user"+i).memberId("userId"+i)
//					.address("우리")
//					.birthday(formatDate)
//					.address("우리집!!!")
//					.email("asd3dasf@asdf.com")
//					.phone("102-213-2332")
//					.nickName("asdfa").createDate(formatDate)
//					.updateDate(formatDate).build();
//		}
//		
		request.getRequestDispatcher("/WEB-INF/views/admin/main/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
