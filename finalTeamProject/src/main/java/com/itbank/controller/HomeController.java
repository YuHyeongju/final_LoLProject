package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.LCKVideoDTO;
import com.itbank.service.LCKVideoService;

@Controller
public class HomeController {
	
	@Autowired LCKVideoService videoservice;

	
	@GetMapping("/")
	public ModelAndView getLCKVideo2() {
		ModelAndView mav = new ModelAndView("home");
		List<LCKVideoDTO> videos = videoservice.getVideos();
		mav.addObject("videos",videos);
		return mav;
	}
}
