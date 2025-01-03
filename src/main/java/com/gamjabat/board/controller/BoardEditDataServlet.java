package com.gamjabat.board.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardEditDataServlet
 */
@WebServlet("/board/boardupdateend.do")
public class BoardEditDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardEditDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");

        // 수정 데이터 가져오기
        String boardNo = request.getParameter("boardNo");
        String category = request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
       // String tagString = request.getParameter("tag"); // 태그 문자열
        //String[] tags = tagString.split(","); // 태그 분리

        Timestamp updated_at = new Timestamp(System.currentTimeMillis()); // 수정 시각

        // Board 객체 생성 및 값 설정
        Board updateBoard = Board.builder()
            .boardNo(boardNo)
            .categoryName(category)
            .title(title)
            .content(content)
            .updatedAt(updated_at)
            //.tag(tags)
            .build();

        // 서비스 호출하여 업데이트 수행
        BoardService service = new BoardService();
        int result = service.updateBoard(updateBoard);

        // 업데이트 성공 여부에 따라 페이지 이동
        if (result > 0) {
            // 성공 시 상세보기 페이지로 이동
            response.sendRedirect(request.getContextPath() + "/board/boarddetail.do?boardNo=" + boardNo);
        } else {
            // 실패 시 에러 페이지로 이동
            request.setAttribute("errorMsg", "게시글 수정에 실패하였습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
