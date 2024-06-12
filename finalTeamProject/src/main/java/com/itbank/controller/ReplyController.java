package com.itbank.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.itbank.model.LckReplyDTO;
import com.itbank.service.LckReplyService;

@Controller 
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired private LckReplyService rs;

	@PostMapping("/write")
	public String write(LckReplyDTO dto) {
		int row = rs.writeReply(dto);
		System.out.println(row != 0 ? "댓글 작성 성공":"댓글 작성 실패");
		return "redirect:/community/view/" + dto.getBoardIdx();
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx")int idx, HttpServletRequest request) {
		int row = rs.deleteReply(idx);
		System.out.println(row != 0 ? "댓글 삭제 성공":"댓글 삭제 실패");
		String referer = request.getHeader("Referer"); // 게시글  페이지의 URL을 얻어옴
		return "redirect:" + referer;
	}
	
	
	
}
