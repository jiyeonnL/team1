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
	

	public UserVO read(String email) {
		return mapper.select(email);
	}

	public UserVO readWithdrwal(String nickname) {
		return mapper.readWithdrwal(nickname);
	}

	public boolean register(UserVO user) {
		return mapper.insert(user) == 1;
	}

	public boolean modify(UserVO user) {
		return mapper.update(user) == 1;
	}
	
	public boolean remove(String email) {
		return mapper.updateRemove(email) == 1;
	}
	 
	public boolean hasNickName(String nickname) {
		UserVO user = mapper.selectByNickName(nickname);
 
		return user != null;
	}
	
	public boolean hasEmail(String email) {
		UserVO user = mapper.selectByEmail(email);
 
		return user != null;
	}

}
	
