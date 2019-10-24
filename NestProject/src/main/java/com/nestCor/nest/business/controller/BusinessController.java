package com.nestCor.nest.business.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nestCor.nest.business.model.service.BusinessService;
import com.nestCor.nest.business.model.vo.Business;
import com.nestCor.nest.business.model.vo.BusinessMember;
import com.nestCor.nest.member.model.service.MemberService;
import com.nestCor.nest.member.model.vo.Member;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessService bService;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("/business/insertBusiness.do")
	public String insertBusiness(Model model, @RequestParam String bizName, HttpSession session) {
		
		
		
		Member m = (Member)session.getAttribute("member");
		int mNo = m.getmNo();
		System.out.println(mNo);
		
		
		int result = bService.insertBusiness(bizName);
		
		
		String loc="/member/noteMain.do?mNo="+ mNo;
		String msg = "";
		
		if(result > 0) {
			
			int bizNo = bService.selectBizNo();
			System.out.println("bizno : " + bizNo);
			
			m.setBizNo(bizNo);
			
			int updateMemberBizNo = mService.updateMemberBizNo(m);
			
			BusinessMember bm = new BusinessMember();
			bm.setBizNo(bizNo);
			bm.setmNo(mNo);
			bm.setAdmin("Y");
			
			int insertBusinessMemberAdmin = bService.insertBusinessMemberAdmin(bm);

			if(updateMemberBizNo > 0) System.out.println("회원 비즈니스 번호 등록 성공");
			if(insertBusinessMemberAdmin > 0) { System.out.println("비즈니스 멤버 등록 성공");
			
			System.out.println("비즈니스 등록 성공");
			msg = "비즈니스 등록 성공";
			 
			}
			
			model
			.addAttribute("loc", loc)
			.addAttribute("msg", msg)
			.addAttribute("insertBusinessMemberAdmin", insertBusinessMemberAdmin); 
		}
		
		/* return "client/member/memberSummary"; */
		
		return "client/common/msg";
	}
	
	
	 @RequestMapping("/business/updateBizName.do") 
	 public String updateBizName(Model model, @RequestParam String bizName,HttpSession session) {

		 Member m = (Member)session.getAttribute("member");
		 int bizNo = m.getBizNo();
		 
		 Business biz = new Business();
		 biz.setBizNo(bizNo);
		 biz.setBizName(bizName);
		 
		 int updateBizName = bService.updateBizName(biz);
		 
		 String loc="/member/noteMain.do?mNo="+m.getmNo();
		 String msg = "";
			
		 if(updateBizName > 0) msg = "비즈니스명이 변경되었습니다.";
	  
		 model
			.addAttribute("loc", loc)
			.addAttribute("msg", msg);
		 
		 return "client/common/msg"; 
	 }
	 
	
	@RequestMapping("/business/insertBusinessMember.do")
	public String insertBusinessMember(Model model, @RequestParam String userId, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		int mNo = m.getmNo();
		
		int bizNo = bService.inviteBizNo(mNo);
		
		int inviteMNO = bService.inviteMNo(userId);
		System.out.println("inviteMno: " + inviteMNO);
		BusinessMember bm = new BusinessMember();
		bm.setBizNo(bizNo);
		bm.setmNo(inviteMNO);
		System.out.println(bm);
		int result = bService.insertBusinessMember(bm);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(result > 0) {
			msg = "비즈니스 회원 초대 성공";
			
			int maxMemberM = bService.maxMemberM(bizNo);
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/updateBusinessMemberY.do")
	public String updateBusinessMemberY(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		int mNo = m.getmNo();
		
		int result = bService.updateBusinessMemberY(mNo);
		
		String loc = "/member/noteMain.do";
		String msg = "";
		
		if(result > 0) msg = "승인 여부를 기다려주세요!";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
		
	}

	@RequestMapping("/business/updateBusinessMemberN.do")
	public String updateBusinessMemberN(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		int mNo = m.getmNo();
		
		int result = bService.updateBusinessMemberN(mNo);
		
		String loc = "/member/noteMain.do";
		String msg = "";
		
		if(result > 0) msg = "비즈니스 가입 요청을 거절하였습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
		
	}
	
	@RequestMapping("/business/approvalStatusY.do")
	public String approvalY(Model model, @RequestParam int mNo) {
		
		int approvalStatusY = bService.approvalY(mNo);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(approvalStatusY > 0) msg = "사용자 승인 성공";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/deleteBM.do")
	public String deleteBM(Model model, @RequestParam int mNo) {
		
		System.out.println("bm mNo : "+mNo);

		int bizNo = bService.inviteBizNo(mNo);
		
		System.out.println("bizNo : "+bizNo);
		
		int deleteBM = bService.deleteBM(mNo);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		
		if(deleteBM > 0) {
			msg = "사용자 초대를 취소하였습니다.";
			
			
			System.out.println("result : " + deleteBM);
			int maxMemberP = bService.maxMemberP(bizNo);
		}
		
		model.addAttribute("loc", loc).addAttribute("msg", msg)
		.addAttribute("deleteBM", deleteBM);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/bmAdminY.do")
	public String bmAdminY(Model model, @RequestParam int mNo) {
		
		System.out.println("mNo : "+mNo);
		
		int bmAdminY = bService.bmAdminY(mNo);
		
		System.out.println("result : "+bmAdminY);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(bmAdminY > 0) msg = "관리자 권한을 부여하였습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/bmAdminN.do")
	public String bmAdminN(Model model, @RequestParam int mNo) {
		
		int bmAdminN = bService.bmAdminN(mNo);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(bmAdminN > 0) msg = "관리자 권한을 취소하였습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/activeY.do")
	public String activeY(Model model, @RequestParam int mNo) {
		
		int activeY = bService.activeY(mNo);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(activeY > 0) msg = "사용자가 활성화되었습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}
	
	@RequestMapping("/business/activeN.do")
	public String activeN(Model model, @RequestParam int mNo) {
		
		int activeN = bService.activeN(mNo);
		
		String loc = "/member/memberManage.do";
		String msg = "";
		
		if(activeN > 0) msg = "사용자가 비활성화되었습니다.";
		
		model.addAttribute("loc", loc).addAttribute("msg", msg);
		
		return "client/common/msg";
	}

}






