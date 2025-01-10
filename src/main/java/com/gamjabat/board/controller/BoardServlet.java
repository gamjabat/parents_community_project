package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class Board
 */
@WebServlet("/board.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 페이징 처리
				int cPage;
				try {
					cPage=Integer.parseInt(request.getParameter("cPage"));
				}catch(NumberFormatException e) {
					cPage=1;
				}
				
				int numPerPage;
				try {
					numPerPage =Integer.parseInt(request.getParameter("numPerPage"));
				}catch(NumberFormatException e) {
					numPerPage=10;
				}
				Map<String, Integer> param = Map.of("cPage", cPage, "numPerPage", numPerPage);
				
				// pageBar 생성하기
				
				int totalData = new BoardService().selectBoardCount();
				int totalPage=(int)Math.ceil((double)totalData/numPerPage);
				int pageBarSize=5; // 페이지바에 출력될 숫자의 개수
				int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
				int pageEnd = pageNo + pageBarSize+1;
				
				String pageBar="<ul class='pagination justify-content-end'>";
				
				if(pageNo==1) {
					pageBar+="<li class = 'page-item disabled'>";
					pageBar+="<a class = 'page-link' href='#'>이전</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class = 'page-item'>";
					pageBar+="<a class = 'page-link' href='"+
							  request.getRequestURI()
							  +"?cPage="+(pageNo-1)
							  +"&numPerPage=" + numPerPage
							  +"'>이전</a>";
					pageBar+="</li>";
				}
				
				while(!(pageNo>pageEnd||pageNo>totalPage)) {
					if(pageNo==cPage) {
						pageBar+="<li class = 'page-item disabled'>";
						pageBar+="<a class = 'page-link' href='#'>"+pageNo+"</a>";
						pageBar+="</li>";
					}else {
						pageBar+="<li class = 'page-item'>";
						pageBar+="<a class = 'page-link' href='"+
								  request.getRequestURI()
								  +"?cPage="+(pageNo)
								  +"&numPerPage=" + numPerPage
								  +"'>"+pageNo+"</a>";
						pageBar+="</li>";
				
					}
					pageNo++;
				}
				
				if(pageNo>totalPage) {
					pageBar+="<li class = 'page-item disabled'>";
					pageBar+="<a class = 'page-link' href='#'>다음</a>";
					pageBar+="</li>";
					
				}else {
					pageBar+="<li class = 'page-item'>";
					pageBar+="<a class = 'page-link' href='"+
							  request.getRequestURI()
							  +"?cPage="+(pageNo)
							  +"&numPerPage=" + numPerPage
							  +"'>다음</a>";
					pageBar+="</li>";
				}
				pageBar+="</ul>";
				
				request.setAttribute("pageBar", pageBar);

		
		
		
        List<Board> board = new BoardService().selectBoardAll(param);
        request.setAttribute("board", board);
        request.setAttribute("categoryName", "전체");
        
        
        // 게시판 페이지로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/board/board.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
