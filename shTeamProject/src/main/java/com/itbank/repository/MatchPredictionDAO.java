package com.itbank.repository;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;

@Repository
public interface MatchPredictionDAO {

	MatchPredictionDTO dupCheck(MatchPredictionDTO dto);

	int insertPrediction(MatchPredictionDTO dto);

	int updatePrediction(MatchPredictionDTO dto);

	List<MatchPredictionDTO> userPrediction(MemberDTO login);

}
