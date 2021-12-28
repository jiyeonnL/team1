package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.PleaseVO;

public interface PleaseMapper {
	// 모든 게시물 가져오기
	List<PleaseVO> getList();
}