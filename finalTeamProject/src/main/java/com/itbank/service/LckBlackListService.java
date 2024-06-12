package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.LckBoardBlackListDTO;
import com.itbank.model.LckReplyBlackListDTO;
import com.itbank.repository.LckBlackListDAO;

@Service
public class LckBlackListService {

	@Autowired private LckBlackListDAO dao;
	
	public int insertBoardReport(LckBoardBlackListDTO dto) {
		
		return dao.insertBoardReport(dto);
	}

	public LckBoardBlackListDTO getBoardReportOne(LckBoardBlackListDTO dto) {
		
		return dao.selectBoardReportOne(dto);
	}

	public LckReplyBlackListDTO getReplyReportOne(LckReplyBlackListDTO dto) {
		
		return dao.selectReplyReportOne(dto);
	}

	public int insertReplyReport(LckReplyBlackListDTO dto) {
	
		return dao.insertReplyReport(dto);
	}



}
