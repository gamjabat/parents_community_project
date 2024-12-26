package com.gamjabat.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/board/delete.do")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		 String boardNo = request.getParameter("boardNo");
	        if (boardNo != null && !boardNo.isEmpty()) {
	            BoardService boardService = new BoardService();
	            boardService.deleteBoard(boardNo);  // 논리적 삭제 메소드 호출
	            
	            response.sendRedirect(request.getContextPath() + "/board.do");  // 삭제 후 게시판 목록으로 리다이렉트
	        } else {
	            response.sendRedirect(request.getContextPath() + "/board.do");
	        }
	    
	
		
		/*	String boardNo = request.getParameter("boardNo");
			
			 if (boardNo != null && !boardNo.isEmpty()) {
		            BoardService boardService = new BoardService(); // BoardService 인스턴스 생성
		            boardService.deleteBoard(boardNo); // 인스턴스를 통해 메소드 호출
		            
		            response.sendRedirect(request.getContextPath() + "/board.do"); 
		            // 삭제 후 게시판 목록으로 리다이렉트
		            
		        } else {
		            // 오류 처리
		            //response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Board Number");
		        	response.sendRedirect(request.getContextPath() + "/board.do");
		        }*/
		  
		
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
