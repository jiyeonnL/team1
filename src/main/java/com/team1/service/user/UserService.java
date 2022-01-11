package com.team1.service.user;

import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.domain.board.HelpVO;
import com.team1.domain.board.LifeVO;
import com.team1.domain.board.NewsVO;
import com.team1.domain.board.QuestionVO;
import com.team1.domain.board.UserPostVO;
import com.team1.domain.user.UserVO;
import com.team1.mapper.board.HelpMapper;
import com.team1.mapper.board.QuestionMapper;
import com.team1.mapper.user.UserMapper;
import com.team1.service.board.HelpService;
import com.team1.service.board.LifeService;
import com.team1.service.board.NewsService;
import com.team1.service.board.QuestionService;

import lombok.Setter;

@Service
public class UserService {

	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private HelpService helpService;
	
	@Setter(onMethod_ = @Autowired)
	private QuestionService questionService;
	
	@Setter(onMethod_ = @Autowired)
	private LifeService lifeService;
	
	@Setter(onMethod_ = @Autowired)
	private NewsService newsService;
	
	public UserVO readByNickName (String nickName) {
		return mapper.selectByNickName(nickName);
	}

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
	
	public List<HelpVO> UserBoardHelpList(Integer id) {
		return mapper.selectUserBoardHelp(id);
	}
	
	public List<UserPostVO> getUserPostList(String nickName) {
		
		UserVO userVO = readByNickName(nickName);
		
		List<UserPostVO> postVOs = new ArrayList<UserPostVO>();
		

		try {
			List<HelpVO> helpVOs = helpService.getListByUserId(userVO.getId());
			List<LifeVO> lifeVOs = lifeService.getListByUserId(userVO.getId());
			List<NewsVO> newsVOs = newsService.getListByUserId(userVO.getId());
			List<QuestionVO> questionVOs = questionService.getListByUserId(userVO.getId());

			for(HelpVO helpVO : helpVOs) {
				UserPostVO userPostVO = helpVO.toUserPostVO();
				postVOs.add(userPostVO);
			}
			
			for(LifeVO lifeVO : lifeVOs) {
				UserPostVO userPostVO = lifeVO.toUserPostVO();
				postVOs.add(userPostVO);
			}
			
			for(NewsVO newsVO : newsVOs) {
				UserPostVO userPostVO = newsVO.toUserPostVO();
				postVOs.add(userPostVO);
			}
			
			for(QuestionVO questionVO : questionVOs) {
				UserPostVO userPostVO = questionVO.toUserPostVO();
				postVOs.add(userPostVO);
			}
			
			System.out.println(postVOs);
			
			Comparator<UserPostVO> comparator = (c1, c2) -> { 
				long timeC1 = Date.from(c1.getOriginalInserted().atZone(ZoneId.systemDefault()).toInstant()).getTime();
				long timeC2 = Date.from(c2.getOriginalInserted().atZone(ZoneId.systemDefault()).toInstant()).getTime();

				return Long.valueOf(timeC2).compareTo(timeC1); 
			};
			
			
			Collections.sort(postVOs, comparator);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}   
		
		return postVOs;
	}
}
	
