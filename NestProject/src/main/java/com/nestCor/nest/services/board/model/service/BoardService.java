package com.nestCor.nest.services.board.model.service;

import java.util.List;
import java.util.Map;

import com.nestCor.nest.member.model.vo.Member;
import com.nestCor.nest.services.board.model.vo.Board;

public interface BoardService {
	/**
	 * 개발자 정보등록 메소드
	 * @param board
	 * @return result
	 */
	
	//게시물 추가
	int insertBoard(Board board);
	
	//게시글 총개수 - 페이징 처리 - 반드시 cate2를 넘겨줘야한다 그래야 매개변수로 오는 cate2를 조회한다.
	int selectBoardTotalContents(Board board);
	
	//게시물 리스트조회
	List<Map<String, String>> selectBoardList(int cPage, int limit, Board board);
	
	//게시물 상세보기
	Board selectOneBoard(int bno);
	
	//게시물 수정
	int updateBoard(Board board);
	
	//게시물 삭제
	int deleteBoard(int bno);

	Member getMemberInfo(int mNo);
}
