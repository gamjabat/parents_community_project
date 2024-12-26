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
        Board board = boardService.selectByBoardNo(boardNo);

        // 작성자인지 확인
        if (!board.getWriter().equals(loginMember.getMemberNo())) {
            response.sendRedirect(request.getContextPath() + "/board.do");
            return;
        }

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
