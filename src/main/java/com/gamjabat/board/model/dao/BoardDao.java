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
       

     
    //댓글 인서트 코드
    public int insertBoardComment(SqlSession session,BoardComments bc) {
		return session.insert("comments.insertBoardComment",bc);
	}

    

    

   //댓글 리스트 코드
	public List<BoardComments> selectBoardComment(SqlSession session, String boardNo) {
		return session.selectList("comments.selectBoardComment",boardNo);
	}

    


    	
    	 public void insertAttachment(SqlSession session, Attachment attachment) {
 	        session.insert("attachment.insertAttachment", attachment);
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
    
    public List<BoardComments> selectCommentsAllByMemberNo(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		String memberNo = (String)param.get("memberNo");
    	
    	return session.selectList("comments.selectCommentsAllByMemberNo", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage, "memberNo", memberNo));

    }
    
    public int selectCommentsAllByMemberNoCount(SqlSession session, String memberNo){	
    	return session.selectOne("comments.selectCommentsAllByMemberNoCount", memberNo);
    }

    


    //댓글 삭제
    public int deleteBoardComment(SqlSession session, String commnetNo) {
        
        return session.update("comments.deleteBoardComment", commnetNo);
        
    }

    public List<Board> selectBoardAllLikeKeyword(SqlSession session, Map<String, Object> param){	
    	int cPage = (int)param.get("cPage");
		int numPerPage = (int)param.get("numPerPage");
		String keyword = (String)param.get("keyword");
    	
    	return session.selectList("board.selectBoardAllLikeKeyword", Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage, "keyword", keyword));

    }
    
    public int selectBoardAllLikeKeywordCount(SqlSession session, String keyword){	
    	return session.selectOne("board.selectBoardAllLikeKeywordCount", keyword);
    }
    

    
    public List<Board> selectBoardsByCategory(SqlSession session, String typeNo) {
        return session.selectList("board.selectBoardsByCategory", typeNo);
    }



    public List<Board> selectBoardsByType(SqlSession session, Map<String, Object> param) {
        return session.selectList("board.selectBoardsByType", param);
    }
    
    //댓글 수정
    public int updateBoardComment(SqlSession session, BoardComments comment) {
        return session.update("comments.updateBoardComment", comment);
    }

    
    //댓글 페이징 처리
    public List<BoardComments> selectBoardCommentByNo(SqlSession session,Map<String,Object> param) {
		int cPage=(Integer)(param.get("cPage"));
		int numPerPage=(Integer)(param.get("numPerPage"));
		String boardNo=(String)param.get("boardNo");
		
		return session.selectList("comments.selectBoardCommentByNo", Map.of("start",(cPage-1)*numPerPage+1,"end",cPage*numPerPage,"boardNo",param.get("boardNo"))); 
	}
   //댓글 페이징 카운터
    public int selectBoardCommentCountAll(SqlSession session, String boardNo) {
		return session.selectOne("comments.selectBoardCommentCountAll",boardNo);
	}

    public List<Board> selectPagingBoard(SqlSession session, Map<String, Integer> param) {
    		int cPage = param.get("cPage");
    		int numPerPage = param.get("numPerPage");
    		
    		return session.selectList("board.selectPagingBoard", 
    				Map.of("start",(cPage-1)*numPerPage+1, "end", cPage*numPerPage ));
    	
    }
    
    public int selectBoardCount(SqlSession session) {
    	return session.selectOne("board.selectBoardCount");
    }

}
