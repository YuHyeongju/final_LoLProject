package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GameDTO;
import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.service.GameService;
import com.itbank.service.PredictionService;

@Controller
@RequestMapping("/matchPrediction")
public class MatchPredictionController {
	
	@Autowired private GameService gs;
	@Autowired private PredictionService ps;
	
	@GetMapping()
	public ModelAndView matchPrediction(HttpSession session) {
		ModelAndView mav = new ModelAndView("matchPrediction/match");
		List<GameDTO> games = gs.getGames();
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		List<MatchPredictionDTO> predictions = ps.userPrediction(login);
		mav.addObject("predictions",predictions);
		mav.addObject("games",games);
		
		return mav;
	}

}
