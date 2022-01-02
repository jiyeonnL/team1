package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.HelpFileVO;
import com.team1.domain.board.HelpVO;

public interface HelpMapper {

	public List<HelpVO> getList();
	
	public int insert(HelpVO board); 
	
	public HelpVO read(Integer id); 
	
	public int delete(Integer id);
	
	public int update(HelpVO board);

	public List<HelpVO> getListSearchByContent(String search);
	
	public int upViews(Integer id);

	public List<HelpFileVO> getFiles();

	public List<HelpFileVO> getFilesById(Integer id);
	
}