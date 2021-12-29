package com.team1.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.domain.user.UserVO;
import com.team1.service.user.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/user")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@RequestMapping("/nicknamecheck")
	@ResponseBody
	public String nicknamecheck(String nickname) {
		boolean has = service.hasNickName(nickname);
		
		if (has) {
			return "unable";
		} else {
			return "able";
		}
	}
	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@PostMapping("/login")
	public String login (String nickname, String pw, HttpSession session) {
		UserVO vo = service.read(nickname);
		
		if(vo == null) {
			return null;
		}
		boolean correctPassword = pw.equals(vo.getPw());
		
		if(!correctPassword) {
			return null;
		}
		
		session.setAttribute("loginUser",vo);
		return "redirect:/board/main";
		
	}
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(UserVO user, RedirectAttributes rttr) {
		
		boolean ok = service.register(user);
		
		if(ok) {
			rttr.addFlashAttribute("ok", "가입완료");
			return "redirect:/board/main";
		}else {
			return "redirect:/user/signup";
		}
	}
	
}
