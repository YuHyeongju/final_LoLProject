<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style>
   body{
		 background-color: #eeeeee;
		
		}
	.ranktitle {
	margin-top : 30px;
	margin-left: 70px;
	
	}
	
      table {
        width: 80%;
        border-collapse: collapse;
        color: #222831;
        margin: 30px auto;
       	
    }
    th, td {
       /* border: 1px solid black; */
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #00adb5;
    }
     td:nth-child(3) {
        margin-right: 40px; /* 승리 열과 패배 열 사이에 공간 추가 */
    }
    .Team {
    	padding-left: 30px;
    }
    .text-center {
        text-align: center;
    }
    .bold-large {
        font-weight: bold;
        font-size: larger;
        text-align: center;
    }
    .team-name {
    	display: flex;
    	align-items: center;
    	justify-content: flex-start;
        font-weight: bold;
        font-size: larger;
    }
    .win-data {
        font-weight: bold;
        font-size: larger;
        text-align: center;
        
    }
    .team-name span {
    display: inline-block;
    /* If direct manipulation of the span is needed */
    vertical-align: middle;
    color: #eeee831;
	}

	.team-name span:last-child {
    margin-top: -5px; /* Adjusts the team name slightly upwards */
    /* This adjustment moves the text, not the container */
	}
    /* 이미지와 텍스트 간격 조정 */
    .team-name img {
        margin-right: 10px; /* 로고 이미지와 팀 이름 사이의 간격 */
    }
    </style>

 
</head>
<body>
<h2 class="ranktitle">LCK Spring 2024 Team Rankings</h2>
<table>
    <thead>
        <tr>
            <th class="text-center">Rank</th>
	        <th class="Team">Team</th>
	        <th class="text-center">승</th>
	        <th class="text-center">패</th>
	        <th class="text-center">득실차</th>
	        <th class="text-center">승률</th>
	        <th class="text-center">KDA</th>
	        <th class="text-center">킬</th>
	        <th class="text-center">데스</th>
	        <th class="text-center">어시스트</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${teamRankings}" var="team">
            <tr>
                <td class="bold-large">${team.rank}</td>
                <td class="team-name"><a href="${cpath }/teamInfo/info/${team.team.name}"><span><img src="${team.team.imageUrl}" alt="Team Logo" style="width:100px;height:auto;"></span><span>${team.team.name}</span></a></td>
                <td class="win-data">${team.wins}</td>
                <td class="text-center">${team.loses}</td>
                <td class="text-center">${team.score}</td>
                <td class="text-center">${team.winRate}</td>
                <td class="text-center">${team.addInfo.kda}</td>
                <td class="text-center">${team.addInfo.kills}</td>
                <td class="text-center">${team.addInfo.deaths}</td>
                <td class="text-center">${team.addInfo.assists}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>