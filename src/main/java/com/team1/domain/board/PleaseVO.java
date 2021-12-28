package com.team1.domain.board;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PleaseVO {
	private Integer ID;
	private Integer UUID;
	private String Location;
	private Integer Up;
	private Integer Views;
	private String Tag;
	private String Title;
	private String Content;
	private LocalDateTime Inserted;
	private LocalDateTime Updated;
}
