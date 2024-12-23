package com.gamjabat.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dto.Board;

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
    }
    
