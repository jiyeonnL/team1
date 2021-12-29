package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team1.domain.board.PReplyVO;
import com.team1.mapper.board.PReplyMapper;
import lombok.Setter;

@Service
public class PReplyService {
	
	@Setter(onMethod_=@Autowired)
	private PReplyMapper mapper;
	
	public List<PReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(PReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(PReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(PReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public PReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(PReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}

	public boolean delete(Integer ID) {
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	
}
