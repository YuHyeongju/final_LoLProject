package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.GameDTO;
import com.itbank.model.MemberGoodsDTO;
import com.itbank.model.TicketingDTO;
import com.itbank.repository.TicketingDAO;
import com.itbank.service.GameService;
import com.itbank.service.TicketingService;

@Controller
@RequestMapping("/ticketing")
public class TicketingController {
	
	@Autowired private GameService gs; // GameService 주입
	@Autowired private TicketingService ts;
    
    @GetMapping("/ticketinglist")
    public String ticketinglist(Model model){
        List<GameDTO> gameList = gs.getGameList(); // 게임 목록 가져오기
        model.addAttribute("gameList", gameList); // 모델에 게임 목록 추가
        return "ticketing/ticketinglist"; // 뷰 이름 반환
    }
	
    @GetMapping("/ticketing")
    public String ticketing(Model model, @RequestParam int idx) {
        GameDTO game = gs.selectOne(idx); // 해당 idx의 게임 정보 가져오기
        model.addAttribute("game", game); // 모델에 게임 정보 추가
        return "ticketing/ticketing"; // 뷰 이름 반환
    }
    
    // TicketingController의 ticketings 메서드 수정
    @PostMapping("/ticketings")
    public ModelAndView ticketings(@RequestParam("gameIdx") int gameIdx,
                                    @RequestParam("seat") String seat,
                                    @RequestParam("userid") String userid) {
        // TicketingDTO 객체 생성
        TicketingDTO dto = new TicketingDTO();
        dto.setGameIdx(gameIdx);
        dto.setUserid(userid);
        dto.setSeat(seat);
        
        MemberGoodsDTO mgdto = new MemberGoodsDTO();
        mgdto.setUserid(userid); // 사용자 아이디 설정

        ModelAndView mav = new ModelAndView("redirect:/ticketing/ticketinglist");
        ts.saveTicketing(dto);
        ts.updateTicketing(mgdto);

        return mav;
    }
    
    @GetMapping("/deleted-seats")
    public ResponseEntity<List<String>> getDeletedSeats(@RequestParam int gameIdx) {
        List<String> deletedSeats = ts.getDeletedSeats(gameIdx);
        return ResponseEntity.ok(deletedSeats);
    }
    @GetMapping("/userticketinglist")
    public String userticketinglist(Model model, HttpSession session) {
        String userid = (String) session.getAttribute("userid");
        if (userid == null) {
            // 사용자 ID가 없는 경우 처리
        } else {
            List<GameDTO> gameList = gs.getGameList(); // 게임 목록 가져오기
            model.addAttribute("gameList", gameList); // 모델에 게임 목록 추가
            
            // 해당 사용자의 티켓 정보 가져오기
            List<TicketingDTO> ticketingList = ts.getTicketingListByUserid(userid);
            model.addAttribute("userticketinglist", ticketingList); // 모델에 사용자의 티켓 정보 추가
        }
        return "home"; // 뷰 이름 반환
    }
    
    // 예매 취소
    @DeleteMapping("/cancel")
    public ResponseEntity<String> cancelTicket(@RequestParam int idx) {
        // 여기에 예매 취소 로직을 추가
        ts.cancelTicket(idx);
        return ResponseEntity.ok("예매가 취소되었습니다.");
    }
}	
