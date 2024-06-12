package com.itbank.controller;

import java.util.List;

import com.itbank.model.TeamRankingDTO;

public class LCKResponse {
	
	 private Data data; // 'data' 객체

	    // getter와 setter
	    public Data getData() {
	        return data;
	    }

	    public void setData(Data data) {
	        this.data = data;
	    }

	    // Data 내부 클래스
	    public static class Data {
	        private List<TeamRankingDTO> rankings; // 실제 랭킹 리스트

	        public List<TeamRankingDTO> getRankings() {
	            return rankings;
	        }

	        public void setRankings(List<TeamRankingDTO> rankings) {
	            this.rankings = rankings;
	        }
	    }
}
