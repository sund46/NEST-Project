package com.nestCor.nest.member.model.service;

import java.util.List;

import com.nestCor.nest.member.model.vo.Member;

public interface MemberService {

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
		/***
		 * 멤버 비즈니스 등록
		 * @param m
		 * @return
		 */
		int updateMemberBizNo(Member m);
		
		/***
		 * 비즈니스 서비스 변경
		 * @param m
		 * @return
		 */
		int memberBusinessServiceUpdate(int mNo);
		
		/***
		 * 프리미엄 서비스 변경
		 * @param m
		 * @return
		 */
		int memberPremiumServiceUpdate(int mNo);
		
		int selectMno(String userId);
		/***
		 * 회원 비즈니스 관리자 여부
		 * @param mNo
		 * @return
		 */
		String memberAdmin(int mNo);
		
		/***
		 * 비즈니스 초대 요청 여부
		 * @param mNo
		 * @return
		 */
		String memberInvitation(int mNo);
	
}
