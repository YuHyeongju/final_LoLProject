package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.CrawlingComponent;
import com.itbank.model.GameDTO;
import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.CrawlingService;
import com.itbank.service.GameService;
import com.itbank.service.PredictionService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired private GameService gs;
	@Autowired private PredictionService ps;
	@Autowired private CrawlingComponent cc;
	@Autowired private CrawlingService cs;
	
	@GetMapping("/crawling")
	public ModelAndView crawling(String date, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("admin/main");
		int row = 0;
		List<GameDTO> games = cc.getGames(date);
		for(GameDTO dto : games) {
			GameDTO dupCheck = cs.selectGame(dto);
			if(dupCheck == null) {
				row = cs.addGame(dto);
				System.out.println(row != 0 ? "추가 성공" : "추가 실패");
			}
			else {
				// 플레이오프 대진상대 결정 시 업데이트
				if(!dupCheck.getRedTeam().equals(dto.getRedTeam())) {
					row = cs.updateGame(dto);
				}
				if(!dupCheck.getBlueTeam().equals(dto.getBlueTeam())) {
					row = cs.updateGame(dto);
				}
				if(!dto.getStadium().equals(dupCheck.getStadium())){
					row = cs.updateGame(dto);
				}
				// 경기 상태 변경 시 업데이트
				GameDTO statusCheck = cs.selectStatus(dto);
				if(statusCheck == null) {
				row = cs.updateGame(dto);
				if(row == 1 && dto.getStatus() == 0) {
					int gameIdx = cs.getGameIdx(dto);
					int bettingTeam = cs.getBettingTeam(gameIdx);
					Map<String, Integer> map = new HashMap<String, Integer>();
					map.put("gameIdx", gameIdx);
					map.put("bettingTeam", bettingTeam);
					List<String> list = cs.getBettingSuccessMember(map);
					for(String user : list) {
						int result = cs.updateTicket(user);
						if(result == 1) {
							System.out.println("교환권 지급 완료");
							MemberDTO login = (MemberDTO)session.getAttribute("login");
							if(login.getUserid().equals(user)) {
								login.setTicket(login.getTicket() + 1);
								session.setAttribute("login", login);
							}
							
						}
					}
				}
				System.out.println(row != 0 ? dto.getGameDate() :"");
			}
			}
		}
		mav.addObject("games",games);
		return mav;
	}
	@GetMapping
	public ModelAndView admin(HttpSession session) {
		ModelAndView mav = new ModelAndView("admin/main");
		List<GameDTO> games = gs.getGames();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<MatchPredictionDTO> predictions = ps.userPrediction(login);
		mav.addObject("predictions",predictions);
		mav.addObject("games",games);
		return mav;
	}
}
