package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.LCKVideoDTO;
import com.itbank.service.LCKVideoService;

@Controller
public class LCKVideoController {

	@Autowired LCKVideoService videoservice;
	
	@GetMapping("/lckVideo")
	public ModelAndView getLCKVideo() {
		ModelAndView mav = new ModelAndView("lckVideo");
		List<LCKVideoDTO> videos = videoservice.getVideos();
		mav.addObject("videos",videos);
		return mav;
	}
	@GetMapping("/lckVideoCrawling")
	public String videoCrawling() {
		List<LCKVideoDTO> videos = videoservice.fetchVideos();
		videoservice.deleteVideos();
		for(LCKVideoDTO dto : videos) {
			int row = videoservice.addVideo(dto);
			if(row != 0)System.out.println("추가성공");
		}
		return "redirect:/admin";
	}
	
	
	
	
}
