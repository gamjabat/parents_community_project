package com.gamjabat.admin.controller;

import java.io.IOException;
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
import com.gamjabat.admin.model.service.board.AdminBoardService;
import com.gamjabat.admin.model.service.member.AdminMemberService;

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
		AdminBoardService boardService = new AdminBoardService();
		
		
		
				//DB의 member테이블의 전체 데이터를 가져와 출력해주는 기능
			
				//Member 페이징 처리 //////////////////////////////////////
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				int numPerPage;
				try {
					numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
				}catch(NumberFormatException e) {
					numPerPage=5;
				}
				
				
				Map<String,Integer> param=Map.of("cPage",cPage,"numPerPage",numPerPage);
				
				List<Member> members=memberService.selectMemberAll(param);
				List<InqueryBoard> inqueryboards = boardService.selectInqueryBoardAll(param); 
				List<ReportBoard> reportBoards = boardService.selectReportBoardAll(param); 
				
				//pageBar생성하기
				int totalData=new AdminMemberService().selectMemberCount();
				int totalPage=(int)Math.ceil((double)totalData/numPerPage);
				int pageBarSize=5;//페이바에 출력될 숫자의 갯수
				int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd=pageNo+pageBarSize-1;
				
				
				
				
				System.out.println("tatal"+totalData+"::"+totalPage+"::"+pageBarSize+"::"+pageNo+"::"+pageEnd);
				
				String pageBar="<ul class='pagination justify-content-center'>";
				
				if(pageNo==1) {
					pageBar+="<li class='page-item disabled'>";
					pageBar+="<a class='page-link' href='#'>이전</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='"+
							request.getRequestURI()
							+"?cPage="+(pageNo-1)
							+"&numPerPage="+numPerPage
							+"'>이전</a>";
					pageBar+="</li>";
				}
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(pageNo==cPage) {
						pageBar+="<li class='page-item disabled'>";
						pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
						pageBar+="</li>";
					}else {
						pageBar+="<li class='page-item'>";
						pageBar+="<a class='page-link' href='"+
								request.getRequestURI()
								+"?cPage="+(pageNo)
								+"&numPerPage="+numPerPage
								+"'>"+pageNo+"</a>";
						pageBar+="</li>";
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<li class='page-item disabled'>";
					pageBar+="<a class='page-link' href='#'>다음</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='"+
							request.getRequestURI()
							+"?cPage="+(pageNo)
							+"&numPerPage="+numPerPage
							+"'>다음</a>";
					pageBar+="</li>";
				}
				pageBar+="</ul>";
				
		
		
	//	List<Member> members = memberService.selectMemberAll();
//		List<>
		
		System.out.println("members :: "+ members);
		System.out.println("inqueryboards :: "+ inqueryboards);
		System.out.println("페이지 :: "+ pageBar);
	
		
		
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("members", members);
		request.setAttribute("inqueryboards", inqueryboards);
		request.setAttribute("reportBoards", reportBoards);
		
		

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
