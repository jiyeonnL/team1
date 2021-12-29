package com.team1.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class HelpVO {
	private Integer id;
	private Integer memberId;
	private String location;
	private Integer up;
	private Integer views;
	private String tag;
	private String title;
	private String content;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	private String nickname;
}
