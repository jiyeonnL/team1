package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.QuestionVO;

public interface QuestionMapper {
	
	// 모든 게시물 조회
	public List<QuestionVO> getList();
	
	// 게시물 수 카운트
	public Integer getCountRows();

	// 페이지 불러오기
	public List<QuestionVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);
	
	// 게시물 글 관련 생성
	public int insert(QuestionVO board);

	
	public QuestionVO read(Integer id);

	
}
