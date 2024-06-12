package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.LckBoardLikeDTO;
import com.itbank.model.LckReplyLikeDTO;
import com.itbank.repository.LckLikeDAO;

@Service
public class LckLikeService {

	@Autowired
	private LckLikeDAO dao;

	public int addBoardLike(LckBoardLikeDTO dto) {
		return dao.insertBoardLike(dto);
	}

	public int addBoardHate(LckBoardLikeDTO dto) {

		return dao.insertBoardHate(dto);
	}

	public int addReplyLike(LckReplyLikeDTO dto) {

		return dao.insertReplyLike(dto);
	}

	public int getBoardLikeCount(int idx) {

		return dao.BoardLikeCount(idx);
	}

	public int getBoardHateCount(int idx) {

		return dao.BoardHateCount(idx);
	}

	public LckBoardLikeDTO getBoardLikeOne(LckBoardLikeDTO likeDTO) {

		return dao.selectBoardLikeOne(likeDTO);
	}

	public int getReplyLikeCount(int idx) {

		return dao.selectReplyLikeCount(idx);
	}

	public int getReplyHateCount(int idx) {

		return dao.selectReplyHateCount(idx);
	}

	public int updateBoardLike(LckBoardLikeDTO dto) {

		return dao.updateBoardLike(dto);
	}

	public int updateBoardHate(LckBoardLikeDTO dto) {

		return dao.updateBoardHate(dto);
	}

	public LckReplyLikeDTO getReplyLike(LckReplyLikeDTO dto) {

		return dao.selectReplyLike(dto);
	}

	public int updateReplyLike(LckReplyLikeDTO dto) {

		return dao.updateReplyLike(dto);
	}

	public int addReplyHate(LckReplyLikeDTO dto) {
		
		return dao.insertReplyHate(dto);
	}

	// 로그인한 사용자의 좋아요 싫어요 리스트 불러오는 메서드
	public List<LckReplyLikeDTO> getReplyLikeList(String string) {
		
		return dao.selectReplyLikeList(string);
	}

	public int updateReplyHate(LckReplyLikeDTO dto) {
		
		return dao.updateReplyHate(dto);
	}

}
