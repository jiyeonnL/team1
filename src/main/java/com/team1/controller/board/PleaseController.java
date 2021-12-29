package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.domain.board.PleaseVO;
import com.team1.service.board.PleaseService;

import lombok.Setter;

@Controller
@RequestMapping("/please")
public class PleaseController {
	
	@Setter(onMethod_ = @Autowired)
	private PleaseService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		List<PleaseVO> list = service.getList();

		model.addAttribute("list", list);
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("id") Integer id, Model model) {
		PleaseVO board = service.get(id);
		String nickname = service.getNick(id);
		System.out.println(board);
		System.out.println(nickname);
		model.addAttribute("board", board);
		model.addAttribute("nickname", nickname);
	}
	
	@PostMapping("/modify")
	public String modify(PleaseVO board, RedirectAttributes rttr) {
		System.out.println("/modify로 잘 옴.");
		System.out.println(board);
		if (service.modify(board)) {
			System.out.println("수정됨");
			rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
		}
		return "redirect:/please/list";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(PleaseVO board, RedirectAttributes rttr, HttpServletRequest req) {

		service.register(board);

		rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");

		return "redirect:/please/list";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("ID") Integer id, RedirectAttributes rttr) {
	
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}
		
		return "redirect:/please/list";
	}
	
	
}
