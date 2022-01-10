package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class HelpReReplyVO {
	private Integer id;
	private Integer replyId;
	private String nickname;
	private String reReply;
	private LocalDateTime inserted;
	private LocalDateTime updated;
	
	// 관리자 권한
	private Integer adminQuali;

	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
}
