package com.team1.controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.coverData.Cover;

@Controller
@RequestMapping("/all")
public class AllController {

	@GetMapping(value = "list")
	public void main(Model model) {

		Cover.setCover("all", model);

		model.addAttribute("tag", "all");
		model.addAttribute("region", "");
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}

	@GetMapping(value = "/list", params = { "region"})
	public void main(@RequestParam(value = "region") String region,Model model) {

		Cover.setCover("all", model);

		model.addAttribute("tag", "all");
		model.addAttribute("region", region);
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}

	// 쿼리를 함께 검색하는 컨트롤러
	@GetMapping(value = "/list", params = { "region", "query" })
	public void main(@RequestParam(value = "region") String region, String query, Model model) {

		Cover.setCover("all", model);

		model.addAttribute("tag", "all");
		model.addAttribute("region", region);
		// post들 가져온다.
		// region이 없으면 모든 region에 대하여 검색

		// 선택된 태그가 없으면 모든 tag에 대하여 검색
	}
	

}
