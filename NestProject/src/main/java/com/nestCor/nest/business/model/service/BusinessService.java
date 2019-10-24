package com.nestCor.nest.business.model.service;

import java.util.List;

import com.nestCor.nest.business.model.vo.Business;
import com.nestCor.nest.business.model.vo.BusinessMember;
import com.nestCor.nest.member.model.vo.Member;

public interface BusinessService {
	
	/***
	 * 비즈니스 등록
	 * @param b
	 * @return
	 */
	int insertBusiness(String bizName);
	
	/***
	 * 최근 등록된 비즈니스 번호
	 * @return
	 */
	int selectBizNo();
	
	/***
	 * 비즈니스 멤버 관리자 등록
	 * @param bm
	 * @return
	 */
	int insertBusinessMemberAdmin(BusinessMember bm);

	/***
	 * 비즈니스 멤버 등록
	 * @param bm
	 * @return
	 */
	int insertBusinessMember(BusinessMember bm);
	
	/***
	 * 초대하려는 비즈니스 번호
	 * @param mNo
	 * @return
	 */
	int inviteBizNo(int mNo);
	
	/***
	 * 초대하려는 회원 이메일의 회원 번호
	 * @param userId
	 * @return
	 */
	int inviteMNo(String userId);
	
	/***
	 * 비즈니스 신청 수락 (bizNo 등록)
	 * @param mNo
	 * @return
	 */
	int updateBusinessMemberY(int mNo);

	/***
	 * 비즈니스 신청 거절
	 * @param mNo
	 * @return
	 */
	int updateBusinessMemberN(int mNo);
	
	/***
	 * 승인 대기 사용자 정보
	 * @param mNo
	 * @return
	 */
	List<Member> approvalN(int mNo);
	
	/***
	 * 승인 대기 사용자 수
	 * @param mNo
	 * @return
	 */
	int totalApprovalN(int mNo);

	/***
	 * 승인 사용자 정보
	 * @param mNo
	 * @return
	 */
	List<Member> MemberListApprovalY(int mNo);
	
	/***
	 * 비즈니스 승인
	 * @param mNo
	 * @return
	 */
	int approvalY(int mNo);
	
	/***
	 * 비즈니스 사용자 수
	 * @param mNo
	 * @return
	 */
	int totalBusinessMember(int mNo);
	
	/***
	 * 비즈니스 관리자 수
	 * @param mNo
	 * @return
	 */
	int totalBusinessAdmin(int mNo);
	
	/***
	 * 비즈니스 전체 스페이스
	 * @param mNo
	 * @return
	 */
	int totalBusinessSpace(int mNo);
	
	/***
	 * 비즈니스 사용자 리스트
	 * @param mNo
	 * @return
	 */
	List<Member> BusinessMemberList(int mNo);
	
	/***
	 * 비즈니스 관리자 리스트
	 * @param mNo
	 * @return
	 */
	List<Member> BusinessAdminList(int mNo);
	
	/***
	 * 승인된 사용자의 비즈니스명
	 * @param mNo
	 * @return
	 */
	String bizName(int mNo);
	
	/***
	 * 비즈니스명 변경
	 * @param mNo
	 * @return
	 */
	int updateBizName(Business biz);
	
	/***
	 * 초대 가능 사용자 수 - 1
	 * @param bizNo
	 * @return
	 */
	int maxMemberM(int bizNo);
	
	/***
	 * 초대 가능 사용자 수 + 1
	 * @param bizNo
	 * @return
	 */
	int maxMemberP(int bizNo);
	
	/***
	 * 초대 가능 사용자 수
	 * @param bizNo
	 * @return
	 */
	int maximumMember(int bizNo);
	
	/***
	 * 비즈니스 요청 거절 사용자 삭제
	 * @param mNo
	 * @return
	 */
	int deleteBM(int mNo);
	
	/***
	 * 사용자 관리자 여부
	 * @param mNo
	 * @return
	 */
	String bmAdmin(int mNo);
	
	/***
	 * 비즈니스멤버 관리자 권한 부여
	 * @param mNo
	 * @return
	 */
	int bmAdminY(int mNo);
	
	/***
	 * 비즈니스멤버 관리자 권한 취소
	 * @param mNo
	 * @return
	 */
	int bmAdminN(int mNo);
	
	/***
	 * 비활성화 사용자
	 * @param mNo
	 * @return
	 */
	List<Member> activeListN(int mNo);
	
	/***
	 * 사용자 활성화
	 * @param mNo
	 * @return
	 */
	int activeY(int mNo);
	
	/***
	 * 사용자 비활성화
	 * @param mNo
	 * @return
	 */
	int activeN(int mNo);
	
	int countNoteBook(int mNo);
	int countNote(int mNo);
	
	List<BusinessMember> memberActiveY(int mNo);
	
}
