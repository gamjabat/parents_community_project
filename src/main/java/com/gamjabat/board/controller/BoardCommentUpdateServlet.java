package com.gamjabat.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentDeleteServlet
 */
@WebServlet("/board/updatecomment.do")
public class BoardCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String commentNo = request.getParameter("commentNo");
	        String commentContent = request.getParameter("commentContent");
	        String boardNo = request.getParameter("boardNo");
			
			   if (commentNo != null && !commentNo.isEmpty()) {
			 
			            // 댓글 삭제
			            BoardService boardService = new BoardService();
			            boardService.updateBoardComment(commentNo,commentContent);
			            response.sendRedirect(request.getContextPath() + "/board/boarddetail.do?boardNo="+boardNo);
			            
			   } else {
				   response.sendRedirect(request.getContextPath() + "/board/boarddetail.do?boardNo="+boardNo);
		        }
		}
		  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
