package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.LckBoardBlackListDTO;
import com.itbank.model.LckReplyBlackListDTO;

@Repository
public interface LckBlackListDAO {

	@Insert("insert into lckBoardBlackList (boardIdx,reportUser,reportedUser) values (#{boardIdx},#{reportUser},"
			+ "#{reportedUser})")
	int insertBoardReport(LckBoardBlackListDTO dto);

	@Select("select * from lckBoardBlackList where boardIdx = #{boardIdx} and reportUser = #{reportUser} "
			+ " and reportedUser = #{reportedUser}")
	LckBoardBlackListDTO selectBoardReportOne(LckBoardBlackListDTO dto);

	@Select("select * from  lckReplyBlackList where replyIdx = #{replyIdx} and reportUser = #{reportUser} "
			+ " and reportedUser = #{reportedUser}")
	LckReplyBlackListDTO selectReplyReportOne(LckReplyBlackListDTO dto);

	@Insert("Insert into lckReplyBlackList (replyIdx,reportUser,reportedUser) values (#{replyIdx},#{reportUser},"
			+ "#{reportedUser})")
	int insertReplyReport(LckReplyBlackListDTO dto);

	

}
