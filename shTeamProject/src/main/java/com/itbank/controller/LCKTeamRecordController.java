package com.itbank.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itbank.service.LCKTeamRecordService;


@Controller
public class LCKTeamRecordController {
    
    @Autowired private LCKTeamRecordService teamRecordService;
	
	
    @GetMapping("/teamRanking")
    public String getTeamRanking(Model model) {
        model.addAttribute("teamRankings", teamRecordService.getTeamRankings());
        return "teamRanking";
    }
    
}
