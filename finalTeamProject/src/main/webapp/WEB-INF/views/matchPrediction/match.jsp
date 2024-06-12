<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	div.mpmain{
		min-height: 600px;
	}
	div.inner{
		width: 60%;
		margin: auto;
		text-align: center;
		
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
		padding : 5px;
		align-self: center;
		border-bottom-left-radius: 10px;
		border-top-left-radius: 10px;
		font-size: 20px;
		background-color: #eeeeee;
		color: #393e46;
		padding-left: 20px;
	}
	.matchRight{
		border : 1px solid #222831;
		flex: 1;
		width : 100%;
		height : 100%;
		text-align: right;
		padding : 5px;
		align-self: center;
		border-bottom-right-radius: 10px;
		border-top-right-radius: 10px;
		font-size: 20px;
		background-color: #eeeeee;
		color: #393e46;
		padding-right: 20px;
	}
	.matchLeft:hover{
		background-image: url("${cpath}/resources/image/redTeamBG.jpg");
		background-size: cover;
    	background-repeat: no-repeat;
    	color: white;
    	cursor: pointer;
	}
	.matchRight:hover{
		background-image: url("${cpath}/resources/image/blueTeamBG.jpg");
		background-size: cover;
    	background-repeat: no-repeat;
    	color: white;
    	cursor: pointer;
	}
	.verus{
		font-weight: bold;
		display : flex;
		align-items: center;
	}
	.matching{
		border-radius: 10px;
		font-size: 10px;
		color: #222831;
		background-color: #e02020;
		text-align : center;
		margin-top: 10px;
	}
	.matchInfo{
		text-align: left;
	}
	.matchInfo span{
		color: #eeeeee;
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
	.matchInfo{
		padding: 15px;
		color : #222831;
	}
	.alarm{
		background-color : #eeeeee;
		position : fixed;
		bottom : 0;
		right : 0;
		width: 300px;
		height: 200px;
		border: 1px solid black;
		transition-duration : 2s;
		padding: 10px;
		text-align: center;
		border-radius: 15px;
	}
	#closeBtn:hover{
		cursor: pointer;
	}
	div.alarm  button{
		border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    	background-color: white;
	}
	#closeBtn{
		all : unset;
    	color: #393e46;
    	font-weight: bold;
    	position: absolute;
    	top: 1px;
    	right: 7px;
	}
	div.alarmBottom{
		margin-top: 15%;
		text-align: center;
		position: relative;
	}
	div.message{
		margin-top: 50px;
	}
	div.pointMessage {
		padding-top : 10px;
	}
	div.mpmain > .hidden:nth-child(1) {
		transition-duration : 2s;
		bottom : -100%;
		right : 0;
	}
	section{
		background-color: #eeeeee;
		color : #222831;
	}
	div.mpmain{
		background-color: #393e46;
		width: 80%;
		margin: auto;
		border-radius: 20px;
		margin-top: 20px;
	}
	.percent{
		font-size: 16px;
	}
	#denyNotice{
		all: unset;
		font-size: 13px;
		position: absolute;
		right: 3px;
	}
	#denyNotice:hover{
		cursor: pointer;
		font-weight: bold;
	}
	#title{
		color: #eeeeee;
		font-size: 30px;
		text-align: center;
		font-weight: bold;
		padding: 10px;
	}
	
</style>

<section>
<div class="mpmain">
<div class="alarm hidden">
	<div class="message"></div>
	<div class="pointMessage"></div>
	<div class="alarmBottom">
		<a href="${cpath }/goods/search"><button id="joinContest">교환하러 가기</button></a><br>
		<button id="denyNotice">하루동안 보지않기</button>
	</div>
		<button id="closeBtn">x</button>
</div>
<div class="inner">
<div id="title">승부예측</div>
<c:forEach var="game" items="${games }">
	<c:if test="${(game.status == 1 || game.status == 2) && game.redTeam != 'TBD' }">
		<div class="matchInfo">
		<div id="gameIdx" class="hidden">${game.idx }</div>
			<span style="display: flex;">${game.gameDate }&nbsp;${game.gameTime }&nbsp;&nbsp;&nbsp;${game.title }</span>
			<div class="matching">
				<c:if test="${game.status == 1 }">예측 마감</c:if>
				<c:if test="${game.status == 2 }">예측 진행중</c:if>
			</div> <br>
			<div class="match">
				<div class="matchLeft">
					${game.redTeam }<br>
					<div class="checking">
						<c:forEach var="pre" items="${predictions }">
							<c:if test="${pre.gameIdx == game.idx  && pre.bettingTeam == 0}">checked</c:if>					
						</c:forEach>
					</div>
						<span class="percent">${game.redPer }%</span>
				</div> 
				<div class="matchRight">
					${game.blueTeam }<br>
					<div class="checking">
						<c:forEach var="pre" items="${predictions }">
							<c:if test="${pre.gameIdx == game.idx  && pre.bettingTeam == 1}">checked</c:if>					
						</c:forEach>
					</div>
						<span class="percent">${game.bluePer }%</span>
				</div>
			</div>
		</div>
	</c:if>
