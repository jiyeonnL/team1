package com.team1.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.domain.board.PleaseVO;
import com.team1.service.board.PleaseService;

import lombok.Setter;

@Controller
@RequestMapping("/board")
public class PleaseController {
	
	@Setter(onMethod_ = @Autowired)
	private PleaseService service;
	
	@GetMapping("/pleaselist")
	public void list(Model model) {
		List<PleaseVO> pleaselist = service.getList();
		
		model.addAttribute("pleaselist", pleaselist);
	}
}
