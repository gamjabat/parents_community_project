package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class SearchKeywordServlet
 */
@WebServlet("/board/searchKeyword.do")
public class SearchKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchKeywordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int cPage;
		try{
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e) {
			cPage = 1;
		}
		
		int numPerPage;
		try {
			numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
		} catch(NumberFormatException e) {
			numPerPage = 20;
		}
		
		String keyword = request.getParameter("keyword");
		
		Map<String, Object> param = Map.of("cPage", cPage, "numPerPage", numPerPage, "keyword", keyword);
		
		List<Board> boards = new BoardService().selectBoardAllLikeKeyword(param);
		
		HttpSession session = request.getSession();
		session.setAttribute("board", boards);
		session.setAttribute("keyword", keyword);
		
		// pageBar 생성하기
		int totalData = new BoardService().selectBoardAllLikeKeywordCount(keyword);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize = 5; //페이지바에 출력 될 숫자의 개수
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo + pageBarSize -1;
		
		String pageBar = "<ul class='pagination justify-content-center'>";
		if(pageNo==1) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>이전</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"
						+ request.getRequestURI()
						+ "?cPage=" + (pageNo-1)
						+ "&numPerPage=" + numPerPage
						+ "&keyword=" + keyword
						+ "'>이전</a>";
			pageBar+="</li>";
		}
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='"
							+ request.getRequestURI()
							+ "?cPage=" + (pageNo)
							+ "&numPerPage=" + numPerPage
							+ "&keyword=" + keyword
							+ "'>" + pageNo + "</a>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";
			pageBar+="</li>";
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"
						+ request.getRequestURI()
						+ "?cPage=" + (pageNo)
						+ "&numPerPage=" + numPerPage
						+ "'>다음</a>";
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		request.setAttribute("pageBar", pageBar);
		session.setAttribute("boardCount", totalData);

	request.getRequestDispatcher("/WEB-INF/views/board/searchKeyword.jsp")
	.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
