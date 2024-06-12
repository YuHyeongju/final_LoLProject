package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GoodsDTO;
import com.itbank.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired private GoodsService gs;
	
	@GetMapping("/add")
	public String add() {
		return "/goods/add";
	}
	
	@PostMapping("/add")
	public ModelAndView add(GoodsDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		int row = gs.insert(dto);
		
		String msg = row != 0 ? "등록 성공" : "등록 실패";
		String url = row != 0 ? "/goods/search" : "";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		return mav;
	}
	
	@GetMapping("/search")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("/goods/search");
		List<GoodsDTO> list = gs.selectList();
		
		// 현재 등록된 상품이 없는 경우
		if(list.size() == 0) {
			mav.addObject("isEmpty", "isEmpty");
		}
		else {
			mav.addObject("list", list);
		}
		
		
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/goods/view");
		
		GoodsDTO dto = gs.selectOne(idx);
		
		mav.addObject("dto", dto);
		
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("alert");
		
		int row = gs.delete(idx);
		
		String msg = row != 0 ? "삭제 성공" : "삭제 실패";
		String url = row != 0 ? "/" : "";
		
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		
		
		return mav;
	}
	

	@GetMapping("/exchange/{idx}")
	public ModelAndView exchange(@PathVariable("idx") int idx) {
	    ModelAndView mav = new ModelAndView("alert");
	    
	    int row = gs.exchange(idx);
	    
	    String msg = row != 0 ? "교환 성공" : "교환 실패";
	    String url = row != 0 ? "/" : "";
	    
	    mav.addObject("msg", msg);
	    mav.addObject("url", url);
	    
	    return mav;
	}




}
