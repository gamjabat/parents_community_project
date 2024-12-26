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
        // 요청 파라미터 받기
        String commentNo = request.getParameter("commentNo");
        String boardNo = request.getParameter("commentBoardNo");
        String commentContent = request.getParameter("commentContent"); // 추가된 파라미터

        // 파라미터 검증
        if (commentNo != null && !commentNo.isEmpty() && 
            commentContent != null && !commentContent.isEmpty()) {
            // 댓글 수정 서비스 호출
            BoardService boardService = new BoardService();
            int result = boardService.updateBoardComment(commentNo, commentContent);

            if (result > 0) {
                // 댓글 수정 성공 시 게시판 상세 페이지로 이동
                response.sendRedirect(request.getContextPath() + "/board/boarddetail.do?boardNo=" + boardNo);
            } else {
                // 댓글 수정 실패 시 에러 메시지와 함께 게시판 상세 페이지로 이동
                request.setAttribute("errorMessage", "댓글 수정에 실패했습니다.");
                request.getRequestDispatcher("/board/boarddetail.do?boardNo=" + boardNo).forward(request, response);
            }
        } else {
            // 파라미터가 누락되었거나 잘못된 경우 리다이렉트
            response.sendRedirect(request.getContextPath() + "/board/boarddetail.do?boardNo=" + boardNo);
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
