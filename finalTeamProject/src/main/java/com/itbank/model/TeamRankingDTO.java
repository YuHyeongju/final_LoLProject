package com.itbank.model;

public class TeamRankingDTO {
	
	 private int rank;
	    private int wins;
	    private int loses;
	    private int score;
	    private double winRate;
	    private AddInfo addInfo;
	    private Team team;

	    // 내부 클래스로 AddInfo와 Team 정의
	    public static class AddInfo {
	        private double kda;
	        private int kills;
	        private int deaths;
	        private int assists;
			public double getKda() {
				return kda;
			}
			public void setKda(double kda) {
				this.kda = kda;
			}
			public int getKills() {
				return kills;
			}
			public void setKills(int kills) {
				this.kills = kills;
			}
			public int getDeaths() {
				return deaths;
			}
			public void setDeaths(int deaths) {
				this.deaths = deaths;
			}
			public int getAssists() {
				return assists;
			}
			public void setAssists(int assists) {
				this.assists = assists;
			}

	        // Getters and Setters
	        
	    }

	    public static class Team {
	        private String teamId;
	        private String name;
	        private String imageUrl;
			public String getTeamId() {
				return teamId;
			}
			public void setTeamId(String teamId) {
				this.teamId = teamId;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getImageUrl() {
				return imageUrl;
			}
			public void setImageUrl(String imageUrl) {
				this.imageUrl = imageUrl;
			}

	        // Getters and Setters
	        
	        
	    }

		public int getRank() {
			return rank;
		}

		public void setRank(int rank) {
			this.rank = rank;
		}

		public int getWins() {
			return wins;
		}

		public void setWins(int wins) {
			this.wins = wins;
		}

		public int getLoses() {
			return loses;
		}

		public void setLoses(int loses) {
			this.loses = loses;
		}

		public int getScore() {
			return score;
		}

		public void setScore(int score) {
			this.score = score;
		}

		public double getWinRate() {
			return winRate;
		}

		public void setWinRate(double winRate) {
			this.winRate = winRate;
		}

		public AddInfo getAddInfo() {
			return addInfo;
		}

		public void setAddInfo(AddInfo addInfo) {
			this.addInfo = addInfo;
		}

		public Team getTeam() {
			return team;
		}

		public void setTeam(Team team) {
			this.team = team;
		}
	
	

    
}
