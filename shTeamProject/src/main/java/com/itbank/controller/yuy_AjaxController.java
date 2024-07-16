package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.GoodsService;

@RestController
public class yuy_AjaxController {
	
	@Autowired private GoodsService gs;
	
	@GetMapping("/goodsPlus")
	public int goodsPlus(int idx) {
//		String result = "";
		
		int row = gs.increaseQuantity(idx);
		
//		result = row != 0 ? "성공" : "실패";
		
		return row;
	}
	
	@GetMapping("/goodsMinus")
	public int goodsMinus(int idx) {
//		String result = "";
		
		int row = gs.decreaseQuantity(idx);
		
//		result = row != 0 ? "성공" : "실패";
		
		return row;
	}
}
