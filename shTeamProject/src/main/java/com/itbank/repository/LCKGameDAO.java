package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.LCKGameDTO;
import com.itbank.model.LCKMVPDTO;
@Repository
public interface LCKGameDAO {
	
	//경기 일정을 출력하는 select 구문
	@Select("SELECT *\r\n" + 
			"FROM lckGameView order by gameDate")
	List<LCKGameDTO> selectList();

	//경기 일정을 중복체크한 뒤 출력을 진행하는 구문
	@Select("select gameTime from lckGame order by gameTime")
	List<LCKGameDTO> selectTimeList();

	//경기 일정에 대한 mvp 투표 목록을 가져오는 구문
	@Select("SELECT lg.idx, \r\n" + 
			"       lg.title, lg.gameDate, lg.gameTime, \r\n" + 
			"       lg.redTeam, lg.blueTeam,\r\n" + 
			"       rt.top AS redTop, rt.jungle AS redJungle, rt.mid AS redMid, rt.adCarry AS redAdCarry, rt.supporter AS redSupporter,\r\n" + 
			"       bt.top AS blueTop, bt.jungle AS blueJungle, bt.mid AS blueMid, bt.adCarry AS blueAdCarry, bt.supporter AS blueSupporter,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = rt.top ) as redTopCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = rt.jungle ) as redJungleCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = rt.mid ) as redMidCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = rt.adCarry ) as redAdCarryCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = rt.supporter ) as redSupporterCount,\r\n" + 
			"        (select count(*) from lckmvp where gameIdx = lg.idx and playername = bt.top ) as blueTopCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = bt.jungle ) as blueJungleCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = bt.mid ) as blueMidCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = bt.adCarry ) as blueAdCarryCount,\r\n" + 
			"       (select count(*) from lckmvp where gameIdx = lg.idx and playername = bt.supporter ) as blueSupporterCount,\r\n" + 
			"		(SELECT ROUND(SUM(CASE WHEN playerName = rt.top THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS redTopPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = bt.top THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS blueTopPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = rt.jungle THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS redJunglePercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = bt.jungle THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS blueJunglePercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = rt.mid THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS redMidPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = bt.mid THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS blueMidPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = rt.adCarry THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS redAdCarryPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = bt.adCarry THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS blueAdCarryPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = rt.supporter THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS redSupporterPercent,\r\n" + 
			"       (SELECT ROUND(SUM(CASE WHEN playerName = bt.supporter THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) FROM lckmvp WHERE gameIdx = lg.idx ) AS blueSupporterPercent\r\n" +
			"FROM lckGame lg\r\n" + 
			"JOIN lckTeamInfo rt ON lg.redTeam = rt.teamName\r\n" + 
			"JOIN lckTeamInfo bt ON lg.blueTeam = bt.teamName\r\n" + 
			"WHERE lg.idx = #{gameIdx}")
	LCKMVPDTO selectMVP(int idx);

	//투표한 선수의 정보를 입력하는 구문
	@Insert("insert into lckmvp (playerName, userId, gameIdx)\r\n" + 
			"values (#{playerName},#{userId},#{gameIdx})")
	int MVPChoice(LCKMVPDTO dto);

	//투표한 선수의 관해 userId와 gameIdx를 비교하여 중복체크하는 구문
	@Select("select * from lckmvp where userId = #{userId} and gameIdx = #{gameIdx}")
	LCKMVPDTO MVPChoiceCheck(LCKMVPDTO dto);

	//투표한 선수를 교체할 때 업데이트를 이용하여 만든 구문
	@Update("UPDATE lckmvp SET playerName = #{playerName} WHERE userId = #{userId} AND gameIdx = #{gameIdx}")
	int MVPUpdate(LCKMVPDTO dto);

	@Select("SELECT *\r\n" + 
			"FROM lckGameView\r\n" + 
			"WHERE TO_CHAR(gameDate, 'YYYY-MM') = #{selectDate} order by gameDate" 
			)
	List<LCKGameDTO> selectDateList(String selectDate);

	@Select("select * from lckgame where idx = #{idx}")
	List<LCKGameDTO> reVideo(int idx);

	@Select("SELECT " + 
			"        playername as vote_player, count(*) as vote_count FROM lckmvp WHERE gameIdx = #{gameIdx} GROUP BY playername " + 
			"      HAVING count(*) = (SELECT MAX(vote_count) FROM (SELECT playername, count(*) as vote_count FROM lckmvp WHERE gameIdx = #{gameIdx} " + 
			"        GROUP BY playername))")
	List<String> mvpPlayers(int idx);

	
}
