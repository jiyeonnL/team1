package com.team1.controller.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.team1.domain.board.MemberVO;
import com.team1.domain.board.PReplyVO;
import com.team1.service.board.PReplyService;

import lombok.Setter;



@RestController
@RequestMapping("/preply")
public class PReplyController {
	@Setter(onMethod_ = @Autowired)
	private PReplyService service;
	
	@GetMapping("/pboard/{BoardId}")
	public List<PReplyVO> list(@PathVariable Integer boardId, HttpSession session) {
		MemberVO loggedIn = (MemberVO) session.getAttribute("loggedInMember");
		List<PReplyVO> list = service.list(boardId);
		if(loggedIn != null) {
			for (PReplyVO reply : list) {
				String writerId = reply.getNickname();
				reply.setOwn(loggedIn.getUUID().equals(writerId)); // 로그인한 사람과 댓글 작성자가 같을 때 true
			}
		}
		return list;
	}
	
	@PostMapping("/write")
	public ResponseEntity<String> write(PReplyVO reply, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
		if (logged !=null && logged.getNickname().equals(reply.getNickname())) {
			service.insert(reply);
			return ResponseEntity.status(HttpStatus.OK).build();
		} else {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();			
		}
	}
	
	@PutMapping("/{ID}")
	public ResponseEntity<String>  modify(@PathVariable Integer ID, @RequestBody PReplyVO  reply, @SessionAttribute(value="loggedInMember", required = false) MemberVO logged) {
		// 댓글 조회
		PReplyVO old = service.readById(ID);
		// 로그인된 멤버의 아이디와 댓글 작성한 사람 아이디가 같을 때만 또는 관리자일 때
		if ((logged !=null && logged.getNickname().equals(old.getNickname()))) { // 관리자 권한 ||logged.getAdminQuali()==1
			// 업데이트
			old.setReply(reply.getReply());
			service.update(old);
			
			return ResponseEntity.ok("");
		} else {
			// 권한 없음
			return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
		}
	}
	
}









