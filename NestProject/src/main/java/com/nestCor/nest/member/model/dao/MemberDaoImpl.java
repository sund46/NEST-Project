package com.nestCor.nest.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nestCor.nest.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertMember(Member m) {

		return sqlSession.insert("Member_mapper.insertMember",m);
	}

	@Override
	public Member selectMember(String userId) {
		
		return sqlSession.selectOne("Member_mapper.selectMember",userId);
	}

	@Override
	public Member updateMember(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idDupCheck(String userId) {
		
		return sqlSession.selectOne("Member_mapper.idDupCheck",userId);
	}

	@Override
	public int nickDupCheck(String nickName) {
		
		return sqlSession.selectOne("Member_mapper.nickDupCheck",nickName);
	}

	public Member searchId(Member m) {
	
	
		return sqlSession.selectOne("Member_mapper.searchId",m);
	}

	@Override
	public Member searchPwd(Member m) {
		
		
		return sqlSession.selectOne("Member_mapper.searchPwd",m);
	}

	@Override
	public int resetPwd(Member m) {
		
		return sqlSession.update("Member_mapper.resetPwd",m);
	}

	@Override
	public List<Member> selectBizMemberList(int bizNo) {
	
		return sqlSession.selectList("Member_mapper.selectBizMemberList",bizNo);
	}
	
	@Override
	public int memberBusinessServiceUpdate(int mNo) {

		return sqlSession.update("Member_mapper.memberBusinessUpdate", mNo);
	}

	@Override
	public int memberPremiumServiceUpdate(int mNo) {
		
		return sqlSession.update("Member_mapper.memberPremiumUpdate", mNo);
	}
	
	@Override
	public int updateMemberBizNo(Member m) {
		return sqlSession.update("Member_mapper.updateMemberBizNo", m);
	}
	
	@Override
	public int selectMno(String userId) {
		return sqlSession.selectOne("Member_mapper.selectMno", userId);
	}
	@Override
	public String memberAdmin(int mNo) {
		return sqlSession.selectOne("Member_mapper.memberAdmin", mNo);
	}

	@Override
	public String memberInvitation(int mNo) {
		return sqlSession.selectOne("Member_mapper.memberInvitation", mNo);
	}

}
