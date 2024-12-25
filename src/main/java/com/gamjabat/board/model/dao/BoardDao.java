package com.gamjabat.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dto.Board;
import com.gamjabat.board.model.dto.BoardComments;


public class BoardDao {

	public int insertBoard(SqlSession session, Board b) {
		return session.insert("board.insertBoard", b);
	}
	
	
	public List<Board> selectBoardAll(SqlSession session) {
		return session.selectList("board.selectBoardsAll");
	}
	
	
	
    public Board selectByBoardNo(SqlSession session, String boardNo) {
        
        return session.selectOne("board.selectByBoardNo", boardNo);
        	
	}
	
    public void deleteBoard(SqlSession session, String boardNo) {
        
            session.delete("board.deleteBoard", boardNo);
            session.commit();
            

     }
    
    
    public void updateBoard(SqlSession session, Board board) {
        
            session.update("Board.updateBoard", board);
            session.commit();
    
     }
       

     
    
    public int insertBoardComment(SqlSession session,BoardComments bc) {
		return session.insert("board.insertBoardComment",bc);
	}

    
    	//감자가 추가한 comments 코드입니다. 구현중.
    	public List<BoardComments> selectBoardComment(SqlSession session, String boardNo) {
    	return session.selectList("board.selectBoardComment",boardNo);
    	}
    
    	
    public List<Board> selectBoardAllByMemberNo(SqlSession session, String memberNo){	
    	return session.selectList("board.selectBoardAllByMemberNo", memberNo);
    }
    
}
    
