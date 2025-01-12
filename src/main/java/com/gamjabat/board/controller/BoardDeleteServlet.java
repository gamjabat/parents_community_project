package com.gamjabat.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.service.BoardService;
import com.gamjabat.model.dto.member.Member;

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
		 
		 // 세션에서 로그인한 사용자 정보 가져오기
 	    Member loginMember = (Member) request.getSession().getAttribute("loginMember");
 	    if (loginMember == null) {
 	        response.sendRedirect(request.getContextPath() + "/");
 	        return;
 	    }
 	    
	    BoardService boardService = new BoardService();
	    String writerMemberNo = boardService.getWriterMemberNo(boardNo);

	    // 작성자인지 확인
	    if (!loginMember.getMemberNo().equals(writerMemberNo)) {
	    	request.setAttribute("errorMsg", "게시글 삭제 권한이 없습니다.");
	        //response.sendRedirect(request.getContextPath() + "/");
	    	request.getRequestDispatcher("/WEB-INF/views/board/errorPage.jsp").forward(request, response);
	        return;
	    } else {
	        System.err.println("작성자가 맞습니다. 삭제 권한 있음.");
	    }
	    

 	    
        if (boardNo != null && !boardNo.isEmpty()) {
            //BoardService boardService = new BoardService();
            boardService.deleteBoard(boardNo);  // 논리적 삭제 메소드 호출
            
            response.sendRedirect(request.getContextPath() + "/board.do");  // 삭제 후 게시판 목록으로 리다이렉트
        } else {
            response.sendRedirect(request.getContextPath() + "/board.do");
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
