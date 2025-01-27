package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.BoardComments;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardCommentInsertServlet
 */

@WebServlet(name = "BoardCommentInsertServlet", asyncSupported = true, urlPatterns = { "/board/insertcomment.do" })
public class BoardCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardCommentInsertServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String content = request.getParameter("content");
		String boardNo = request.getParameter("commentBoardNo");
		int level = Integer.parseInt(request.getParameter("level"));
		String writer = request.getParameter("commentMemberNo");
		String bcRef = request.getParameter("parentCommentNo");

		BoardComments bc = BoardComments.builder().commentBoardNo(boardNo).commentLevel(level).commentMemberNo(writer)
				.commentContent(content).parentCommentNo(bcRef != null && !bcRef.equals("") ? bcRef : null).build();

		int result = new BoardService().insertBoardComment(bc);

		String msg, loc = "/board/boarddetail.do?boardNo=" + boardNo;
		if (result > 0) {
			msg = "댓글 등록 성공";
		} else {
			msg = "댓글 등록 실패";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath") + "/common/msg.jsp")
				.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
