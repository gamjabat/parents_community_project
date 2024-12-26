package com.gamjabat.board.model.service;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.io.File;
import java.util.List;

import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;

import com.gamjabat.board.exception.ServiceException;
import com.gamjabat.board.model.dao.BoardDao;
import com.gamjabat.board.model.dto.Attachment;
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
	 
	 
	 
	/* public void deleteBoard(String boardNo) {
		 SqlSession session = getSession();
	     dao.deleteBoard(session, boardNo);
	    }*/
	 
	 
	 public void deleteBoard(String boardNo) {
	        SqlSession session = getSession();
	        try {
	            dao.deleteBoard(session, boardNo);  // 세션을 통해 논리적 삭제 수행
	            session.commit();
	        } catch (Exception e) {
	            session.rollback();
	            throw e;
	        } finally {
	            session.close();
	        }
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


	 // 파일 추가
	  public String uploadFile(HttpServletRequest request) throws ServiceException {
	        String imageUrl = null;
	        SqlSession session = getSession();

	        try {
	            if (!ServletFileUpload.isMultipartContent(request)) {
	                throw new ServiceException("Content type is not multipart/form-data");
	            }

	            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	            for (FileItem item : multiparts) {
	                if (!item.isFormField()) {
	                    String originalName = item.getName();
	                    String storedFileName = generateStoredFileName(originalName);
	                    String uploadPath = request.getServletContext().getRealPath("uploads");
	                    File storeFile = new File(uploadPath + File.separator + storedFileName);
	                    item.write(storeFile);

	                    Attachment attachment = new Attachment();
	                    attachment.setOriginalFileName(originalName);
	                    attachment.setStoredFileName(storedFileName);
	                    attachment.setFilePath(uploadPath);
	                    // 여기서 게시글 ID 등의 추가 정보도 설정할 수 있습니다.

	                    dao.insertAttachment(session, attachment);

	                    imageUrl = request.getContextPath() + "/uploads/" + storedFileName;
	                    break;
	                }
	            }
	        } catch (Exception e) {
	            throw new ServiceException("File upload failed", e);
	        } finally {
	            if (session != null) session.close();
	        }
	        return imageUrl;
	    }

	    private String generateStoredFileName(String originalName) {
	        // 파일 이름 생성 로직 구현
	        return "newFileNameBasedOnSomeLogic";
	    }

	    
	    
	    //조회수 증가
	    public void increaseViewCount(String boardNo) {
	        SqlSession session = getSession();
	        dao.increaseViewCount(session, boardNo);
	    }
		
	    private static final Logger logger = Logger.getLogger(BoardService.class.getName());

	    public boolean toggleLike(String boardNo, String memberNo) {
	        SqlSession session = getSession();
	        try {
	            boolean isLiked = dao.isLiked(session, boardNo, memberNo);
	            if (isLiked) {
	                dao.removeLike(session, boardNo, memberNo);
	            } else {
	                dao.addLike(session, boardNo, memberNo);
	            }
	            session.commit();
	            return true;
	        } catch (Exception e) {
	            session.rollback();
	            logger.log(Level.SEVERE, "Error toggling like", e);
	            return false;
	        } finally {
	            session.close();
	        }
	    }

	    public int getLikeCount(String boardNo) {
	        SqlSession session = getSession();
	        try {
	            return dao.getLikeCount(session, boardNo);
	        } finally {
	            session.close();
	        }
	    }
	    
	    
	    public boolean isLiked(String boardNo, String memberNo) {
	        SqlSession session = getSession();
	        boolean isLiked = false;
	        try {
	            isLiked = dao.checkIfLiked(session, boardNo, memberNo);
	        } finally {
	            session.close();
	        }
	        return isLiked;
	    }


	    

	 
	 public List<Board> selectBoardAllByMemberNo(Map<String, Object> param){
		 	SqlSession session = getSession();
			List<Board> boards = dao.selectBoardAllByMemberNo(session, param);
			session.close();
			return boards;
	 }
	 
	 public int selectBoardAllByMemberNoCount(String memberNo) {
			SqlSession session = getSession();
			int count = dao.selectBoardAllByMemberNoCount(session, memberNo);
			session.close();
			return count;
	}
			

	 
	 public int deleteBoardComment(String commentNo) {
		 SqlSession session = getSession();
		 
	     int result=dao.deleteBoardComment(session, commentNo);
	     
	     if(result>0) {session.commit();}
	     else {session.rollback();}
	     
	     session.close();    
	     
	     return result;

	 }

}
