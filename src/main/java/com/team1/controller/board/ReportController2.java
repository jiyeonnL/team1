package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team1.domain.board.ReportVO;
import com.team1.domain.user.UserVO;
import com.team1.service.board.ReportService;

import lombok.Setter;

@RestController
@RequestMapping("/reportajax")
public class ReportController2 {
	@Setter(onMethod_ = @Autowired)
	private ReportService service;
	
	@PostMapping("/register")
	public ResponseEntity<String> register(ReportVO report, HttpSession session){
		UserVO uvo = (UserVO) session.getAttribute("loginUser");
		if(uvo == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}else {
			service.register(report);
			return ResponseEntity.status(HttpStatus.OK).build();
		}
	}
	
	@GetMapping("/rcount/{id}")
	public Integer rcount(HttpSession session, @PathVariable Integer id){
		Integer rcnt = service.countReplyId(id);
		return rcnt;
	}
	
	@GetMapping("/rrcount/{id}")
	public Integer rrcount(HttpSession session, @PathVariable Integer id){
		Integer rrcnt = service.countReReplyId(id);
		return rrcnt;
	}
}
