package com.gamjabat.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;
import com.gamjabat.model.dto.member.Member;

/**
 * Servlet implementation class MypageBoardListServlet
 */
@WebServlet("/member/mypageboardlist.do")
public class MypageBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");

		List<Board> myBoards = new BoardService().selectBoardAllByMemberNo(loginMember.getMemberNo());
		
		session.setAttribute("myBoards", myBoards);
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypageBoardList.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
