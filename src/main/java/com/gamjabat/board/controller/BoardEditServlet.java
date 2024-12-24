package com.gamjabat.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardEditServlet
 */
@WebServlet("/board/edit.do")
public class BoardEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String boardNo = request.getParameter("boardNo");
		 
		 BoardService boardService = new BoardService(); // BoardService 인스턴스 생성
		 
	     Board board = boardService.selectByBoardNo(boardNo);
		 
	     request.setAttribute("board", board);
	     
	     request.getRequestDispatcher("/WEB-INF/views/board/boardEdit.jsp").forward(request, response);
	     
	}

	
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
