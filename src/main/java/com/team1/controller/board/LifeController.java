package com.team1.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;

@Controller
@RequestMapping("/life")
public class LifeController {
	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/list", params = { "region", "query" })
	public void life(@RequestParam(value = "region") String region, @RequestParam(value = "query") String query,
			Model model) {

		Cover.setCover("life", model);
		
		model.addAttribute("tag", "life");
		model.addAttribute("region", region);
		
	}
	
	//life 페이지 (검색 쿼리 있는 버전)
	@GetMapping(value = "/list", params = { "region"})
	public void life(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("life", model);

		model.addAttribute("tag", "life");
		model.addAttribute("region", region);
	}
	
	//life 페이지 (region 없는 버전)
	@GetMapping(value = "/list")
	public void life(Model model) {

		Cover.setCover("life", model);

		model.addAttribute("tag", "life");
		model.addAttribute("region", "");
	}

}
