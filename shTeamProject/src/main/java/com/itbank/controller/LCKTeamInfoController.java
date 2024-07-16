package com.itbank.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.LCKTeamInfoDTO;
import com.itbank.service.LCKTeamInfoService;

@Controller
@RequestMapping("/teamInfo")
public class LCKTeamInfoController {

	@Autowired private LCKTeamInfoService service;
	
	
	@GetMapping("/info/{teamName}")
	public ModelAndView infoList(@PathVariable("teamName") String teamName) {
		ModelAndView mav = new ModelAndView("/teamInfo/info");
		List<LCKTeamInfoDTO> list = service.getTeamInfoList(teamName);
		mav.addObject("list",list);
		
		return mav;
		
	}
	
//	@GetMapping("/info")
//	public ModelAndView imglist() {
//		ModelAndView mav = new ModelAndView();
//		return mav;
//	}
	
	
	
	
}