</c:forEach>
</div>
</div>
</section>

<script>
// 	async function predictionHandler(){
// 		const url = '${cpath}/ajax/interval'
// 		const ob = {date : new Date()}
// 		const opt = {
// 			method: 'POST', 
// 			body: JSON.stringify(ob),
// 			headers: {'Content-Type' : 'application/json; charset=utf-8'}
// 		}
// 		const result = await fetch(url,opt).then(resp => resp.text())
// 		console.log(result)
// 	}
// 	setInterval(predictionHandler, 5000)
	const matchs = document.querySelectorAll('.matchInfo')
	const cpath = '${cpath}'
	const userid = '${login.userid}'
	const closeBtn = document.getElementById('closeBtn')
	const matchings = document.querySelectorAll('.matching')
	const denyNotice = document.getElementById('denyNotice')
	const redTeams = document.querySelectorAll('.matchLeft')
	const blueTeams = document.querySelectorAll('.matchRight')
	
	
	// 하루동안 알림 거절하는 기능
	async function denyNoticeHandler(){
		const url = cpath + '/ajax/denyNotice'
		const ob = {
			userid : userid
		}
		const opt = {  
			method: 'POST', 
			body: JSON.stringify(ob),
			headers: {'Content-Type' : 'application/json; charset=utf-8'}
		}
		const result = await fetch(url,opt).then(resp => resp.text())
		if(result == 1){
			document.querySelector('.alarm').classList.add('hidden')
		}
	}
	denyNotice.addEventListener('click',denyNoticeHandler)
	
	// 알림창 닫기
	const closeHandler = function(){
		document.querySelector('.alarm').classList.add('hidden')
		console.log(1)
	}
	closeBtn.addEventListener('click',closeHandler)
	
	// 알림창 띄우기
	if(${login.ticket} > 0 && ${login.denyNotice} == 0){
		document.querySelector('.alarm').classList.remove('hidden')
		document.querySelector('.alarm > .message').innerText = '교환 티켓이 '+ ${login.ticket}+'개 있습니다.'
		document.querySelector('.alarm > .pointMessage').innerText = '포인트가 '+ ${login.point}+'p 있습니다.'
	}
	// 선택된 레드팀 스타일 주기
 	redTeams.forEach(redTeam =>{
		if(redTeam.querySelector('.checking').innerText == 'checked'){
			redTeam.classList.add('checked')
			redTeam.querySelector('.checking').classList.add('hidden')
		}
	})
	// 선택된 블루팀 스타일 주기
	blueTeams.forEach(blueTeam =>{
		if(blueTeam.querySelector('.checking').innerText == 'checked'){
			blueTeam.classList.add('checked')
			blueTeam.querySelector('.checking').classList.add('hidden')
		}
	})

	// 승부 예측하기 기능
	matchs.forEach(match => {
		if(match.querySelector('.matching').innerText == '예측 마감'){
			match.querySelector('.matching').style.cssText = "background-color : #eee; color : black;"
			match.style.cssText = "opacity : 0.1;"
				match.querySelector('.matchRight').style.cssText = 'background-image: url("${cpath}/resources/image/blueTeamBG.jpg");background-size: cover;background-repeat: no-repeat;color: white;cursor: pointer;'
				match.querySelector('.matchLeft').style.cssText = 'background-image: url("${cpath}/resources/image/redTeamBG.jpg"); background-size: cover; background-repeat: no-repeat;color: white;cursor: pointer;'
		}
		// redTeam을 선택했을 경우
		match.querySelector('.matchLeft').onclick = async function leftClickHandler(e){
			if(match.querySelector('.matching').innerText == '예측 마감')return
			match.querySelector('.matchLeft').classList.add('checked') 
			match.querySelector('.matchRight').classList.remove('checked')
			const url = cpath + '/ajax/matchPrediction'
			const ob = {
				bettingTeam : 0,
				gameIdx : match.querySelector('.hidden').innerText,
				userid : userid
			}
			const opt = {  
				method: 'POST', 
				body: JSON.stringify(ob),
				headers: {'Content-Type' : 'application/json; charset=utf-8'}
			}
			const result = await fetch(url,opt).then(resp => resp.text())
			if(result == 1){
				location.reload()
			}
		}// end of leftClickHandler
			// blueTeam을 선택했을 경우		
			match.querySelector('.matchRight').onclick = async function rightClickHandler(e){
				if(match.querySelector('.matching').innerText == '예측 마감')return
				match.querySelector('.matchRight').classList.add('checked') 
				match.querySelector('.matchLeft').classList.remove('checked')
				// match.querySelector('.match').classList.add('checked')
				const url = cpath + '/ajax/matchPrediction'
				const ob = {
					bettingTeam : 1,
					gameIdx : match.querySelector('.hidden').innerText,
					userid : userid
				}
				const opt = { 
					method: 'POST', 
					body: JSON.stringify(ob),
					headers: {'Content-Type' : 'application/json; charset=utf-8'}
				}
				const result = await fetch(url,opt).then(resp => resp.text())
				if(result == 1){
					location.reload()
				}
			}// end of rightClickHandler
	}) 
</script>


</body>
</html>