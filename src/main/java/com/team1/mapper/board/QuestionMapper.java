package com.team1.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.domain.board.QuestionVO;

public interface QuestionMapper {
	
	//모든 게시물 조회
	public List<QuestionVO> getList();
	
	
	public Integer getCountRows();

	
	public List<QuestionVO> getListPage(@Param("from") Integer from, @Param("items") Integer numberPerPage);


	public int insert(QuestionVO board);


	public QuestionVO read(Integer id);

}
