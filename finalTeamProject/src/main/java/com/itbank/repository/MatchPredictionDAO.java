package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.MatchPredictionDTO;
import com.itbank.model.MemberDTO;

@Repository
public interface MatchPredictionDAO {

	@Select("select * from lckmatchprediction where gameIdx = #{gameIdx} and userid = #{userid}")
	MatchPredictionDTO dupCheck(MatchPredictionDTO dto);

	@Insert("insert into lckmatchprediction (gameIdx,bettingTeam,userid) values (#{gameIdx},#{bettingTeam},#{userid})")
	int insertPrediction(MatchPredictionDTO dto);

	@Update("update lckmatchprediction set bettingTeam = #{bettingTeam} where gameIdx = #{gameIdx} and userid = #{userid}")
	int updatePrediction(MatchPredictionDTO dto);

	@Select("select * from lckmatchprediction where userid = #{userid}")
	List<MatchPredictionDTO> userPrediction(MemberDTO login);

}
