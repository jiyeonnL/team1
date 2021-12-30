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
	
	@RequestMapping("/emailcheck")
	@ResponseBody
	public String emailcheck(String email) {
		boolean has = service.hasEmail(email);
		
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
	public String login (String email, String pw, HttpSession session) {
		UserVO vo = service.read(email);
		
		if(vo == null) {
			return null;
		}
		boolean correctPassword = pw.equals(vo.getPw());
		
		if(!correctPassword) {
			return null;
		}
		
		session.setAttribute("loginUser",vo);
		return "redirect:/all/list";
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/all/list";
	}

	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping("/signup")
	public String signup(UserVO user, RedirectAttributes rttr) {
		
		boolean ok = service.register(user);
		
		if(ok) {
			rttr.addFlashAttribute("ok", "가입완료");
			return "redirect:/all/list";
		}else {
			return "redirect:/user/signup";
		}
	}
	
	
	@GetMapping("/profile")
	public String info(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@PostMapping("/profile")
	public String info(UserVO user, HttpSession session, RedirectAttributes rttr) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");


		if (vo == null) {
			return "redirect:/user/login";
		}
		
		
		// 로그인된 상태
		boolean ok = service.modify(user);
		
		if (ok) {
			rttr.addFlashAttribute("result", "회원 정보가 변경되었습니다.");
			session.setAttribute("loginUser", service.read(user.getEmail()));
		} else {
			rttr.addFlashAttribute("result", "회원 정보가 변경되지 않았습니다.");
		}

		return "redirect:/all/list";
	}
	
}
