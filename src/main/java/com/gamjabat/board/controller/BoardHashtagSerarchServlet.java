package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardHashtagSerarchServlet
 */
@WebServlet("/board/hashtag.do")
public class BoardHashtagSerarchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardHashtagSerarchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String rawHashtag  = request.getParameter("hashtag");
		 if (rawHashtag  == null || rawHashtag .isEmpty()) {
		        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid hashtag parameter");
		        return;
		    }
		 
		 // 해시태그 값 정리
		    String hashtag = rawHashtag.trim();  // 앞뒤 공백 제거
		    if (hashtag.startsWith("#")) {
		        hashtag = hashtag.substring(1); // 앞에 # 제거
		    }
		    
        BoardService service = new BoardService();

        // 게시물 내용에서 해시태그 검색
        List<Board> boards = service.getBoardsByContentHashtag(hashtag);
        
        int resultCount = boards.size();

        // 데이터 전달
        request.setAttribute("board", boards);
        request.setAttribute("hashtag", hashtag);
        request.setAttribute("resultCount", resultCount);

        // JSP로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/board/searchHashtag.jsp").forward(request, response);
    }
    
	
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
