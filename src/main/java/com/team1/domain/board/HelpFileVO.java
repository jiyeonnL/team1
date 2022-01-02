package com.team1.domain.board;

import lombok.Data;

@Data
public class HelpFileVO {
	private Integer id;
	private Integer boardId;
	private String fileName;
	
	private Integer countBoardId;
}
