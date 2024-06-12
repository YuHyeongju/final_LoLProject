package com.itbank.controller;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.LCKGameDTO;
import com.itbank.model.LCKMVPDTO;
import com.itbank.service.GameService;


@Controller
@RequestMapping("/game")
public class GameController {
	
	@Autowired private GameService gs;
	
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<LCKGameDTO> list = gs.getlist();
		List<Date> datelist = new ArrayList<>();
		for(LCKGameDTO dto : list) {
			datelist.add(dto.getGameDate());
		}
		LinkedHashSet<Date> set = new LinkedHashSet<>(datelist);
		datelist = new ArrayList<Date>(set);
		System.out.println("datelist : " + datelist);
		System.out.println("list : " + list);
		mav.addObject("list",list);
		mav.addObject("datelist",datelist);
		return mav;
	}
	//월별로 출력하기 위한 매핑
	@GetMapping("/list/{selectDate}")
	public ModelAndView listDate(@PathVariable("selectDate")String selectDate) {
		ModelAndView mav = new ModelAndView("/game/list");
		List<LCKGameDTO> list = gs.selectDateList(selectDate);
		List<Date> datelist = new ArrayList<>();
		for(LCKGameDTO dto : list) {
			datelist.add(dto.getGameDate());
		}
		LinkedHashSet<Date> set = new LinkedHashSet<>(datelist);
		datelist = new ArrayList<Date>(set);
		mav.addObject("list",list);
		mav.addObject("datelist",datelist);
		return mav;
	}
	
	//게임의 mvp투표를 가져오고 그에 맞는 상황을 얻기위해 날짜를 비교해서 출력
	@GetMapping("/MVP/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/game/MVP");
		LCKMVPDTO dto = gs.selectMVP(idx);
		int result = 0;
		String todayDateString = "";
		String gameDateString = "";
		System.out.println(dto);
		List<String> players = gs.mvpPlayers(idx);
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		todayDateString = sdf.format( new java.util.Date());
		gameDateString = sdf.format(dto.getGameDate());
		
		int todayNum = Integer.parseInt(todayDateString);
		int gameNum = Integer.parseInt(gameDateString);
		
		if(todayNum > gameNum) {
			result = 1;
		}
		
		dto.setResult(result);
		mav.addObject("dto", dto);
		mav.addObject("players",players);
		return mav;
	}
	
}
