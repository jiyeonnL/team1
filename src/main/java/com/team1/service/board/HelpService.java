package com.team1.service.board;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.HelpVO;
import com.team1.mapper.board.HelpMapper;

import lombok.Setter;

@Service
public class HelpService {
	@Setter(onMethod_ = @Autowired)
	private HelpMapper mapper;
	
//	@Setter(onMethod_ = @Autowired)
//	private PReplyMapper preplyMapper;
	
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
	
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	public String getNick(Integer id) {
		return mapper.nickname(id);
	}
	
}
