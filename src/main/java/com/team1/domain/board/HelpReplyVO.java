package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
	private String userprofile;
	private Integer uid;

	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
