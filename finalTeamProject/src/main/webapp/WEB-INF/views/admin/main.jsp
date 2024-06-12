<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	section.mpmain{
		min-height: 600px;
		color: #eeeeee;
	}
	section.mpmain ul{
		display: flex;
		width: 100%;
		margin: auto;
		justify-content: space-around;
		color : #222831;
		font-size: 20px;
		border-bottom: 1px solid #222831;
	}
	ul > li{
		padding: 10px;
		color: #222831;
	}
	ul > li:hover{
		cursor: pointer;
		font-weight: bold;
	}
	div.menu1{
		width: 60%;
		margin: auto;
		text-align: center;
		color: #393e46;
	}
	form{
		color : #eeeeee;
		margin-top: 20px;
	}
	.match{
		border : 1px solid grey;
		height: 70px;
		width: 100%;
		display: flex;
		border-radius: 10px;
	}
	.matchLeft{
		border : 1px solid #222831;
		flex: 1;
		width : 100%;
		height : 100%;
		text-align: left;
		padding-left : 20px;
		align-self: center;
		border-bottom-left-radius: 10px;
		border-top-left-radius: 10px;
		font-size: 20px;
	}
	.matchRight{
		border : 1px solid #222831;
		flex: 1;
		width : 100%;
		height : 100%;
		text-align: right;
		padding-right : 20px;
		align-self: center;
		border-bottom-right-radius: 10px;
		border-top-right-radius: 10px;
		font-size: 20px;
	}
	.matchLeft:hover{
		background-image: url("${cpath}/resources/image/redTeamBG.jpg");
		background-size: cover;
    	background-repeat: no-repeat;
    	color: white;
	}
	.matchRight:hover{
		background-image: url("${cpath}/resources/image/blueTeamBG.jpg");
		background-size: cover;
    	background-repeat: no-repeat;
    	color: white;
	}

	.matching{
		border-radius: 10px;
		font-size: 10px;
		color: white;
		background-color: #e02020;
		text-align : center;
	}
	.matchInfo{
		text-align: left;
		color : #eeeeee;
	}
	.matchInfo span{
		color: #393e46;
	}
	
	.matching{
		width: 100px;
		height : 20px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.checked{
		border: 4px solid darkgrey;
		background-image: url("${cpath}/resources/image/redTeamBG.jpg");
		background-size: cover;
    	background-repeat: no-repeat;
    	color: white;
	}.hidden{
		display: none;
	}
	.checking{
		display: none;
	}
	.matchInfo{
		padding: 15px;
	}
	.alarm{
		background-color : white;
		position : fixed;
		bottom : 0;
		right : 0;
		width: 300px;
		height: 200px;
		border: 1px solid black;
		transition-duration : 2s;
	}
	section > .hidden:nth-child(1) {
		transition-duration : 2s;
		bottom : -100%;
		right : 0;
	}
	section{
		background-color: #eeeeee;
		color : #222831;
	}
	#crawlingForm > input{
		border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    	background-color: white;
	}
	div.menu2{
		text-align: center;
		padding: 20px;
	}
	button {
		border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    	background-color: white;
	}
	
</style>

<section class="mpmain">
	
	<ul>
		<li class="menuChecked" id="prediction">승부 예측</li>
		<li id="gameVideo">경기 영상</li>
	</ul>

	<div class="menu1 hidden">
		<form id="crawlingForm" action="${cpath }/admin/crawling">
			<select name="date">
				<option>2023-08</option>
				<option>2024-01</option>
				<option>2024-02</option>
				<option>2024-03</option>
				<option>2024-04</option>
			</select>
			<input type="submit" value="경기 정보 업데이트 및 응모권 배분">
		</form>
<c:forEach var="game" items="${games }">
	<c:if test="${game.status == 1}">
		<div class="matchInfo">
		<div id="gameIdx" class="hidden">${game.idx }</div>
			<span style="display: flex;">${game.gameDate }&nbsp;${game.gameTime }&nbsp;${game.title }
			<div class="matching">
				<c:if test="${game.status == 1 }">예측 마감</c:if>
			</div></span> <br>
			<div class="match">
				<div class="matchLeft checked">
					${game.redTeam }<br>
					<div class="checking">
						<c:forEach var="pre" items="${predictions }">
							<c:if test="${pre.gameIdx == game.idx  && pre.bettingTeam == 0}">checked</c:if>					
						</c:forEach>
					</div>
						${game.redPer }%
				</div> 
				<div class="matchRight checked">
					${game.blueTeam }<br>
					<div class="checking">
						<c:forEach var="pre" items="${predictions }">
							<c:if test="${pre.gameIdx == game.idx  && pre.bettingTeam == 1}">checked</c:if>					
						</c:forEach>
					</div>
						${game.bluePer }%
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
</div>
<div class="menu2 hidden">
	<a href="${cpath }/lckVideoCrawling"><button>경기 영상 크롤링</button></a>
</div>
</section>

<script>
	const matchs = document.querySelectorAll('.matchInfo')
	const redTeams = document.querySelectorAll('.matchLeft')
	const blueTeams = document.querySelectorAll('.matchRight')
	const prediction = document.getElementById('prediction')
	const menu1 = document.querySelector('.menu1')
	const menu2 = document.querySelector('.menu2')
	const lis = document.querySelectorAll('.mpmain ul > li')
	
	
// 	redTeams.forEach(redTeam =>{
// 		if(redTeam.querySelector('.checking').innerText == 'checked'){
// 			redTeam.classList.add('checked')
// 			redTeam.querySelector('.checking').classList.add('hidden')
// 		}
// 	})
// 	blueTeams.forEach(blueTeam =>{
// 		if(blueTeam.querySelector('.checking').innerText == 'checked'){
// 			blueTeam.classList.add('checked')
// 			blueTeam.querySelector('.checking').classList.add('hidden')
// 		}
// 	})
	
	lis.forEach(li => {
		li.onclick = function(e){	
			switch(li.innerText){
				case '승부 예측' : 
					document.querySelector('.menu1').classList.remove('hidden')
					document.querySelector('.menu2').classList.add('hidden')
					break;
				case '경기 영상' : 
					document.querySelector('.menu1').classList.add('hidden')
					document.querySelector('.menu2').classList.remove('hidden')
					break;
			}
		}
	})
</script>
</body>
</html>