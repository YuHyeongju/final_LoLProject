package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.repository.MemberDAO;
import com.itbank.repository.TicketingDAO;
import com.itbank.model.MemberDTO;

public class GoodsInterceptor implements HandlerInterceptor {

    @Autowired private MemberDAO memberDao;
    @Autowired private TicketingDAO tDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // System.out.println("1. GoodsInterceptor.preHandle");
        
        // 세션에서 로그인한 사용자 정보 가져오기
        MemberDTO login = (MemberDTO) request.getSession().getAttribute("login");
        
        // 로그인한 사용자의 ID로 상품 리스트 조회하기
        if (login != null) {
            request.setAttribute("memberGoodsList", memberDao.getMemberGoodsListByUserid(login.getUserid()));
//            request.setAttribute("memberGoodsList", memberDao.);
        } else {
            request.setAttribute("memberGoodsList", null);
        }
        
        
        return true;
    }
}
