package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.GameDTO;

@Repository
public interface GameDAO {

	@Insert("insert into lckgame (title,redTeam,blueTeam,redScore,blueScore,gameDate,gameTime,status,stadium)"
			+ " values (#{title},#{redTeam},#{blueTeam},#{redScore},#{blueScore},#{gameDate},#{gameTime},#{status},#{stadium})")
	int addGame(GameDTO dto);
	
	@Update("update lckGame set title = #{title},redTeam = #{redTeam},blueTeam = #{blueTeam},"
			+ "redScore=#{redScore},blueScore=#{blueScore},gameDate=#{gameDate},gameTime=#{gameTime},status=#{status},stadium=#{stadium} "
			+ "where gameDate = #{gameDate} and gameTime = #{gameTime}")
	int updateGame(GameDTO dto);

	@Select("select * from lckGame where gameDate = #{gameDate} and gameTime = #{gameTime}")
	GameDTO selectGame(GameDTO dto);

	@Select("select lg.* ,\r\n" + 
			"    trunc(\r\n" + 
			"        (\r\n" + 
			"        (select count(*) from lckmatchprediction  where gameIdx = lg.idx and bettingTeam = 0)/case\r\n" + 
			"        when (select count(*) from lckmatchprediction  where gameIdx = lg.idx) = 0 then 1\r\n" + 
			"        else (select count(*) from lckmatchprediction  where gameIdx = lg.idx)\r\n" + 
			"        end\r\n" + 
			"    )*100\r\n" + 
			"    )\r\n" + 
			"    as redPer,\r\n" + 
			"   trunc(\r\n" + 
			"     (\r\n" + 
			"        (select count(*) from lckmatchprediction  where gameIdx = lg.idx and bettingTeam = 1)/case\r\n" + 
			"        when (select count(*) from lckmatchprediction  where gameIdx = lg.idx) = 0 then 1\r\n" + 
			"        else (select count(*) from lckmatchprediction  where gameIdx = lg.idx)\r\n" + 
			"        end\r\n" + 
			"    )*100\r\n" + 
			"   )\r\n" + 
			"    as bluePer\r\n" + 
			"from lckgame lg order by gameDate")
	List<GameDTO> getGames();

	@Update("update lckgame set status = 1 where idx = #{idx}")
	int updateStatus(int idx);

	@Select("select idx from lckgame where gameDate = #{gameDate} and gameTime = #{gameTime}")
	int getGameIdx(GameDTO dto);

	@Select("select (case when redscore > bluescore then 0 when redscore < bluescore then 1 else 3 end) as bettingResult from lckgame where idx = #{gameIdx}")
	int getBettingTeam(int gameIdx);

	// 배팅 성공한 유저 아이디 받아오기
	@Select("select userid from lckmatchprediction where gameIdx = #{gameIdx} and bettingTeam = #{bettingTeam}")
	List<String> getBettingSuccessMember(Map<String, Integer> map);

	@Update("update lckmember set ticket = ticket + 1 where userid = #{userid}")
	int updateTicket(String user);

	@Select("select * from lckGame where gameDate = #{gameDate} and gameTime = #{gameTime} and status = #{status}")
	GameDTO selectStatus(GameDTO dto);

	@Select("SELECT * FROM lckGame order by gameDate")
    List<GameDTO> getGameList();
	
	@Select("SELECT * FROM lckGame where idx = #{idx}")
	GameDTO selectOne(int idx);
}
