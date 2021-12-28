package com.team1.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberVO {
	
	private Integer UUID;
	private String Nickname;
	private String Password;
	private String Email;
	private String Address;
	private String ProfileUrl;
	private LocalDateTime JoinDate;
	private String SelfIntro;
	
	

}
