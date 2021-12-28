package com.team1.mapper.board;

import java.util.List;
import com.team1.domain.board.PReplyVO;

public interface PReplyMapper {
	
	public List<PReplyVO> list(Integer boardId);
	
	public int insert(PReplyVO reply);
	
	public int update(PReplyVO reply);
	
	public int delete(Integer id);

	public PReplyVO selectById(Integer iD);

}
