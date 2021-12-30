package com.team1.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class HelpReplyVO {
	private Integer id;
	private Integer boardId;
	private String nickname;
	private String reply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	private Boolean own;
}
