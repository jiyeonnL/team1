package com.team1.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public void help(@RequestParam(value = "location") String location, Model model) {

		Cover.setCover("help", model);
		
		model.addAttribute("tag", "help");
		model.addAttribute("location", location);
		
		List<HelpVO> list = service.getList();
		List<HelpFileVO> fileNames = service.getFiles();
		model.addAttribute("list", list);
		model.addAttribute("fileNames", fileNames);
		System.out.println("File Names : "+fileNames);
	}
	
	@GetMapping("/list/thumbs/{id}")
	public List<HelpFileVO> thumbs(@PathVariable Integer id) {
		System.out.println("썸네일 작업");
		List<HelpFileVO> thumbs = service.getFilesById(id);
		return thumbs;
	}
	
	//게시물 상세 페이지, help/list/id 와 같은 형식으로 게시물의 id를 링크에서 가져온다.
	@GetMapping(value = "/list/{id}")
	public String post(@PathVariable Integer id, Model model) {
		
		//한개의 post를 가져온다.
		HelpVO helpVO = service.get(id);
		String[] fileNames = service.getNamesByBoardId(id);
		List<HelpReplyVO> reply = replyservice.list(id);
		model.addAttribute("post", helpVO);
		model.addAttribute("reply", reply);
		model.addAttribute("fileNames", fileNames);
		service.upViews(id);
		
		//화면 매칭 어떻게?
		return "help/post";
	}

	@GetMapping("/modify")
	public void get(@RequestParam("id") Integer id, Model model) {
		HelpVO board = service.get(id);
		String[] fileNames = service.getNamesByBoardId(id);
		model.addAttribute("board", board);
		model.addAttribute("fileNames", fileNames);
	}
	
	@PostMapping("/modify")
	public String modify(HelpVO board, RedirectAttributes rttr, String[] removeFile,  MultipartFile[] files) {
		try {
			if (service.modify(board, removeFile, files)) {
				rttr.addFlashAttribute("result", "No." + board.getId() + " Modify success");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "No." + board.getId() + " Modify error");
		}
		return "redirect:/help/list/"+board.getId();
	}
	
	@GetMapping("/register")
	public void register() {

	}
	
	@PostMapping("/register")
	public String register(HelpVO board, RedirectAttributes rttr, MultipartFile[] files, HttpServletRequest req) {
		try {
			// 3.
			service.register(board, files);
			// 4. add attribute
			rttr.addFlashAttribute("result", "No." + board.getId() + " board registered successfully");
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			rttr.addFlashAttribute("result", "No." + board.getId() + " board had problem");
		}

		return "redirect:/help/list/"+board.getId();
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
