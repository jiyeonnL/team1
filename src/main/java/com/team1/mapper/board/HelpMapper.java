package com.team1.mapper.board;

import java.util.List;
import com.team1.domain.board.HelpVO;

public interface HelpMapper {

	public List<HelpVO> getList();
	
	public int insert(HelpVO board); 
	
	public HelpVO read(Integer id); 
	
	public int delete(Integer id);
	
	public int update(HelpVO board);
	
	public String nickname(Integer id);

	public List<HelpVO> getListSearchByContent(String search);

	
}