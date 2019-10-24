package com.nestCor.nest.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nestCor.nest.member.model.dao.MemberDao;
import com.nestCor.nest.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;
	
	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(m);
	}

	@Override
	public Member selectMember(String userId) {
		
		return mDao.selectMember(userId);
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
		
		return mDao.idDupCheck(userId);
	}

	@Override
	public int nickDupCheck(String nickName) {
	
		return mDao.nickDupCheck(nickName);
	}

	@Override
	public Member searchId(Member m) {
		
		return mDao.searchId(m);
	}

	@Override
	public Member searchPwd(Member m) {
		
		return mDao.searchPwd(m);
	}

	@Override
	public int resetPwd(Member m) {
		
		return mDao.resetPwd(m);
	}
	
	@Override
	public List<Member> selectBizMemberList(int bizNo) {
		
		return mDao.selectBizMemberList(bizNo);
	}
	

	
	@Override
	public int memberBusinessServiceUpdate(int mNo) {

		return mDao.memberBusinessServiceUpdate(mNo);
	}
	
	@Override
	public int memberPremiumServiceUpdate(int mNo) {
		
		return mDao.memberPremiumServiceUpdate(mNo);
	}


	@Override
	public int updateMemberBizNo(Member m) {
		return mDao.updateMemberBizNo(m);
	}
	
	@Override
	public int selectMno(String userId) {
		return mDao.selectMno(userId);
	}
	@Override
	public String memberAdmin(int mNo) {
		return mDao.memberAdmin(mNo);
	}

	@Override
	public String memberInvitation(int mNo) {
		return mDao.memberInvitation(mNo);
	}

}
