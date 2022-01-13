package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.ReportVO;

public interface ReportMapper {
	
	public List<ReportVO> getList();
	
	public int insert(ReportVO report);
	
	public int delete(Integer id);
	
	public int deleteByHelpId(Integer helpId);
	
	public int deleteByLifeId(Integer lifeId);

	public int deleteByNewsId(Integer newsId);

	public int deleteByQuestionId(Integer questionId);

	public Integer countReplyId(Integer id);

	public Integer countReReplyId(Integer id);


}
