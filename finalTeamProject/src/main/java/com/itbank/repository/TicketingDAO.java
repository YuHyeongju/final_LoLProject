package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.itbank.model.MemberGoodsDTO;
import com.itbank.model.TicketingDTO;

public interface TicketingDAO {

	@Insert("insert into lckTicketing(gameIdx, seat, userid, deleted)"
			+ " values(#{gameIdx}, #{seat}, #{userid}, 0)")
	void ticketings(TicketingDTO dto);
	
	@Update("UPDATE lckMemberGoods "
			+ "SET count = count - 1 "
			+ "WHERE goodsIdx = (SELECT idx FROM lckGoods WHERE name = '경기 관람권(1인)') "
			+ "  AND userid = #{userid}")
	void upticketing(MemberGoodsDTO dto);	
	
	@Select("SELECT seat FROM lckTicketing WHERE gameIdx = #{gameIdx} AND deleted = 0")
    List<String> getDeletedSeats(@Param("gameIdx") int gameIdx);
	
	@Select("SELECT " +
	        "    g.title," +
	        "    g.gameDate," +
	        "    g.gameTime," +
	        "    g.stadium," +
	        "    g.redTeam," +
	        "    g.blueTeam," +
	        "    t.gameIdx, " +
	        "    t.seat, " +
	        "    t.deleted, " +
	        "    t.idx " +
	        "FROM " +
	        "    lckGame g " +
	        "JOIN " +
	        "    lckTicketing t ON g.idx = t.gameIdx " +
	        "WHERE " +
	        "    t.userid = #{userid}")
	List<TicketingDTO> getTicketingListByUserid(String userid);

	// 예매 취소
	@Delete("DELETE FROM lckTicketing WHERE idx = #{idx}")
	void cancelTicket(@Param("idx") int idx);

	@Update("update lckticketing set deleted = 1 where idx = #{idx}")
	int ticketCancel(TicketingDTO dto);
}
