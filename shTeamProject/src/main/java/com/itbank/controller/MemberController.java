package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GoodsDTO;
import com.itbank.model.MapperDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.MemberGoodsDTO;
import com.itbank.model.TicketingDTO;
import com.itbank.service.MemberService;
import com.itbank.service.TicketingService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired private MemberService ms;
	@Autowired private TicketingService ts;
	
	@GetMapping("/join")
	public void join() {}
	
	@GetMapping("/login")
	public void login() {}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/myPage")
	public ModelAndView myPage(HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		ModelAndView mav = new ModelAndView("/member/myPage");
		List<MemberGoodsDTO> productList = ms.getUserProductList(login.getUserid());
		List<TicketingDTO> ticketingList = ts.getTicketingListByUserid(login.getUserid());
		mav.addObject("productList",productList);
		mav.addObject("ticketingList",ticketingList);
		for(TicketingDTO dto : ticketingList) {
			System.out.println(dto.getTitle());
			System.out.println(dto.getGameDate());
			System.out.println(dto.getRedTeam());
			
		}
		return mav;
	}
	
	@PostMapping("/updateTicket/{goodsIdx}")
	public ModelAndView updateTicket(@PathVariable("goodsIdx") int goodsIdx, MapperDTO map, HttpSession session) {
	    ModelAndView mav = new ModelAndView("alert"); // 티켓 업데이트 후 굿즈응모 로 리다이렉트
	    GoodsDTO goodsDto = ms.selectOne(goodsIdx);
	    int ticket = map.getTicket();
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
	    MemberGoodsDTO memberGoods = new MemberGoodsDTO();
	    memberGoods.setGoodsIdx(goodsIdx);
	    memberGoods.setUserid(login.getUserid());
	    int row = ms.insertOrUpdateMemberGoods(memberGoods);
	    if (row != 0) {
	        int product = goodsDto.getIdx();
	        ms.updateSale(product);
	        ms.updateTickets(map);
	        ms.updategoodssaled(product);
	        mav.addObject("url","/goods/search");
	        mav.addObject("msg","교환이 완료되었습니다.");
	    }else {
	    	mav.addObject("msg","교환 실패");
	    }
	    login.setTicket(login.getTicket()-ticket);
	    session.setAttribute("login", login);
	    session.setMaxInactiveInterval(6000);
	    return mav;
	}
}
