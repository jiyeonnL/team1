package com.team1.domain.board;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

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
	private String userprofile;
	
	//해당 post가 가지고 있는 파일 리스트
	List<HelpFileVO> fileList;

	private Integer replyCount;
	
	private Integer upposession;
	
	private Integer newMark;
	
	public String getInserted() {
		return this.inserted.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
	
	public String getUpdated() {
		return this.updated.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	}
}
