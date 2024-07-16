package com.itbank.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.LCKTeamInfoDTO;
import com.itbank.repository.LCKTeamInfoDAO;

@Service
public class LCKTeamInfoService {

	@Autowired private LCKTeamInfoDAO dao;

//	public LCKTeamRankingDTO getinfo(String teamName) {
//		return dao.selectOne(teamName);
//	}

	public List<LCKTeamInfoDTO> getTeamInfoList(String teamName) {
		return dao.selectOne(teamName);
	}

	

}
