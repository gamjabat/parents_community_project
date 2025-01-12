package com.gamjabat.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;
import com.gamjabat.model.dto.member.Member;

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

    	    // 세션에서 로그인한 사용자 정보 가져오기
    	    Member loginMember = (Member) request.getSession().getAttribute("loginMember");
    	    if (loginMember == null) {
    	        response.sendRedirect(request.getContextPath() + "/login.do");
    	        return;
    	    }

    	    BoardService boardService = new BoardService();
    	    String writerMemberNo = boardService.getWriterMemberNo(boardNo);

    	    // 로그 출력
    	    System.out.println("로그인된 사용자: " + loginMember);
    	    System.out.println("로그인된 사용자 NO: " + loginMember.getMemberNo());
    	    System.out.println("게시글 작성자 NO: " + writerMemberNo);
    	    System.out.println("게시글 번호: " + boardNo);

    	    // 작성자인지 확인
    	    if (!loginMember.getMemberNo().equals(writerMemberNo)) {
    	    	request.setAttribute("errorMsg", "게시글 수정 권한이 없습니다.");
    	    	request.getRequestDispatcher("/WEB-INF/views/board/errorPage.jsp").forward(request, response);
    	        return;
    	    } else {
    	        System.out.println("작성자가 맞습니다. 수정 권한 있음.");
    	    }

    	    Board board = boardService.selectByBoardNo(boardNo);
    	    System.out.println(board.getTag()); // 태그 데이터 확인
    	    
    	    request.setAttribute("board", board);
    	    request.getRequestDispatcher("/WEB-INF/views/board/boardEdit.jsp").forward(request, response);
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	/*
    	String boardNo = request.getParameter("boardNo");

        // 세션에서 로그인한 사용자 정보 가져오기
        Member loginMember = (Member) request.getSession().getAttribute("loginMember");
        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/login.do");
            return;
        }

        BoardService boardService = new BoardService();
        Board board = boardService.selectByBoardNo(boardNo);

        // 작성자인지 확인
        if (!board.getWriter().equals(loginMember.getMemberNo())) {
            response.sendRedirect(request.getContextPath() + "/board.do");
            return;
        }

        request.setAttribute("board", board);
        request.getRequestDispatcher("/WEB-INF/views/board/boardEdit.jsp").forward(request, response);*/
    }
	     

	
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
