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
 * Servlet implementation class BoardCategoryServlet
 */
@WebServlet("/board/boardcategory.do")
public class BoardCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// URL에서 카테고리 파라미터 가져오기
        String categoryName = request.getParameter("category"); 
        
        BoardService boardService = new BoardService();
        List<Board> boardList;

        
        boardList = boardService.getBoardsByCategory(categoryName);
      
   
        request.setAttribute("board", boardList);

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
