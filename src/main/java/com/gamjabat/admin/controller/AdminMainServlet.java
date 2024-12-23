package com.gamjabat.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.dto.Member;
import com.gamjabat.admin.model.service.AdminMemberService;

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
		
		
		AdminMemberService memberService = new AdminMemberService();
		
		
		//db연동시, Service,dao, dto를 통해 db에서 데이터를 가져와 Attribute로 넘겨줄 예정
		//우선 Member객체를 만들어서, ArrayList에 넣고,임의의 데이터를 넣어 화면 구현예정 
		List<Member> m = memberService.selectMemberAll();
//		ArrayList<ReportBoard> rbs = new ArrayList<>();
//		ArrayList<InqueryBoard> ibs = new ArrayList<>();
		
		
		
		
		
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
//		for(int i=1;i<=5;i++) {
//			Member m1 = Member.builder()
//					.memberNo("user"+i).memberId("userId"+i)
//					.name("이름"+i)
//					.address("우리")
//					.birthday(strDate)
//					.address("우리집!!!")
//					.email("asd3dasf@asdf.com")
//					.phone("102-213-2332")
//					.nickName("asdfa").createDate(strDate)
//					.updateDate(strDate).build();
//			m.add(m1);
//		}
//		
//		Member rf = Member.builder().memberId("user"+1).build();
//		Member sf = Member.builder().memberId("user"+2).build();
//		for(int i=1;i<=5;i++) {
//			
//			ReportBoard rb = ReportBoard.builder().reportNo(i+1+"")
//							.postNo(i+1+"")
//							.reportCode("댓글")
//							.reportTitle("탈주각"+i)
//							.reportContent("그때는 진짜 깡패가 되는거야!"+i)
//							.createDate("2024-01-01")
//							.reportStatus("처리중").reportMember(rf).suspectMember(sf)
//							.build();
//			rbs.add(rb);
//		}
//		
//		Member inqueryMember = Member.builder().memberId("user"+1).build();
//		for(int i=1;i<=5;i++) {
//			
//			InqueryBoard ib = InqueryBoard.builder().inqueryNo(i+1+"")
//							.postNo(i+1+"")
//							.inqueryCode("댓글")
//							.inqueryTitle("탈주각"+i)
//							.inqueryContent("그때는 진짜 깡패가 되는거야!"+i)
//							.createDate("2024-01-01")
//							.status("처리중").inqueryMember(inqueryMember)
//							.build();
//			ibs.add(ib);
//		}
//
//		
//		System.out.println(m.size());
//		
//		request.setAttribute("members", m);
//		request.setAttribute("reportboards", rbs);
//		request.setAttribute("inqueryboards", ibs);
		
		
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
