package com.gamjabat.board.model.service;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dao.BoardDao;
import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.dto.BoardComments;


public class BoardService{
	
	private BoardDao dao = new BoardDao();
	
	public int insertBoard(Board b) {
	
	SqlSession session = getSession();
	int result = dao.insertBoard(session, b);
	
	if(result>0) session.commit();
	else session.rollback();
	session.close();
	
	return result;
}
	
	public List<Board> selectBoardAll() {
		
		SqlSession session = getSession();
		List<Board> boards = dao.selectBoardAll(session);
		session.close();
		return boards;
		
	}
	 public Board selectByBoardNo(String boardNo) {
		 
		 SqlSession session = getSession();
		 Board b = dao.selectByBoardNo(session, boardNo);
		 session.close();
		 return b;   
	}
	 public void deleteBoard(String boardNo) {
		 SqlSession session = getSession();
	     dao.deleteBoard(session, boardNo);
	    }
	 

	 
	 
	 
	 public void updateBoard(Board board) {
		 SqlSession session = getSession();
	     dao.updateBoard(session, board);
	    }
	 
			

	
	 public int insertBoardComment(BoardComments bc) {
			SqlSession session=getSession();
			int result=dao.insertBoardComment(session,bc);
			if(result>0) session.commit();
		    else session.rollback();
			session.close();
			return result;
		}

	 
	 //감자가 추가한 comments 코드입니다. 구현중.
	 public List<BoardComments> selectBoardComment(String boardNo) {
			SqlSession session=getSession();	
			List<BoardComments> comments=dao.selectBoardComment(session,boardNo);
			session.close();
			return comments;
			
		}

			
}
