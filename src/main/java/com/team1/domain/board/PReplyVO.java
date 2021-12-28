package com.team1.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PReplyVO {
	private Integer ID;
	private Integer BoardId;
	private String Nickname;
	private String Reply;
	private LocalDateTime Inserted;
	private LocalDateTime Updated;
	
	private Boolean own;
}
