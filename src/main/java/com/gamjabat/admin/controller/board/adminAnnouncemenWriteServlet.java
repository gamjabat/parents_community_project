package com.gamjabat.admin.controller.board;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.admin.model.service.board.AdminBoardService;
import com.gamjabat.admin.model.dto.Board;

/**
 * Servlet implementation class adminAnnouncemenWriteServlet
 */
@WebServlet("/admin/board/adminWriteAnnouncement.do")
public class adminAnnouncemenWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminAnnouncemenWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	       

	        int boardLikeCount = 0; // 좋아요 수 초기값
	        int viewCount = 0; // 조회수 초기값
	        Timestamp created_at = new Timestamp(System.currentTimeMillis()); // 생성 시각
	        Timestamp updated_at = new Timestamp(System.currentTimeMillis()); // 업데이트 시각
	        Timestamp deleted_at = new Timestamp(System.currentTimeMillis()); // 지운 시각
	        String isDeleted = "N"; // 삭제 여부 초기값
	        
	        Board insertBoard = Board.builder()
	                .title(title)
	                .content(content)
	                .likeCount(boardLikeCount)
	                .viewCount(viewCount)
	                .createdAt(created_at)
	                .updatedAt(updated_at)
	                .deletedAt(deleted_at)
	                .isDeleted(isDeleted)
	                .memberNo("MB_0121")
	                .boardTypeNumber("CAT-1")
	                .build();

	        // 서비스 클래스를 이용하여 데이터베이스에 저장
	        AdminBoardService service = new AdminBoardService();
	        int result = service.insertAnnounceBoard(insertBoard);

	 
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
