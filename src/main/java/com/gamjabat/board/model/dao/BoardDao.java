package com.gamjabat.board.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dto.Board;

public class BoardDao {

	public int insertBoard(SqlSession session, Board b) {
		return session.insert("board.insertBoard", b);
		
	}
}
