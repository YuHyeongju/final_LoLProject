package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itbank.model.MemberGoodsDTO;
import com.itbank.model.TicketingDTO;
import com.itbank.repository.TicketingDAO;

@Service
public class TicketingService {
	
	@Autowired TicketingDAO dao;
	
	public void saveTicketing(TicketingDTO dto) {
		dao.ticketings(dto);
	}
	
	public List<String> getDeletedSeats(int gameIdx) {
        return dao.getDeletedSeats(gameIdx);
    }
	
	public void updateTicketing(MemberGoodsDTO dto) {
	    dao.upticketing(dto);
	}
	 public List<TicketingDTO> getTicketingListByUserid(String userid) {
		 return dao.getTicketingListByUserid(userid);
	 }
	 
	 @Transactional
	 public void cancelTicket(int idx) {
	     dao.cancelTicket(idx);
	 }

	public int ticketCancel(TicketingDTO dto) {
		return dao.ticketCancel(dto);
	}
	
}
