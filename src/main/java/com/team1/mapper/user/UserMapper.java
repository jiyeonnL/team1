package com.team1.mapper.user;

import com.team1.domain.user.UserVO;

public interface UserMapper {

	public int insert(UserVO user); // 회원가입 (아이디 생성)
	
	public int update(UserVO user); // 회원정보 수정
	
	public int delete(String id); // 회원 탈퇴

	public UserVO select(String email); // 아이디(email)로 회원 검색
	
//	public UserVO login(String email, String pw); // 로그인
	
	public UserVO selectByNickName(String nickname); // nickname으로 검색
	
	
}
