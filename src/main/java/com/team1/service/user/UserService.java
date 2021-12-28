package com.team1.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.user.UserVO;
import com.team1.mapper.user.UserMapper;

import lombok.Setter;

@Service
public class UserService {

	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	public UserVO read(String id) {
		return mapper.select(id);
	}

	public boolean register(UserVO user) {
		return mapper.insert(user) == 1;
	}

	public boolean modify(UserVO user) {
		return mapper.update(user) == 1;
	}
	
	public boolean remove(String id) {
		return mapper.delete(id) == 1;
	}

}
