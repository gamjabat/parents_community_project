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
 * Servlet implementation class BoardWriteDataServlet
 */
@WebServlet("/board/boardwriteend.do")
public class BoardWriteDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String boardTypeNumber = request.getParameter("category");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String tagString = request.getParameter("tag");  // 'tags' 파라미터 값을 먼저 변수에 저장
        String[] tags = tagString.split(","); // ','로 태그 분리

    
        int boardLikeCount = 0; // 좋아요 수 초기값
        int viewCount = 0; // 조회수 초기값
        Timestamp created_at = new Timestamp(System.currentTimeMillis()); // 생성 시각
        Timestamp updated_at = new Timestamp(System.currentTimeMillis()); // 업데이트 시각
        Timestamp deleted_at = new Timestamp(System.currentTimeMillis()); // 지운 시각
        String isDeleted = "N"; // 삭제 여부 초기값
        
    
     // 요청에서 memberNo 파라미터 값을 읽어와서 사용
        String memberNo = request.getParameter("memberNo");  
        
        Board insertBoard = Board.builder()
        		//.boardNo(boardNo)
                .title(title)
                .content(content)
                .likeCount(boardLikeCount)
                .viewCount(viewCount)
                .createdAt(created_at)
                .updatedAt(updated_at)
                .deletedAt(deleted_at)
                .isDeleted(isDeleted)
                .memberNo(memberNo)
                .boardTypeNumber(boardTypeNumber)
                .tag(tags)
                .build();
        

        // 서비스 클래스를 이용하여 데이터베이스에 저장
        BoardService service = new BoardService();
        int result = service.insertBoard(insertBoard, tags);

        response.sendRedirect(request.getContextPath() + "/board.do" );

    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
