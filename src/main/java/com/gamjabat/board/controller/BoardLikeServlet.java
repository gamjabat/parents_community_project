package com.gamjabat.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.gamjabat.board.model.service.BoardService;

/**
 * Servlet implementation class BoardLikeServlet
 */
@WebServlet("/board/toggleLike.do")
public class BoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    }*/
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		StringBuilder jsonBuffer = new StringBuilder();
	    try (BufferedReader reader = request.getReader()) {
	        String line;
	        while ((line = reader.readLine()) != null) {
	            jsonBuffer.append(line);
	        }
	    } catch (IOException e) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        JSONObject errorResponse = new JSONObject();
	        errorResponse.put("error", "Invalid JSON input");
	        response.getWriter().print(errorResponse.toString());
	        return;
	    }

	    // JSON 파싱 및 유효성 검사
	    JSONObject jsonRequest;
	    String boardNo, memberNo;
	    try {
	        jsonRequest = new JSONObject(jsonBuffer.toString());
	        boardNo = jsonRequest.getString("boardNo");
	        memberNo = jsonRequest.getString("memberNo");

	        if (boardNo == null || boardNo.isEmpty() || memberNo == null || memberNo.isEmpty()) {
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            JSONObject errorResponse = new JSONObject();
	            errorResponse.put("error", "Missing or invalid parameters");
	            response.getWriter().print(errorResponse.toString());
	            return;
	        }
	    } catch (Exception e) {
	        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	        JSONObject errorResponse = new JSONObject();
	        errorResponse.put("error", "Malformed JSON");
	        response.getWriter().print(errorResponse.toString());
	        return;
	    }

	    // 서비스 호출
	    BoardService service = new BoardService();
	    JSONObject jsonResponse = new JSONObject();
	 // 실패한 경우 응답에 error 메시지 포함
	    try {
	        int isSuccess = service.toggleLike(boardNo, memberNo);
	        int newLikeCount = service.getLikeCount(boardNo);
	        jsonResponse.put("success", isSuccess);
	        jsonResponse.put("newLikeCount", newLikeCount);
	        out.print(jsonResponse.toString());
	    } catch (Exception e) {
	    	e.printStackTrace();
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        jsonResponse.put("success", false); // 응답에 success 필드 포함
	        jsonResponse.put("error", "Error processing like toggle: " + e.getMessage());
	        out.print(jsonResponse.toString());
	    }
	}

}
