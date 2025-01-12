package com.gamjabat.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
	    BoardService service = new BoardService();
        // 데이터베이스에서 게시물 상세 정보를 조회
        Board board = new BoardService().selectByBoardNo(boardNo); // boardService는 게시물 정보를 가져오는 서비스 클래스의 인스턴스
        
        // 해시태그 데이터 가져오기
        List<String> hashtags = service.selectHashtagsByBoardNo(boardNo);
        request.setAttribute("hashtags", hashtags);
        
        // 조회된 게시물 정보를 request 객체에 속성으로 설정
        request.setAttribute("board", board);
	    
        // 조회수 증가
        service.increaseViewCount(boardNo);
        
	    }
//		
//	    Member m = Member.builder()
//				.memberId("jbag")
//				.memberNo("MB_0012")
//				.build();
//				
//				
	    //감자의 페이징 처리 로직입니다.
//	    List<BoardComments> comments=new BoardService().selectBoardComment(boardNo);
//	    request.setAttribute("comments", comments);
//		HttpSession session = request.getSession();
//		session.setAttribute("loginMember", m);
	    // boardDetail.jsp 페이지로 forward 메소드를 사용하여 요청과 응답을 전달
	    
	   
	    int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e){
			cPage=1;
		}
		
		int numPerPage;
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		} catch (NumberFormatException e) {
			numPerPage=30;
		}
		
		

		Map<String,Object> param=Map.of("cPage",cPage,"numPerPage",numPerPage,"boardNo",boardNo);
		List<BoardComments> comments=new BoardService().selectBoardCommentByNo(param);
		request.setAttribute("comments", comments);
		//pageBar생성하기
		int totalData=new BoardService().selectBoardCommentCountAll(boardNo);
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5; // 페이지바에 출력될 숫자의 개수
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;   //페이지바의 시작번호 1식증가하면서 맞춰준다.
		int pageEnd= pageNo+pageBarSize-1;
		
		
		//int commentscount=new BoardService().selectBoardCommentCountAll(boardNo);
		request.setAttribute("commentscount", totalData);
		
		String pageBar="<ul class='pagination justify-content-center'>";   //태그를 만들어서 쓴다.
		
		if(pageNo==1) { 
			pageBar+="<li class='page-item disabled'>"; // 첫번쨰 페이지라 안눌리게 만듬.
			pageBar+="<a class='page-link' href='#'>이전</a>";  
			pageBar+="</li>";
			
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+ 
					
					request.getRequestURI()    // 두개의 값을 보낸다.
					+ "?cPage="+(pageNo-1)
					+"&numPerPage="+numPerPage //다수값일때 &로 보낸다.
					+"'>이전</a>";  
			
			pageBar+="</li>";
		}

		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {   //클릭되면 안됀당.
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";   // 숫자가 들어감.
				pageBar+="</li>";
			} else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='"+ 
						
						request.getRequestURI()                     
						+ "?cPage="+(pageNo) // 요청하는페이지가 그 페이지가 된다 -를 지워서
						+"&numPerPage="+numPerPage
						+"&boardNo="+boardNo
						+"'>"+pageNo+"</a>";  // 숫자가 들어감.
				
				pageBar+="</li>";
			}
			pageNo++; //no값을 증가하면서 위 숫자값에 들어가게 됨. 
		}
		if(pageNo>totalPage) {
			pageBar+="<li class='page-item disabled'>";
			pageBar+="<a class='page-link' href='#'>다음</a>";   // 숫자가 들어감.
			pageBar+="</li>";
			
		} else {
			pageBar+="<li class='page-item'>";
			pageBar+="<a class='page-link' href='"+ 
					
					request.getRequestURI()                     	
					+ "?cPage="+(pageNo) // 요청하는페이지가 그 페이지가 된다 -를 지워서
					+"&numPerPage="+numPerPage
					+"&boardNo="+boardNo
					+"'>다음</a>";  // 숫자가 들어감.
			
			pageBar+="</li>";
		}
		pageBar+="</ul>";
		
		request.setAttribute("pageBar", pageBar);
		
	
		request.getRequestDispatcher("/WEB-INF/views/board/boardDetail.jsp")   //
		.forward(request, response);
		

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
