package com.nestCor.nest.member.model.dao;

import java.util.List;

import com.nestCor.nest.member.model.vo.Member;

public interface MemberDao {
		int insertMember(Member m);
		Member selectMember(String userId);
		Member updateMember(Member m);
		int deleteMember(String userId);
		int idDupCheck(String userId);
		int nickDupCheck(String nickName);
		Member searchId(Member m);
		Member searchPwd(Member m);
		int resetPwd(Member m);
		List<Member> selectBizMemberList(int bizNo);

		int updateMemberBizNo(Member m);
		int memberBusinessServiceUpdate(int mNo);
		int memberPremiumServiceUpdate(int mNo);
		int selectMno(String userId);
		String memberAdmin(int mNo);
		String memberInvitation(int mNo);
} 
