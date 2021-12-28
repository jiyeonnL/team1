package com.team1.domain.user;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class UserVO {

	private Integer id;
	private String location ;
	private String email;
	private String pw; 
	private String nickname;
	private LocalDateTime signupday; 
	private String profileurl; 
	private String introduce; 

	
}
