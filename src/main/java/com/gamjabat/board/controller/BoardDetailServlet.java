package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.admin.model.dto.Member;
import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.dto.BoardComments;
import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/board/boarddetail.do")
public class BoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		// 게시물 번호를 요청 파라미터에서 가져옵니다.
	    String boardNo = request.getParameter("boardNo");
	    
	    // boardNo가 null이거나 빈 문자열이 아닐 경우에만 처리
	    if(boardNo != null && !boardNo.isEmpty()) {
	    	
        // 데이터베이스에서 게시물 상세 정보를 조회
        Board board = new BoardService().selectByBoardNo(boardNo); // boardService는 게시물 정보를 가져오는 서비스 클래스의 인스턴스

        // 조회된 게시물 정보를 request 객체에 속성으로 설정
        request.setAttribute("board", board);
	    
	    }
		Member m = Member.builder()
				.memberId("jbag")
				.memberNo("MB_0012")
				.build();
				
				
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", m);
	    // boardDetail.jsp 페이지로 forward 메소드를 사용하여 요청과 응답을 전달
	    request.getRequestDispatcher(getServletContext().getInitParameter("viewpath") + "/board/boardDetail.jsp").forward(request, response);
	
	    
	    //감자가 추가한 comments 코드입니다. 구현중.
	    List<BoardComments> comments=new BoardService().selectBoardComment(boardNo);
		request.setAttribute("comments", comments);
	
	}
		
		
		
		/* 팀장님이 만든 부분
		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath")+"/board/boardDetail.jsp")
		.forward(request, response); 
		
		
	}*/
	
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
