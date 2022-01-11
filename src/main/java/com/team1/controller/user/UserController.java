package com.team1.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.domain.board.HelpVO;
import com.team1.domain.board.UserPostVO;
import com.team1.domain.user.UserVO;
import com.team1.service.user.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/user")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	private UserService service;
	
	@RequestMapping("/nicknamecheckForSignup")
	@ResponseBody
	public String nicknamecheckForSignup(String nickname) {
		boolean has = service.hasNickName(nickname);
		
		
		if (has) {
			
				return "unable";
				
			
		} else {
			return "able";
		}
	}
	
	
	@RequestMapping("/nicknamecheck")
	@ResponseBody
	public String nicknamecheck(String nickname, HttpSession session) {
		boolean has = service.hasNickName(nickname);
		UserVO userWithd = service.readWithdrwal(nickname);
		
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		if (has) { // 검색했는데 있는 아이디임
			if(userWithd.getWithdrawal().equals("X")) { // 근데 탈퇴한 계정이 아님
				
				if(nickname.equals(vo.getNickname())){
					return "same"; // session에서 받아온(로그인된) 정보와 같은 닉네임일 경우
				}else {
					return "unable"; // 로그인된 아이디를 제외한 닉네임 중복 검출
				}
				
			}else {
				return "able";
			}
		} else {
			return "able"; // 사용 가능 닉네임
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
	
//	@GetMapping("/login")
//	public void login() {
//		
//	}
	
	@RequestMapping("/login")
	public String login (String email, String pw, HttpSession session, RedirectAttributes rttr, Model model) {
		UserVO vo = service.read(email);
		
		if(vo == null || vo.getWithdrawal() == "O") {
			
			if (email != null) {
				model.addAttribute("result", "존재하지 않은 아이디입니다.");
			}
			return null;
		}
		
		boolean correctPassword = pw.equals(vo.getPw());
		
		if(!correctPassword) {
			
			model.addAttribute("result", "비밀번호를 다시 확인해주세요.");
			
			return null;
		}
		
		session.setAttribute("loginUser",vo);
		rttr.addFlashAttribute("result", vo.getNickname() + "님 환영합니다.");
		
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
		String message = "가입완료 되었습니다!!";
		if(ok) {
			rttr.addFlashAttribute("ok", message);
			return "redirect:/all/list";
		}else {
			return "redirect:/user/signup";
		}
	}
	
	
	@GetMapping("/profile")
	public String profile(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@GetMapping("/profile/{nickname}")
	public String profile(@PathVariable String nickname, Model model) {
		
		UserVO vo = service.readByNickName(nickname);
		
		//List<HelpVO> list = service.UserBoardHelpList(vo.getId());
		List<UserPostVO> list = service.getUserPostList(nickname);
		
		model.addAttribute("user", vo);
		model.addAttribute("list", list);
		
		return "user/profile";
	}
	
	
	@GetMapping("/infoModify")
	public String modify(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@PostMapping("/infoModify")
	public String modify(UserVO user, HttpSession session, RedirectAttributes rttr) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");


		if (vo == null) {
			return "redirect:/user/login";
		}
		
		
		// 로그인된 상태
		boolean ok = service.modify(user);
		
		if (!ok) {
			rttr.addFlashAttribute("modify", "회원 정보가 변경되었습니다. 로그아웃 후에 이용해주세요!");
			session.setAttribute("loginUser", service.read(user.getEmail()));
		} else {
			
		}

		return "redirect:/all/list";
	}
	@GetMapping("/remove")
	public String remove(HttpSession session) {

		UserVO vo = (UserVO) session.getAttribute("loginUser");

	
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		return null;
	}
	
	@PostMapping("/remove")
	public String remove(String email, String pw, HttpSession session, RedirectAttributes rttr) {
	
	
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		
		if (vo == null) {
			return "redirect:/user/login";
		}
		
		String sessionPw = vo.getPw();
				
		
		if(!(sessionPw.equals(pw))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/user/remove";
			}
				service.remove(vo.getEmail());
				session.invalidate();
				return "redirect:/user/login";
			}
}
