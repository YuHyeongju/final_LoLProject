package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.PagingComponent;
import com.itbank.model.LckBoardBlackListDTO;
import com.itbank.model.LckBoardDTO;
import com.itbank.model.LckBoardLikeDTO;
import com.itbank.model.LckReplyBlackListDTO;
import com.itbank.model.LckReplyDTO;
import com.itbank.model.LckReplyLikeDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.LckBlackListService;
import com.itbank.service.LckCommunityService;
import com.itbank.service.LckLikeService;
import com.itbank.service.LckReplyService;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired private LckCommunityService cs;
	@Autowired private LckReplyService rs;
	@Autowired private LckLikeService ls;
	@Autowired private LckBlackListService bs;
	
	// 전체 리스트
	@GetMapping("/list")
	public ModelAndView communityList(PagingComponent dto) {
		ModelAndView mav = new ModelAndView("/community/list");
		int boardCount = cs.getBoardCount();										// 게시글의 총 갯수 호출
		PagingComponent paging = PagingComponent.newInstance(1, boardCount,"",""); // 첫번째 페이지의 정보 구성
		List<LckBoardDTO> list = cs.getBoardListByPagingSearchCategory(paging);    // 게시글 리스트 호출
		
		for (LckBoardDTO boardDTO : list) {
	        int replyCount= cs.getReplyCountByBoardIdx(boardDTO.getIdx()); // 해당 게시글의 idx로 댓글 수 조회
	        boardDTO.setReplyCount(replyCount); // boardDTO에 댓글 수 매핑
	    }
	
		mav.addObject("list", list);  // 게시글 리스트 페이징 정보를 뷰로 전달 
		mav.addObject("paging",paging);
		return mav;
	}
	
	// 페이지 번호로 해당 페이지 이동(전체에서는 검색 값,카테고리 값 빈 문자열) 
	@GetMapping("/list/{page}")
	public ModelAndView CommunityPagingList(@PathVariable ("page") int page,PagingComponent dto) {
		System.out.println(page);
		System.out.println(dto.getSearch());
		System.out.println(dto.getCategory());
		ModelAndView mav = new ModelAndView("/community/list");
		int boardCount = cs.getBoardCount(dto);
		PagingComponent paging = PagingComponent.newInstance(page,boardCount,dto.getSearch(),dto.getCategory()); 
		// 페이지 값, 게시글 수 , 검색어, 카테고리를 전달하여 페이징 객체 생성
		
		List<LckBoardDTO> list = cs.getBoardListByPagingSearchCategory(paging); // 페이징 객체를 전달하여 게시글 리스트 불러옴
		
		for (LckBoardDTO boardDTO : list) {
	        int replyCount= cs.getReplyCountByBoardIdx(boardDTO.getIdx()); // 해당 게시글의 idx로 댓글 수 조회
	        boardDTO.setReplyCount(replyCount); // boardDTO에 댓글 수 매핑
	    }
		
		System.out.println(list);
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	// 검색어를 입력했을 때 리스트 
	@GetMapping("/listSearch")
	public ModelAndView search(PagingComponent dto) {
		ModelAndView mav = new ModelAndView("/community/list");
		
		int boardCount = cs.getBoardCount(dto);
		
		PagingComponent paging = PagingComponent.newInstance(1,boardCount,dto.getSearch(),"");
		// 페이지 값에 1, 게시글 갯수 , 검색어 , 카테고리 빈 값을 넣어서 페이징 객체 생성
		
		List<LckBoardDTO> list = cs.getBoardListByPagingSearch(paging); // 페이징 객체를 전달하여 게시글 리스트 불러옴
		
		for (LckBoardDTO board : list) {
	        int replyCount= cs.getReplyCountByBoardIdx(board.getIdx()); // 해당 게시글의 idx로 댓글 수 조회
	        board.setReplyCount(replyCount); // boardDTO에 댓글 수 매핑
	    }
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	// 카테고리 버튼을 눌렀을 때 리스트
	@GetMapping("/list/category/{category}")
	public ModelAndView category(@PathVariable("category")String category,PagingComponent dto) {
		ModelAndView mav = new ModelAndView("/community/list");
		System.out.println(category);
		
		int boardCountByCategory = cs.getBoardCountByCategory(category);
		
		
		PagingComponent paging = PagingComponent.newInstance(1,boardCountByCategory,"",category);
		// 페이지 값 1, 카테고리별 게시글 갯수, 검색어 빈 값, 카테고리 값을 전달해서 페이징 객체 생성
		
		List<LckBoardDTO> list = cs.getBoardListByPagingSearch(paging);
		   
		for (LckBoardDTO board : list) {
	        int replyCount= cs.getReplyCountByBoardIdx(board.getIdx()); // 해당 게시글의 idx로 댓글 수 조회
	        board.setReplyCount(replyCount); // boardDTO에 댓글 수 매핑
	    }
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	// 게시글 상세 보기
	@GetMapping("/view/{idx}")
	public ModelAndView CommunitySelectOne(@PathVariable int idx , HttpSession session) {
		ModelAndView mav = new ModelAndView("/community/view");
		LckBoardDTO dto = cs.getBoard(idx);
		// 댓글 리스트
		List<LckReplyDTO> list = rs.getReplyList(idx);
		
		// 게시글에 대한 좋아요(싫어요) 총 갯수
		int BoardLikeCount = ls.getBoardLikeCount(idx);
		int BoardHateCount = ls.getBoardHateCount(idx);
		


		
		MemberDTO login= (MemberDTO)session.getAttribute("login"); // 현재 로그인한 유저의 정보를 가져옴
		
		if(login != null) {
	
		LckBoardLikeDTO likeDTO = new LckBoardLikeDTO(); // 객체 생성
		likeDTO.setUserid(login.getUserid()); // 객체에 userid 매핑
		likeDTO.setBoardIdx(idx);  // 객체에 idx 매핑
		LckBoardLikeDTO BoardLikeOne = ls.getBoardLikeOne(likeDTO); 
		// 로그인한 사용자의 게시글 좋아요 싫어요 정보 불러오기
		
		LckBoardBlackListDTO BoardReportDTO = new LckBoardBlackListDTO(); // 게시글 신고 객체 생성
		BoardReportDTO.setBoardIdx(idx);							      // 객체에 게시글 번호, 신고한 사람 , 신고당한 사람 매핑
		BoardReportDTO.setReportUser(login.getUserid());
		BoardReportDTO.setReportedUser(dto.getWriter());
		LckBoardBlackListDTO BoardReportOne = bs.getBoardReportOne(BoardReportDTO); // 게시글 하나의 신고 상태를 가져옴
		
		int BoardReportResult = 0;
		
		if(BoardReportOne != null ) {  // 게시글 신고가 있으면 1 없으면 0
			BoardReportResult = 1;
		}
		
		dto.setResultBoardReport(BoardReportResult);  // BoardDTO의 ResultBoardReport속성에 값을 전달
		
		
		// 댓글 갯수 불러오기
		int replyCount = rs.getReplyCountByBoardIdx(idx);
		// 보드 끝
		
		// 댓글들을 불러옴
		for(LckReplyDTO replyDTO : list) {
			int replyIdx = replyDTO.getIdx();
			String reportedUser = replyDTO.getWriter();
			// 댓글의 idx와 댓글의 작성자를 가져온다.
			
			LckReplyBlackListDTO ReplyReportDTO = new LckReplyBlackListDTO(); // 댓글 신고 객체 생성
			ReplyReportDTO.setReplyIdx(replyIdx); // 객체에 댓글 번호 , 신고한 사람, 신고 당하는 사람 매핑
			ReplyReportDTO.setReportUser(login.getUserid());
			ReplyReportDTO.setReportedUser(reportedUser);
			LckReplyBlackListDTO ReplyReportOne = bs.getReplyReportOne(ReplyReportDTO); // 댓글 신고 하나의 정보를 불러옴
			
			int ReplyReplyResult = 0;
			if (ReplyReportOne != null){ // 댓글 신고가 있으면 1 없으면 0
				ReplyReplyResult = 1;
			}
			
			replyDTO.setResultReplyReport(ReplyReplyResult); // replyDTO의 ResultReplyReport 속성에 값을 전달
			
		}
		
		List<LckReplyLikeDTO> ReplyLikeList =  ls.getReplyLikeList(login.getUserid());
		// 로그인한 사용자의 댓글 좋아요(싫어요)목록을 불러와서 리스트에 저장
		
		// 두개의 리스트들을 순회시켜서 조건에 맞을때 ReplyDTO에 값 매핑
		for(LckReplyDTO ReplyDTO : list) {
			for(LckReplyLikeDTO replyLike : ReplyLikeList) {
				if(ReplyDTO.getIdx() == replyLike.getReplyIdx()) {
					ReplyDTO.setLikey(replyLike.getLikey());
					ReplyDTO.setHate(replyLike.getHate());
					System.out.println(ReplyDTO.getLikey());
				}
			}
			
		}
	
		mav.addObject("BoardLikeCount", BoardLikeCount); // 게시글 좋아요 개수
		mav.addObject("BoardHateCount", BoardHateCount); // 게시글 싫어요 개수
		mav.addObject("BoardLikeOne", BoardLikeOne);	 // 게시글 좋아요 정보
		mav.addObject("ReplyLikeList", ReplyLikeList);   // 댓글 좋아요 정보
		mav.addObject("dto", dto);		// 게시글에 대한 정보
		mav.addObject("list", list);    // 댓글들에 대한 정보
		mav.addObject("replyCount", replyCount); // 게시글에 달린 댓글 개수
		
		
		return mav;
		}
		else {
			int replyCount = rs.getReplyCountByBoardIdx(idx);
			mav.addObject("BoardLikeCount", BoardLikeCount); // 게시글 좋아요 개수
			mav.addObject("BoardHateCount", BoardHateCount); // 게시글 싫어요 개수
			mav.addObject("dto", dto);		// 게시글에 대한 정보
			mav.addObject("list", list);    // 댓글들에 대한 정보
			mav.addObject("replyCount", replyCount); // 게시글에 달린 댓글 개수
			
			return mav;
		}
	}
	
	// 게시글 추가 버튼을 눌렀을 때 
	@GetMapping("/addBoard")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("/community/addBoard");
		return mav;
	}
	// 게시글을 작성하고 게시글 작성 버튼을 눌렀을 때 
	@PostMapping("/addBoard")
	public String add(LckBoardDTO dto) {
		int row = cs.addBoard(dto);
		System.out.println(row != 0 ? "추가 성공":"추가 실패");
		return "redirect:/community/list";
	}
	
	// 게시글 수정 버튼을 눌렀을 때 
	@GetMapping("/modifyBoard/{idx}")
	public ModelAndView modify(@PathVariable int idx) {
		ModelAndView mav = new ModelAndView("/community/modifyBoard");
		LckBoardDTO dto = cs.getBoard(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	// 게시글을 수정하고 게시글 수정 버튼을 눌렀을 때 
	@PostMapping("/modifyBoard/{idx}")
	public String modify(LckBoardDTO dto) {
		int row = cs.modifyBoard(dto);
		System.out.println(row != 0? "수정 성공": "수정 실패");
		return "redirect:/community/view/{idx}";
	}
	
	// 게시글 삭제 버튼을 눌렀을 때 
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable ("idx")int idx) {
		int row  = cs.deleteBoard(idx);
		System.out.println(row != 0 ? "삭제 성공":"삭제 실패");
		return "redirect:/community/list";
	}
	
	
	
}
