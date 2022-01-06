package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.LifeReplyVO;
import com.team1.mapper.board.LifeReplyMapper;

import lombok.Setter;

@Service
public class LifeReplyService {
	@Setter(onMethod_=@Autowired)
	private LifeReplyMapper mapper;
	
	public List<LifeReplyVO> list(Integer boardId) {
		return mapper.list(boardId);
	}
	
	public boolean insert(LifeReplyVO reply) {
		return mapper.insert(reply) == 1 ;
	}
	
	public boolean remove(Integer ID) {
		return mapper.delete(ID) == 1;
	}
	
	public boolean register(LifeReplyVO reply) {
		return mapper.insert(reply) == 1;
	}
	
	public boolean modify(LifeReplyVO reply) {
		return mapper.update(reply) == 1;
	}

	public LifeReplyVO readById(Integer ID) {
		return mapper.selectById(ID);
	}

	public boolean update(LifeReplyVO newReply) {
		return mapper.update(newReply) == 1;		
	}

	public boolean delete(Integer ID) {
		return mapper.delete(ID) == 1;
	}

	public Integer countReplyList(Integer ID) {
		return mapper.listReplyCount(ID);
	}

	public LifeReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
}
