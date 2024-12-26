package com.gamjabat.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.model.dto.Attachment;
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
        
            session.update("board.logicalDeleteBoard", boardNo);
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
    


    	
    	 public void insertAttachment(SqlSession session, Attachment attachment) {
 	        session.insert("board.insertAttachment", attachment);
 	        session.commit();
 	    }
    
    	
    	 // 조회수 증가
    	 public void increaseViewCount(SqlSession session, String boardNo) {
 	        try {
 	            session.update("board.increaseViewCount", boardNo);
 	            session.commit();
 	        } catch (Exception e) {
 	            session.rollback();
 	            throw new RuntimeException("조회수 업데이트 실패", e);
 	        } finally {
 	            session.close();
 	        }
 	    }
    	
    	
    	 public boolean isLiked(SqlSession session, String boardNo, String memberNo) {
    	        // MyBatis를 사용하여 좋아요 여부 확인
    	        Integer count = session.selectOne("board.isLiked", Map.of("boardNo", boardNo, "memberNo", memberNo));
    	        return count != null && count > 0;
    	    }

    	    public int addLike(SqlSession session, String boardNo, String memberNo) {
    	        // 좋아요 추가 로직
    	        return session.insert("board.addLike", Map.of("boardNo", boardNo, "memberNo", memberNo));
    	        
    	    }

    	    public int removeLike(SqlSession session, String boardNo, String memberNo) {
    	        // 좋아요 삭제 로직
    	        return session.delete("board.removeLike", Map.of("boardNo", boardNo, "memberNo", memberNo));
    	        
    	    }
    	    
    	    public int decreseLike(SqlSession session, String boardNo) {
    	    	return session.update("board.decreaseLikeCount", boardNo);
    	    }
    	    
    	    public int increaseLikeCount(SqlSession session, String boardNo) {
    	    	return session.update("board.increaseLikeCount", boardNo);
    	    }
    	    
    	    public int getLikeCount(SqlSession session, String boardNo) {
    	        return session.selectOne("board.getLikeCount", boardNo);
    	    }
    	    
    	    
    	    public int checkIfLiked(SqlSession session, String boardNo, String memberNo) {
    	        int likeCount = session.selectOne("board.checkIfLiked", 
    	            Map.of("boardNo", boardNo, "memberNo", memberNo));
    	        return likeCount;
    	    }
    	    
    	    
    	    

    	
    public List<Board> selectBoardAllByMemberNo(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		String memberNo = (String)param.get("memberNo");
    	
    	return session.selectList("board.selectBoardAllByMemberNo", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage, "memberNo", memberNo));

    }
    
    public int selectBoardAllByMemberNoCount(SqlSession session, String memberNo){	
    	return session.selectOne("board.selectBoardAllByMemberNoCount", memberNo);
    }
    
    public String getWriterMemberNo(SqlSession session, String boardNo) {
        return session.selectOne("board.getWriterMemberNo", boardNo);
    }

    
}
    
