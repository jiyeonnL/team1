package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.PleaseVO;
import com.team1.mapper.board.PleaseMapper;

import lombok.Setter;

@Service
public class PleaseService {
	@Setter(onMethod_ = @Autowired)
	private PleaseMapper mapper;
	
//	@Setter(onMethod_ = @Autowired)
//	private PReplyMapper preplyMapper;
	
	public List<PleaseVO> getList() {
		return mapper.getList();
	}
}
