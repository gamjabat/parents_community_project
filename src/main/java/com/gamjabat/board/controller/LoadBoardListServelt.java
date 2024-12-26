package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.service.BoardService;
import com.google.gson.Gson;

/**
 * Servlet implementation class LoadBoardListServelt
 */
@WebServlet("/board/loadboardlist.do")
public class LoadBoardListServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadBoardListServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");

        Map<String, Object> param = new HashMap<>();
        param.put("type", type);
        param.put("limit", 20);
        
        List<Board> boardList = new BoardService().selectBoardsByType(param);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        new Gson().toJson(boardList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
