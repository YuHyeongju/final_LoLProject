package com.itbank.repository;


import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.LCKTeamInfoDTO;

@Repository
public interface LCKTeamInfoDAO {
	
	@Select("select * from lckTeamInfo where teamName = #{teamName}")
	List<LCKTeamInfoDTO> selectOne(String teamName);

	

	
}
