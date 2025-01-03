package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/board/commentisLiked.do")
public class BoardCommentLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCommentLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberNo=request.getParameter("memberNo");
		String commentNo=request.getParameter("commentNo");
		int result=new BoardService().commentisLiked(Map.of("memberNo",memberNo,"commentNo",commentNo));
		System.out.println(result);
		response.setContentType("text/plain;charset=utf-8");
		//0 : 삭제, 1 : 추가,  2 : 에러
		response.getWriter().print(result);
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
