package com.itbank.service;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.itbank.model.TeamRankingDTO;
import com.itbank.model.TeamRankingsResponse;

import java.util.Collections;
import java.util.List;

@Service
public class LCKTeamRecordService {

	public List<TeamRankingDTO> getTeamRankings() {
		
		        String url = "https://esports-api.game.naver.com/service/v1/ranking/lck_2024_spring/team";
		        
		        RestTemplate restTemplate = new RestTemplate();
		        TeamRankingsResponse response = restTemplate.getForObject(url, TeamRankingsResponse.class);
		        
		        // 'getData()' 대신 'getContent()'를 호출
		        return response != null ? response.getContent() : Collections.emptyList();
		    }

}
