package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team1.coverData.Cover;
import com.team1.domain.board.HelpFileVO;
import com.team1.domain.board.HelpReplyVO;
import com.team1.domain.board.HelpVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.HelpReplyService;
import com.team1.service.board.HelpService;

import lombok.Setter;

@Controller
@RequestMapping("/help")
public class HelpController {
	
	@Setter(onMethod_ = @Autowired)
	private HelpService service;
	
	@Setter(onMethod_ = @Autowired)
	private HelpReplyService replyservice;
	

	
	//help 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/list", params = { "location", "query" })
	public void help(@RequestParam(value = "location") String location, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("help", model);
		
		model.addAttribute("tag", "help");
		model.addAttribute("location", location);
		
		List<HelpVO> list = service.getListSearchByContent(query);
		model.addAttribute("list", list);
		
	}
	
	//help 페이지
	@GetMapping(value = "/list", params = { "location"})
	public void help(@RequestParam(value = "location") String location, Model model, HttpSession session) {

		Cover.setCover("help", model);
		
		model.addAttribute("tag", "help");
		model.addAttribute("location", location);
		
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		if(uvo != null) {
			List<HelpVO> list = service.getList(uvo.getId());
			List<HelpFileVO> fileNames = service.getFiles();
			model.addAttribute("list", list);
			model.addAttribute("fileNames", fileNames);
		} else {
			List<HelpVO> list = service.getList(0);
			List<HelpFileVO> fileNames = service.getFiles();
			model.addAttribute("list", list);
			model.addAttribute("fileNames", fileNames);
		}
		
	}
	
	//게시물 상세 페이지, help/list/id 와 같은 형식으로 게시물의 id를 링크에서 가져온다.
	@GetMapping(value = "/list/{id}")
	public String post(@PathVariable Integer id, Model model, HttpSession session) {
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		//한개의 post를 가져온다.

		if(uvo !=null) {
			HelpVO helpVO = service.get(id, uvo.getId());
			//String[] fileNames = service.getNamesByBoardId(id);
			List<HelpReplyVO> reply = replyservice.list(id);
			model.addAttribute("post", helpVO);
			model.addAttribute("reply", reply);
			//model.addAttribute("fileNames", fileNames);
		} else {
			HelpVO helpVO = service.get(id, 0);
			//String[] fileNames = service.getNamesByBoardId(id);
			List<HelpReplyVO> reply = replyservice.list(id);
			model.addAttribute("post", helpVO);
			model.addAttribute("reply", reply);
			//model.addAttribute("fileNames", fileNames);
		}

		service.upViews(id);
		
		return "help/post";
		
	}

	
	@GetMapping("/modify")
	public String get(@RequestParam("id") Integer id, Model model, HttpSession session) {
		
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		HelpVO hvo = (HelpVO) service.get(id, uvo.getId());
		
		if(uvo.getId() != hvo.getMemberId()){
			System.out.println("작성자가 아니면 수정할 수 없습니다.");
			return "redirect:/all/list";
		}
		
		HelpVO board = service.get(id, uvo.getId());
		//String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);
		
		return "help/modify";
	}
	
	@PostMapping("/modify")
	public String modify(HelpVO board, RedirectAttributes rttr) {

		System.out.println("/modify로 잘 옴.");

		if (service.modify(board)) {
			rttr.addFlashAttribute("result", board.getId() + "번 게시글이 수정되었습니다.");
		}
		return "redirect:/help/list?location=";
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(HelpVO board, MultipartFile[] multipartFile, String thumbNail, RedirectAttributes rttr, HttpServletRequest req) {

		service.register(board);
		System.out.println(thumbNail);
		rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");

		return "redirect:/help/list?location=";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("id") Integer id, RedirectAttributes rttr) {
	
		System.out.println("/remove로 잘 옴.");
		if (service.remove(id)) {
			rttr.addFlashAttribute("result", id + "번 게시글이 삭제되었습니다.");
		}
		
		return "redirect:/help/list?location=";
	}

	
}
