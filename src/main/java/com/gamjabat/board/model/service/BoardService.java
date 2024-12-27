package com.gamjabat.board.model.service;

import static com.gamjabat.common.SqlSessionTemplate.getSession;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
	
	public int insertBoard(Board b,String[] tags) {
	
		SqlSession session = getSession();
		int result=0;
		try {
			 result = dao.insertBoard(session, b);
			if(result>0 && tags.length>0) {
				for(String tag : tags) {
					Map<String,String> tagMap=new HashMap<>();
					tagMap.put("tag", tag);
					result=dao.insertHashtag(session,tagMap);
					if(result>0) {
						result=dao.linkHashtagToBoard(session,Map.of("tag",tagMap.get("tagCode"),"boardNo",b.getBoardNo()));
						if(result==0) {
							session.rollback();
							return 0;
						}
					}
				}
				session.commit();
			}else {
				return 0;
			}
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			return 0;
		}finally {
			session.close();
		}
		return result;
	}
	
	public List<Board> selectBoardAll(Map<String, Integer> param) {
		
		SqlSession session = getSession();
		List<Board> boards = dao.selectBoardAll(session,param);
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
//	        SqlSession session = getSession();

	        try {
	            if (!ServletFileUpload.isMultipartContent(request)) {
	                throw new ServiceException("Content type is not multipart/form-data");
	            }

	            List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	            for (FileItem item : multiparts) {
	                if (!item.isFormField()) {
	                    String originalName = item.getName();
	                    String storedFileName = generateStoredFileName(originalName);
	                    String uploadPath = request.getServletContext().getRealPath("/uploads/board/");
	                    File storeFile = new File(uploadPath + File.separator + storedFileName);
	                    item.write(storeFile);

	                    Attachment attachment = new Attachment();
	                    attachment.setOriginalFileName(originalName);
	                    attachment.setStoredFileName(storedFileName);
	                    attachment.setFilePath(uploadPath);
	                    // 여기서 게시글 ID 등의 추가 정보도 설정할 수 있습니다.

	                   // dao.insertAttachment(session, attachment);

	                    imageUrl = request.getContextPath() + "/uploads/board/" + storedFileName;
	                    break;
	                }
	            }
	        } catch (Exception e) {
	            throw new ServiceException("File upload failed", e);
	        } 
	        return imageUrl;
	    }

	    private String generateStoredFileName(String originalName) {
	        // 파일 이름 생성 로직 구현
	    	String ext=originalName.substring(originalName.lastIndexOf("."));
	    	int rnd=(int)(Math.random()*1000)+1;
	    	SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	        return "BD_"+sdf.format(new Date())+"_"+rnd+ext;
	    }

	    
	    
	    //조회수 증가
	    public void increaseViewCount(String boardNo) {
	        SqlSession session = getSession();
	        dao.increaseViewCount(session, boardNo);
	    }
		

	    public int toggleLike(String boardNo, String memberNo) {
	        SqlSession session = getSession();
	        try {
	            boolean isLiked = dao.isLiked(session, boardNo, memberNo);
	            if (isLiked) {
	                int result2=dao.removeLike(session, boardNo, memberNo);
	                if(result2>0) {
	                	result2=dao.decreseLike(session, boardNo);
	                	if(result2>0) {
	                		session.commit();
	                		return 0;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            } else {
	                int result2=dao.addLike(session, boardNo, memberNo);
	                if(result2>0) {
	                	result2=dao.increaseLikeCount(session, boardNo);
	                	if(result2>0) {
	                		session.commit();
	                		return 1;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            }
	            return 2;
	        } catch (Exception e) {
	        	e.printStackTrace();
	            session.rollback();
	            return 2;
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
	    
	    
	    public int isLiked(String boardNo, String memberNo) {
	        SqlSession session = getSession();
	        int isLiked = 0;
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

	 
	 
	 public List<Board> selectBoardAllLikeKeyword(Map<String, Object> param){
		 	SqlSession session = getSession();
			List<Board> boards = dao.selectBoardAllLikeKeyword(session, param);
			session.close();
			return boards;
	 }
	 
	 public int selectBoardAllLikeKeywordCount(String keyword) {
			SqlSession session = getSession();
			int count = dao.selectBoardAllLikeKeywordCount(session, keyword);
			session.close();
			return count;
	 }

			


	 public String getWriterMemberNo(String boardNo) {
		    SqlSession session = getSession();
		    String writerMemberNo = dao.getWriterMemberNo(session, boardNo);
		    session.close();
		    return writerMemberNo;
		}

	 
	 //댓글 삭제
	 public int deleteBoardComment(String commentNo) {
		 SqlSession session = getSession();
		 
	     int result=dao.deleteBoardComment(session, commentNo);
	     
	     if(result>0) {session.commit();}
	     else {session.rollback();}
	     
	     session.close();    
	     
	     return result;
	 }
	 

	    public List<Board> getBoardsByCategory(String typeNo) {
	        SqlSession session = getSession();
	        List<Board> boardList = dao.selectBoardsByCategory(session, typeNo);
	        session.close();
	        return boardList;
	    }
		


	public List<Board> selectBoardsByType(Map<String, Object> param) {
	 	SqlSession session = getSession();
		List<Board> boards = dao.selectBoardsByType(session, param);
		session.close();
		return boards;
	}


	 //댓글 수정
	 public int updateBoardComment(String commentNo, String commentContent) {
		 SqlSession session = getSession();
		 
	 	BoardComments comment = new BoardComments();
	    comment.setCommentNo(commentNo);
	    comment.setCommentContent(commentContent);
	    
	     int result=dao.updateBoardComment(session, comment);
	     
	     if(result>0) {session.commit();}
	     else {session.rollback();}
	     
	     session.close();    
	     
	     return result;
	 }
	 

	 public List<BoardComments> selectBoardCommentByNo(Map<String,Object> param) {
			SqlSession session=getSession();  
			List<BoardComments> comments=dao.selectBoardCommentByNo(session,param); 
			session.close();
			return comments;
			
		}
	 //댓글 페이지바.
	 public int selectBoardCommentCountAll(String boardNo) {
			SqlSession session=getSession();
			int count=dao.selectBoardCommentCountAll(session,boardNo);
			session.close();
			return count;
		}

	 
	 
	 // 게시물 페이징바
	 public List<Board> selectPagingBoard(Map<String, Integer> param) {
		 SqlSession session = getSession();
		 List<Board> board = dao.selectPagingBoard(session, param);
		 session.close();
		 return board;
	 }
	 
	 // 게시물 페이징바(관련) 행의 총 개수 
	 public int selectBoardCount() {
		 SqlSession session = getSession();
		 int count = dao.selectBoardCount(session);
		 session.close();
		 return count;
	 }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 public List<BoardComments> selectCommentsAllByMemberNo(Map<String, Object> param){
		 	SqlSession session = getSession();
			List<BoardComments> comments = dao.selectCommentsAllByMemberNo(session, param);
			session.close();
			return comments;
	 }
	 
	 public int selectCommentsAllByMemberNoCount(String memberNo) {
			SqlSession session = getSession();
			int count = dao.selectCommentsAllByMemberNoCount(session, memberNo);
			session.close();
			return count;

	}

	
	 
	
	 
	 // 게시물 저장 및 번호 호환
	 
	 public String insertBoardAndGetId(Board board) {
		    SqlSession session = getSession();
		    int result = dao.insertBoard(session, board);
		    String boardNo = board.getBoardNo(); // MyBatis의 selectKey 활용
		    if (result > 0) {
		        session.commit();
		    } else {
		        session.rollback();
		    }
		    session.close();
		    return boardNo;
		}

	 // 해시태그 저장 및 번호 반환
	 
	 public List<String> insertHashtags(List<String> tags) {
		    SqlSession session = getSession();
		    List<String> hashtagNos = new ArrayList<>();
		    for (String tag : tags) {
		        String hashtagNo = dao.insertHashtagAndGetId(session, tag);
		        hashtagNos.add(hashtagNo);
		    }
		    session.commit();
		    session.close();
		    return hashtagNos;
		}

	 public int linkHashtagToBoard(String boardNo, List<String> hashtagNos) {
		    SqlSession session = getSession();
		    int count = 0; // 연결된 행의 수를 저장
		    try {
		        for (String hashtagNo : hashtagNos) {
		            Map<String, String> params = Map.of("boardNo", boardNo, "hashtagNo", hashtagNo);
		            count += dao.linkHashtagToBoard(session, params); // DAO 호출
		        }
		        session.commit();
		    } finally {
		        session.close();
		    }
		    return count; // 성공적으로 삽입된 행의 개수 반환
		}




}
