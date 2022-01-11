package com.team1.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.HelpReReplyVO;
import com.team1.mapper.board.HelpReReplyMapper;

import lombok.Setter;

@Service
public class HelpReReplyService {
	
	@Setter(onMethod_=@Autowired)
	private HelpReReplyMapper mapper;
	
	public List<HelpReReplyVO> list(Integer replyId) {
		return mapper.list(replyId);
	}
	
	public boolean register(HelpReReplyVO reReply) {
		return mapper.insert(reReply) == 1 ;
	}
	
	public boolean modify(HelpReReplyVO reReply) {
		return mapper.update(reReply) == 1;
	}
	
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	public HelpReReplyVO readById(Integer id) {
		return mapper.selectById(id);
	}

	public HelpReReplyVO readByNick(String nickname) {
		return mapper.readByNick(nickname);
	}
	
	public Integer countReReplyList(Integer replyId) {
		return mapper.listReReplyCount(replyId);
	}
	
	public Integer countInBoard(Integer boardId) {
		return mapper.countInBoard(boardId);
	}

}
