package com.kh.wefer.member.model.service;

import java.util.List;

import com.kh.wefer.member.model.domain.Member;

public interface MemberService {
	List<Member> memberList(); // 전체 읽기
	
	List<Member> memberAllList(); // 전체 읽기

	int insertMember(Member m);

	Member login(Member m);

	int delete(String id);

	List<Member> deptmemberlist(String dept_no);

	List<Member> searchmemberlist(String keyword);
	//mypage부분
	Member profileList(String id);

	int updateProfile(Member m);

	
}
