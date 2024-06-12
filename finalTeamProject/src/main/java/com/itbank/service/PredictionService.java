package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MatchPredictionDAO;

@Service
public class PredictionService {

	@Autowired private MatchPredictionDAO dao;
	// 예측정보가 있는지 중복 체크
	public MatchPredictionDTO dupCheck(MatchPredictionDTO dto) {
		return dao.dupCheck(dto);
	}
	// 예측정보를 새로 추가
	public int insertPrediction(MatchPredictionDTO dto) {
		return dao.insertPrediction(dto);
	}
	// 예측정보를 업데이트
	public int updatePrediction(MatchPredictionDTO dto) {
		return dao.updatePrediction(dto);
	}
	// 로그인한 유저의 예측정보를 리스트로 받는다
	public List<MatchPredictionDTO> userPrediction(MemberDTO login) {
		return dao.userPrediction(login);
	}
}
