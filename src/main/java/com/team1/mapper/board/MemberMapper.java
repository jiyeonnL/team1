package com.team1.mapper.board;

import java.util.List;

import com.team1.domain.board.MemberVO;

public interface MemberMapper {
	
    public int insert(MemberVO member);
	
	public MemberVO select(String id);
	
	public int update(MemberVO member);
	
	public int delete(String id);
	
	public List<MemberVO> list();

}
