package com.team1.controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@GetMapping(value = "/list")
	public void help(@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "query", required = false) String query,
			@RequestParam(value = "tag", required = false) String tag, HttpSession session, Model model) {

		Cover.setCover("question", model);
		
		model.addAttribute("tag", "question");
		model.addAttribute("location", location);
		
	}
	

	
}
