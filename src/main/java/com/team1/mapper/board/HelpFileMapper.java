package com.team1.mapper.board;

import org.apache.ibatis.annotations.Param;

public interface HelpFileMapper {
	int insert(@Param("boardId") Integer boardId, @Param("fileName") String fileName);

	String[] selectNamesByBoardId(Integer boardId);

	void delete(@Param("boardId") Integer boardId, @Param("fileName") String fileName);

	void deleteByBoardId(Integer boardId);
}
