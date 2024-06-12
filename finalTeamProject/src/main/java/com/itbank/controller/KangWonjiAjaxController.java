package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.model.LCKMVPDTO;
import com.itbank.service.GameService;

@RestController
@RequestMapping("/Ajax")
public class KangWonjiAjaxController {
	@Autowired private GameService gs;
	
	@PostMapping("/MVP")	
	public int MVPChoice(@RequestBody LCKMVPDTO dto) {
		int row = 0;
		LCKMVPDTO check = gs.MVPChoiceCheck(dto);
		if(check == null) {
			row = gs.MVPChoice(dto);
		}
		else {
			row = gs.MVPUpdate(dto);
		}
		return row;
	}


}
