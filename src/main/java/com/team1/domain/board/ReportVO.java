package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class ReportVO {
	private Integer id;
	private String boardName;
	private String boardUrl;
	private String content;
	private String nickname;
	private String reason;
	private String reasonDetail;
	private LocalDateTime inserted;
	private Integer helpId;
	private Integer lifeId;
	private Integer newsId;
	private Integer questionId;
	private String title;
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	

}
