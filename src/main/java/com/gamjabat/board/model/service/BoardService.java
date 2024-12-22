package com.gamjabat.board.model.service;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dao.BoardDao;
import com.gamjabat.board.model.dto.Board;

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
	
}
