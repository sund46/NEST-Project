package com.nestCor.nest.services.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.board.model.dao.BoardDao;
import com.nestCor.nest.services.board.model.vo.Board;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	public BoardDao boardDao;
	
	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int limit, Board board) {
		return boardDao.selectBoardList(cPage, limit, board);
	}

	@Override
	public int selectBoardTotalContents(Board board) {
		return boardDao.selectBoardTotalContents(board);
	}

	@Override
	public Board selectOneBoard(int bno) {
		return boardDao.selectOneBoard(bno);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int bno) {
		int result = boardDao.deleteBoard(bno);
		
		return result;
	}

	@Override
	public Member getMemberInfo(int mNo) {
		
		
		return boardDao.getMemberInfo(mNo);
	}

	
}
