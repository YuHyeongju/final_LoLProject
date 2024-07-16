package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GameDTO;
import com.itbank.model.LCKGameDTO;
import com.itbank.model.LCKMVPDTO;
import com.itbank.repository.GameDAO;
import com.itbank.repository.LCKGameDAO;

@Service
public class GameService {

	@Autowired private GameDAO shdao;
	@Autowired private LCKGameDAO dao;

	public List<GameDTO> getGames() {
		return shdao.getGames();
	}

	// 현재 시간 기준 시작한 경기상태 변경(예정 -> 경기중)
	public int updateStatus(int idx) {
		return shdao.updateStatus(idx);
	}
	
	// 민서
	public List<GameDTO> getGameList() {
        return shdao.getGameList();
    }

	public GameDTO selectOne(int idx) {
		return shdao.selectOne(idx);
	}
	
	// 원지
	

	public List<LCKGameDTO> getlist() {
		List<LCKGameDTO> list = dao.selectList();
		return list;
	}

	public LCKMVPDTO selectMVP(int idx) {
		return dao.selectMVP(idx);
	}

	public int MVPChoice(LCKMVPDTO dto) {
		return dao.MVPChoice(dto);
	}

	public LCKMVPDTO MVPChoiceCheck(LCKMVPDTO dto) {
		return dao.MVPChoiceCheck(dto);
	}

	public int MVPUpdate(LCKMVPDTO dto) {
		return dao.MVPUpdate(dto);
	}

	public List<LCKGameDTO> selectDateList(String selectDate) {
		return dao.selectDateList(selectDate);
	}

	public List<LCKGameDTO> selectVideo(int idx) {
		// TODO Auto-generated method stub
		return dao.reVideo(idx);
	}

	public List<String> mvpPlayers(int idx) {
		return dao.mvpPlayers(idx);
	}
	
}
