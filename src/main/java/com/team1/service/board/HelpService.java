package com.team1.service.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team1.domain.board.HelpVO;
import com.team1.mapper.board.HelpMapper;
import com.team1.mapper.board.HelpReplyMapper;

import lombok.Setter;

@Service
public class HelpService {
	@Setter(onMethod_ = @Autowired)
	private HelpMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private HelpReplyMapper helpReplyMapper;
	
	public List<HelpVO> getList() {
		return mapper.getList();
	}
	
	public HelpVO get(Integer id) {
		return mapper.read(id);
	}
	
	public boolean register(HelpVO board) {
		return mapper.insert(board) == 1;
	}
	
	public boolean modify(HelpVO board) {
		return mapper.update(board) == 1;
	}
	
	@Transactional
	public boolean remove(Integer id) {
		
		//1. 게시물에 달린 댓글 지우기 
		helpReplyMapper.deleteByBoardId(id);
		
		//2. 게시물 지우기 
		return mapper.delete(id) == 1;
	}
	
	public boolean upViews(Integer id) {
		return mapper.upViews(id) == 1;
	}
	
	public boolean upUps(Integer id) {
		return mapper.upViews(id) == 1;
	}

	public List<HelpVO> getListSearchByContent(String search){
//			, Integer page, Integer numberPerPage, Integer numberPerPagination) { 검색 결과도 페이지 네이션 구현한다면 필요한 변수 (전에 아직 구현 못함)
//		return mapper.getListSearchByTitle(search, from, numberPerPage, numberPerPagination);
		return mapper.getListSearchByContent(search);
	}
	
}
