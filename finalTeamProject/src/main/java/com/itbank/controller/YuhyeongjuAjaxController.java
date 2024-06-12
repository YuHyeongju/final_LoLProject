package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.LckBoardBlackListDTO;
import com.itbank.model.LckBoardLikeDTO;
import com.itbank.model.LckReplyBlackListDTO;
import com.itbank.model.LckReplyDTO;
import com.itbank.model.LckReplyLikeDTO;
import com.itbank.service.LckBlackListService;
import com.itbank.service.LckLikeService;
import com.itbank.service.LckReplyService;

@RestController
@RequestMapping("/ajax")
public class YuhyeongjuAjaxController {
	// @Autowired private CommunityService cs;
	@Autowired
	private LckReplyService rs;
	@Autowired
	private LckLikeService ls;
	@Autowired
	private LckBlackListService bs;
	
	// 댓글 수정
	@PostMapping("/reply/modify")
	public int modify(@RequestBody LckReplyDTO dto) {
		int row = rs.modifyReply(dto);
		return row;
	}

	// 게시글 좋아요
	@PostMapping("/BoardLikey")
	public int BoardLike(@RequestBody LckBoardLikeDTO dto) {

		LckBoardLikeDTO result = ls.getBoardLikeOne(dto); // 로그인한 사람의 게시글 좋아요  정보

		if (result == null) {

			int row = ls.addBoardLike(dto);
			System.out.println(row != 0 ? "게시글 좋아요 추가 성공" : "게시글 좋아요 추가 실패");
			return row;

		} else {

			int row = ls.updateBoardLike(dto);
			System.out.println(row != 0 ? "게시글 좋아요 변경 성공" : "게시글 좋아요 변경 실패");
			return row;

		}
	}

	// 게시글 싫어요
	@PostMapping("/BoardHate")
	public int BoardHate(@RequestBody LckBoardLikeDTO dto) {

		LckBoardLikeDTO result = ls.getBoardLikeOne(dto); // 로그인한 사람의 게시글  싫어요 정보

		if (result == null) {
			int row = ls.addBoardHate(dto);

			System.out.println(row != 0 ? "게시글 싫어요 추가 성공" : "게시글 싫어요 추가 실패");

			return row;

		} else {
			int row = ls.updateBoardHate(dto);

			System.out.println(row != 0 ? "게시글  싫어요 변경 성공" : "게시글 싫어요 변경 실패");

			return row;

		}

	}

	// 댓글 좋아요
	@PostMapping("/ReplyLikey")
	public int ReplyLike(@RequestBody LckReplyLikeDTO dto) {

		LckReplyLikeDTO result = ls.getReplyLike(dto); // 로그인한 사람의 댓글 좋아요 정보

		if (result == null) {

			int row = ls.addReplyLike(dto);
			System.out.println(row != 0 ? "댓글 좋아요 추가 성공" : "댓글 좋아요 추가 실패");
			return row;

		} else {
			int row = ls.updateReplyLike(dto);

			System.out.println(row != 0 ? "댓글 좋아요 변경 성공" : "댓글 좋아요 변경 실패");

			return row;

		}
	}

	// 댓글 싫어요
	@PostMapping("/ReplyHate")
	public int ReplyHate(@RequestBody LckReplyLikeDTO dto) {

		LckReplyLikeDTO result = ls.getReplyLike(dto); // 로그인한 사람의 게시글 좋아요 싫어요 리스트 정보

		if (result == null) {

			int row = ls.addReplyHate(dto);

			System.out.println(row != 0 ? "댓글 싫어요 추가 성공" : "댓글 싫어요 추가 실패");

			return row;

		} else {
			int row = ls.updateReplyHate(dto);

			System.out.println(row != 0 ? "댓글 싫어요 변경 성공" : "댓글 싫어요 변경 실패");

			return row;
		}

	}
	// 게시글 신고
	@PostMapping("/BoardReport")
	public int BoardReport(@RequestBody LckBoardBlackListDTO dto) {
		
		LckBoardBlackListDTO result = bs.getBoardReportOne(dto);
		
		if(result == null) {
			int row = bs.insertBoardReport(dto);
			System.out.println(row != 0 ? "게시글 신고 성공" : "게시글 신고 실패");
			return row;
		}else {
			return 0;
		}
		
	}
	// 댓글 신고
	@PostMapping("/ReplyReport")
	public int BoardReport(@RequestBody LckReplyBlackListDTO dto) {
		
		LckReplyBlackListDTO result = bs.getReplyReportOne(dto);
		
		if(result == null) {
			int row = bs.insertReplyReport(dto);
			System.out.println(row != 0 ? "댓글 신고 성공" : "댓글 신고 실패");
			return row;
		}else {
			return 0;
		}
		
		
	}

}
