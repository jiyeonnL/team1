package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team1.domain.board.HelpReplyVO;
import com.team1.mapper.board.HelpReplyMapper;
import lombok.Setter;

@Service
public class HelpReplyService {
	
	@Setter(onMethod_=@Autowired)
	private HelpReplyMapper mapper;
	
	public List<HelpReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(HelpReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(HelpReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(HelpReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public HelpReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(HelpReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}

	public boolean delete(Integer ID) {
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	
}
