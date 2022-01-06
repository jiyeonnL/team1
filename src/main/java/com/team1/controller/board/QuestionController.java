package com.team1.controller.board;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

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
import com.team1.domain.board.HelpReplyVO;
import com.team1.domain.board.HelpVO;
import com.team1.domain.board.QuestionPageInfoVO;
import com.team1.domain.board.QuestionVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.QuestionService;

import lombok.Setter;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Setter(onMethod_ = @Autowired)
	private QuestionService service;

	@GetMapping(value = "/list")
	public void list(@RequestParam(value = "location", required = false) String location,
			@RequestParam(value = "query", required = false) String query,
			@RequestParam(value = "tag", required = false) String tag,
			@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {

		Cover.setCover("question", model);
		Integer numberPerPage = 10;

		List<QuestionVO> list = service.getListPage(page, numberPerPage, location, tag, query);
		QuestionPageInfoVO pageInfo = service.getPageInfo(page, numberPerPage, location, tag, query);

		model.addAttribute("tag", tag);
		model.addAttribute("location", location);
		model.addAttribute("boardType", "question");
		
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		

	}

	

	@GetMapping(value = "/get/{id}")
	public String get(@PathVariable Integer id, Model model) {
		QuestionVO qvo = service.get(id);

		model.addAttribute("post", qvo);

		return "question/get";
	}

	@GetMapping("/register")
	public String register(HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");

		if (vo == null) {
			return "redirect:/user/login";
		}

		return null;
	}

	@PostMapping("/register")
	public String register(QuestionVO board, RedirectAttributes rttr) {

			// 3. business logic
			boolean ok = service.register(board);
			// 4. add attribute
			
			if(ok) {
				rttr.addFlashAttribute("result", board.getId() + "번 게시글이 등록되었습니다.");
			}

			rttr.addFlashAttribute("result", "게시물 등록 중 오류가 발생하였습니다.");
	

		// 5. forward / redirect
		// 책: 목록으로 redirect
		return "redirect:/question/list?location=";
	}
}
