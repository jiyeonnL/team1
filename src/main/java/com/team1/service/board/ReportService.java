package com.team1.service.board;

import org.springframework.stereotype.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.team1.mapper.board.ReportMapper;

import lombok.Setter;

import com.team1.domain.board.ReportVO;

@Service
public class ReportService {
	@Setter(onMethod_= @Autowired)
	private ReportMapper mapper;
	
	public List<ReportVO> getList(){
		return mapper.getList();
	}
	
	public boolean register(ReportVO report) {
		return mapper.insert(report) == 1;
	}
	
	public boolean remove(Integer id) {
		return mapper.delete(id) == 1;
	}
	
	public Integer countReplyId(Integer id) {
		return mapper.countReplyId(id);
	}
	
	public Integer countReReplyId(Integer id) {
		return mapper.countReReplyId(id);
	}
}
