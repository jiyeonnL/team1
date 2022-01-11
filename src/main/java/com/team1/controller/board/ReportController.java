package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team1.domain.board.ReportVO;
import com.team1.service.board.ReportService;

import lombok.Setter;

@RestController
@RequestMapping("/report")
public class ReportController {
	@Setter(onMethod_ = @Autowired)
	private ReportService service;
	
	@GetMapping("/list")
	public void list(Model model){
		List<ReportVO> list = service.getList();
		model.addAttribute("list", list);
		
	}
	
	@PostMapping("/register")
	public ResponseEntity<String> register(ReportVO report, HttpSession session){
		service.register(report);
		return ResponseEntity.status(HttpStatus.OK).build();
	}
	
	@DeleteMapping("/delete")
	public ResponseEntity<String> remove(HttpSession session, Integer id){
		service.remove(id);
		return ResponseEntity.status(HttpStatus.OK).build();
	}
	

}
