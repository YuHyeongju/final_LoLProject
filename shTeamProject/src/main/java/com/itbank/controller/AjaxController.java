package com.itbank.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.component.HashComponent;
import com.itbank.component.MailComponent;
import com.itbank.model.LoginLogDTO;
import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.model.TicketingDTO;
import com.itbank.service.MemberService;
import com.itbank.service.PredictionService;
import com.itbank.service.TicketingService;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired private TicketingService ts;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private Random ran = new Random();
	@Autowired private MailComponent mailComponent;
	@Autowired private MemberService ms;
	@Autowired private PredictionService ps;
	@Autowired private HashComponent hc;
	
	
	// 아이디 중복 체크 
	@GetMapping("/dupCheck/{userid}")
	public int dupCheck(@PathVariable("userid") String userid) {
		System.out.println(userid);
		// 아이디 최소 2자리 이상
		if(userid.length() <= 1)return 1;
		int row = ms.dupCheck(userid);
		return row;
	}
	
	// 로그인
	@PostMapping("/login")
	public int login(@RequestBody MemberDTO dto,HttpSession session) {
		int row = 0;
		MemberDTO login = ms.login(dto);
		
		if(login != null) {
			String userid = login.getUserid();
			LoginLogDTO log = ms.getLastLog(userid);
			if(log == null) {
				row = ms.givePoint(userid);
				login.setPoint(login.getPoint() + 100);
			}
			else {
				if(!sdf.format(log.getLoginTime()).equals(sdf.format(new Date()))) {
					row = ms.givePoint(userid);
					login.setPoint(login.getPoint() + 100);
					// 로그인한 시간 저장
				}
			}
			row = ms.addloginInfo(login.getUserid());
			session.setAttribute("login", login);
			session.setMaxInactiveInterval(6000);
		}
		else {
			return 0;
		}
		if(login.getDenyTime() != null) {
			if (login.getDenyNotice() == 1 && !sdf.format(login.getDenyTime()).equals(sdf.format(new Date()))) {
				ms.updateNotice(login.getUserid());
			}
		}
		
		return row;
	
	}
	
	// 메일 발송
	@PostMapping("/sendMail")
	public int sendMail(@RequestBody HashMap<String, String> param, HttpSession session) {
		// System.out.println("address : " + param.get("address"));
		int num = ran.nextInt(899999) + 100000;
		// System.out.println("num : " + num);
		String authNumber = String.format("%06d", num);
		session.setAttribute("authNumber", authNumber);
		session.setMaxInactiveInterval(180);
		param.put("content", authNumber);
		param.put("title", "[LCK 정보사이트] 인증번호입니다");
		
		try {
			int row = mailComponent.sendSimpleMessage(param);
			if(row != 0)return 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 인증번호 확인
	@GetMapping("/authNumber/{inputNumber}")
	public int authNumber(@PathVariable("inputNumber")String inputNumber,HttpSession session) {
		String authNumber = (String) session.getAttribute("authNumber");
		if(inputNumber.equals(authNumber))return 1;
		return 0;
	}

	
	// 회원가입
	@PostMapping("/join")
	public int join(MemberDTO dto) {
		int row = 0;
		System.out.println(dto.getUserid());
		System.out.println(dto.getUserpw());
		System.out.println(dto.getNickName());
		System.out.println(dto.getUpload());
		System.out.println(dto.getEmail());
		if(dto.getUpload().getSize() != 0) {
			row = ms.join(dto);
		}
		else {
			row = ms.noImgJoin(dto);
		}
		return row;
	}
	
	// 임시 비밀번호 이메일 발급
	@PostMapping("/resetPass")
	public int resetPass(@RequestBody MemberDTO dto) {
		int row = 0;
		System.out.println(dto.getEmail());
		System.out.println(dto.getUserid());
		MemberDTO member = ms.findMember(dto);
		if(member != null) {
			HashMap<String, String> param = new HashMap<String, String>();
			String pass = UUID.randomUUID().toString().substring(0,7);
			param.put("address",dto.getEmail());
			param.put("content", pass);
			param.put("title", "[LCK 정보사이트] 임시 비밀번호입니다");
			
			try {
				row = mailComponent.sendSimpleMessage(param);
				if(row != 0) {
					dto.setUserpw(pass);
					row = ms.updatePass(dto);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return row;
		
	}
	
	@PostMapping("/changePass")
	public int changePass(@RequestBody MemberDTO dto) {
		int row = 0;
		if(dto.getNewPassword().length()< 4) {
			return 3;
		}
		MemberDTO member = ms.login(dto);
		if(member != null) {
			row = ms.updateNewPass(dto);
		}else {
			return 0;
		}
		return row;
	}
	
	// 배팅 
	@PostMapping("/matchPrediction")
	public int matchPrediction(@RequestBody MatchPredictionDTO dto) {
		int row = 0;
		MatchPredictionDTO ob = ps.dupCheck(dto);
		if(ob == null) {
			row = ps.insertPrediction(dto);
			return row;
		}
		else {
			row = ps.updatePrediction(dto);
			return row;
		}
		
	}
//	// 5초마다 현재시간 체크 후 경기 진행시간이 되면 경기 진행중 상태로 변경하는 기능
//	@PostMapping("/interval")
//	public int interval(@RequestBody Map<String, Date> date) {
//		int row = 0;
//		List<GameDTO> games = gs.getGames();
//		for(GameDTO game : games) {
//			if(sdf.format(game.getGameDate()).equals(sdf.format(date.get("date"))) && 
//			game.getGameDate().compareTo(date.get("date")) < 0  ) {
//				row = gs.updateStatus(game.getIdx());
//			}
//		}
//		return row;
//	}
	
	@PostMapping("/denyNotice")
	public int denyNotice(@RequestBody HashMap<String, String>map ,HttpSession session) {
		int row = 0;
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String userid = login.getUserid();
		row = ms.denyNotice(userid);
		System.out.println(row != 0 ? "거절 성공":"거절 실패");
		login.setDenyNotice(1 - login.getDenyNotice());
		session.setAttribute("login", login);
		return row;
	}
	
	@PostMapping("/modifyProfile")
	public int modifyProfile(MemberDTO dto,HttpSession session) {
		System.out.println(dto.getUpload());
		System.out.println(dto.getUpload().getOriginalFilename());
		System.out.println(dto.getNickName());
		int row = 0;
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		if(dto.getNickName().length() < 2)return row;
		// 업로드할 이미지가 있을 때
		if(dto.getUpload().getOriginalFilename() != "") {
			row = ms.modifyProfile(dto);
			if(row == 1) {
				login.setNickName(dto.getNickName());
				String originalFileName = dto.getUpload().getOriginalFilename();
				String[] arr = originalFileName.split("\\.");
				String tmp = "." + arr[1];	
				String randomName = hc.getHash(arr[0]);
				randomName = randomName.substring(3,10);
				randomName += tmp;
				dto.setProfile(randomName);
				login.setProfile(dto.getProfile());
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(6000);
			}
		}else {
			row = ms.modifyNickNameOnly(dto);
			if(row == 1) {
				login.setNickName(dto.getNickName());
				session.setAttribute("login", login);
				session.setMaxInactiveInterval(6000);
			}
		}
		return row;	
	}
	
	@PostMapping("/ticketCancel")
	public int ticketCancel(@RequestBody TicketingDTO dto) {
		int row = 0;
		System.out.println(dto.getIdx());
		row = ts.ticketCancel(dto);
		return row;
	}
}
