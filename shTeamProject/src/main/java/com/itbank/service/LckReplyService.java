package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.LckReplyDTO;
import com.itbank.repository.LckReplyDAO;

@Service
public class LckReplyService {

	@Autowired private LckReplyDAO dao;
	
	public int writeReply(LckReplyDTO dto) {
		
		return dao.insert(dto);
	}

	public List<LckReplyDTO> getReplyList(int idx) {
		
		return dao.selectReplyList(idx) ;
	}

	public int deleteReply(int idx) {
		
		return dao.deleteReply(idx);
	}

	public int modifyReply(LckReplyDTO dto) {
		
		return dao.modifyReply(dto);
	}

	public LckReplyDTO getReply(int idx) {
		
		return dao.selectReply(idx);
	}

	public int getReplyCountByBoardIdx(int idx) {
		
		return dao.selectReplyCountByBoardIdx(idx);
	}

}
