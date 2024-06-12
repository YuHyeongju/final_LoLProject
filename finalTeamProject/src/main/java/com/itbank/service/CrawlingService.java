package com.itbank.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GameDTO;
import com.itbank.repository.GameDAO;

@Service
public class CrawlingService {

	@Autowired private GameDAO dao;

	public int addGame(GameDTO dto) {
		return dao.addGame(dto);
	}
	
	public int updateGame(GameDTO dto) {
		return dao.updateGame(dto);
	}

	public GameDTO selectGame(GameDTO dto) {
		return dao.selectGame(dto);
	}

	public int getGameIdx(GameDTO dto) {
		return dao.getGameIdx(dto);
	}

	public int getBettingTeam(int gameIdx) {
		return dao.getBettingTeam(gameIdx);
	}

	public List<String> getBettingSuccessMember(Map<String, Integer> map) {
		return dao.getBettingSuccessMember(map);
	}

	public int updateTicket(String user) {
		return dao.updateTicket(user);
	}

	public GameDTO selectStatus(GameDTO dto) {
		return dao.selectStatus(dto);
	}
	
	
}
