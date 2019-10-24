package com.nestCor.nest.services.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.board.model.vo.Board;

@Repository
public class BoardDaoImp implements BoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(Board board) {
		return sqlSession.insert("board.insertBoard", board);
	}

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int limit, Board board) {
		System.out.println("DAO까지 cate가 잘갔는지 값 확인 : "+board);
		RowBounds rows = new RowBounds((cPage-1) * limit, limit);
		return sqlSession.selectList("board.selectBoardList", board, rows);

	}

	@Override
	public int selectBoardTotalContents(Board board) {
		System.out.println("DAO까지 cate1 과 cate2가 잘갔는지 값 확인 : "+board);
		return sqlSession.selectOne("board.selectBoardTotalContents", board);
	
	}
	
	@Override
	public Board selectOneBoard(int bno) {
		//카운트 설정을 위해 업데이트를 했음 알고리즘의 힘!! 
		sqlSession.update("board.updateCount",bno);
		return sqlSession.selectOne("board.selectOneBoard", bno);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("board.updateBoard", board);
	}

	@Override
	public int deleteBoard(int bno) {
		return sqlSession.update("board.deleteBoard", bno);
	}

	@Override
	public Member getMemberInfo(int mNo) {
		
		return sqlSession.selectOne("board.getMemberInfo",mNo);
	}

}
