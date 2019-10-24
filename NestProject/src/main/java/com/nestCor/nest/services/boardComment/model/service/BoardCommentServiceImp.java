package com.nestCor.nest.services.boardComment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nestCor.nest.services.boardComment.model.dao.BoardCommentDao;
import com.nestCor.nest.services.boardComment.model.vo.BoardComment;

@Service
public class BoardCommentServiceImp implements BoardCommentService {

	@Autowired
	public BoardCommentDao boardcommentDao;
	
	/**
	 * 개발자 정보등록 메소드
	 * @param boardcomment
	 * @return result
	 */
	

	@Override
	public int insertBoardComment(BoardComment boardcomment) {
		System.out.println("boardComment service까지 잘왓음");
		System.out.println("boardcomment service 값 확인 : "+boardcomment);
		return boardcommentDao.insertBoardComment(boardcomment);
	}

	@Override
	public int selectBoardCommentTotalContents(BoardComment boardcomment) {
		// TODO Auto-generated method stub
		return boardcommentDao.selectBoardCommentTotalContents(boardcomment);
	}

	@Override
	public List<BoardComment> selectBoardCommentList(BoardComment boardcomment) {
		// TODO Auto-generated method stub
		return boardcommentDao.selectBoardCommentList(boardcomment);
	}

	@Override
	public int deleteBoardComment(int cno) {
		return boardcommentDao.deleteBoardComment(cno);
	}
	
	
}
