<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>

<style>
header {
	margin: 0;
	top: 0;
	left: 0;
}

ul, li {
	list-style: none;
	margin: 0;
}

a {
	color: black;
	text-decoration: none;
}

.flex {
	display: flex;
}

.header_nav {
	width: 100%;
	background-color: #151618;
	margin: 0 auto;
}

.inner_con {
	max-width: 1400px;
	margin: 0 auto;
}

.sub_menu {
	display: flex;
	width: auto;
	flex-wrap: wrap;
	justify-content: space-between;
	padding: 0 50px;
}

.sub_menu_li {
	display: inline-block;
	color: white;
	font-size: 16px;
	padding: 15px 0;
	text-align: center;
}

.sub_menu_li>a {
	color: white;
}

.sub_nav {
	padding: 0;
	margin: 0;
}

.gnb_dep {
	position: absolute;
	top: 50px;
	left: 50%;
	margin-left: -75px;
	width: 150px;
	overflow: hidden;
	transition: all 0.5s;
	padding: 25px 0;
	height: 0;
	opacity: 0;
	background: #000;
}

.header_main_nav {
	background-color: #151618;
	display: flex;
	color: white;
	align-items: center;
}

.header_top_logo {
	padding: 5px;
	border-radius: 50%;
	overflow: hidden;
}

.header_top_main {
	color: white;
	align-items: center;
	text-align: center;
	margin: auto;
}

.header_profile {
	display: flex;
	margin: auto;
	justify-content: flex-end;
	padding: 5px;
	align-items: center;
}

.header_profile_img {
	border-radius: 50%;
	padding: 5px;
}
/*     헤더 */
body {
	padding: 0;
	margin: 0;
	background-color: #222831;
}

.hidden {
	display: none;
}

.overlay {
	z-index: 2;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.box {
	width: 400px;
	height: 500px;
	background-color: white;
	border-radius: 10px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 3;
}

div.box_top {
	display: flex;
	text-align: center;
}

div.box_top>span {
	flex: 9;
	padding: 10px;
	border-bottom: 1px solid #eeeeee;
	margin-left: 30px;
}

div.box_top>button {
	all: unset;
	flex: 1;
	font-weight: bold;
	border-bottom: 1px solid #eeeeee;
	cursor: pointer;
}

#preview {
	box-sizing: border-box;
	bottom: 0;
	width: 150px;
	height: 150px;
	background-image: url("${cpath }/upload/${login.profile}");
	background-position: center center;
	background-repeat: no-repeat;
	background-size: auto 100%;
	margin-top: 20px;
	overflow: hidden;
	border-radius: 50%;
	margin-left: 130px;
}

input[type="file"] {
	display: none;
}

.custom-file-upload {
	border: 1px solid #00adb5;
	height: 20px;
	width: 50px;
	border-radius: 10px;
	padding: 5px;
	font-size: 13px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	cursor: pointer;
	margin-top: 20px;
	margin-left: 30px;
}

.fileArea {
	display: flex;
}

#leftArea>ul {
	padding: 0;
}

#leftArea>ul>li {
	font-size: 18 px;
	padding: 10px;
	text-align: center;
}

#leftArea>ul>li:hover {
	background-color: #222831;
	color: #eeeeee;
	border: 1px solid #eeeeee;
	border-radius: 5px;
	cursor: pointer;
}

ul>.checked {
	background-color: #222831;
	color: #eeeeee;
	border: 1px solid #eeeeee;
	border-radius: 5px;
	cursor: pointer;
}

section#main {
	width: 100%;
	height: 100%;
}

div#root {
	padding: 10px;
	width: 90%;
	margin: auto;
	display: flex;
}

div#leftArea {
	flex: 1;
	border-radius: 5px;
	background-color: #eeeeee;
	color: #393e46;
	font-weight: bold;
	margin-right: 10px;
}

div#rightArea {
	flex: 5;
	border-radius: 5px;
	/* 		background-color: #eeeeee; */
	color: #393e46;
}

div.category {
	font-size: 30px;
	color: #eeeeee;
}

div#nickNameArea {
	margin-top: 30px;
	border-radius: 5px;
	background-color: #eeeeee;
	color: #393e46;
	font-weight: bold;
	display: flex;
}

div.nickName {
	font-size: 30px;
	display: flex;
	align-items: center;
	margin-left: 40px;
	width: 650px;
}

#myPageImg {
	margin: 30px;
	width: 150px;
	height: 150px;
	border-radius: 50%;
}

#modifyBtnArea {
	display: flex;
	align-items: center;
}

#modifyBtn {
	all: unset;
	border: 1px solid #00adb5;
	height: 20px;
	border-radius: 10px;
	padding: 5px;
	font-weight: 600;
	display: flex;
	align-items: center;
}

#modifyBtn:hover {
	background-color: white;
}

#userInfoArea {
	border-radius: 5px;
	background-color: #eeeeee;
	color: #393e46;
	margin-top: 10px;
}

div.userInfo {
	display: flex;
	padding: 20px;
	margin-left: 30px;
}

div.column {
	font-size: 20px;
	font-weight: bold;
	width: 200px;
}

#modifyFormSubmit {
	display: flex;
	justify-content: center;
}

#modifyFormSubmit>input[type="submit"] {
	all: unset;
	border: 1px solid #00adb5;
	font-size: 13px;
	height: 20px;
	border-radius: 10px;
	padding: 5px;
	font-weight: 600;
	display: flex;
	align-items: center;
	cursor: pointer;
}

#modifyForm>p {
	display: flex;
	justify-content: center;
}

#modifyForm  input[name="nickName"] {
	width: 250px;
	height: 40px;
	border: 1px solid #393e46;
	border-radius: 5px;
	margin-top: 50px;
	margin-bottom: 50px;
}

#myProductArea {
	background-color: #eeeeee;
	min-height: 700px;
	border-radius: 5px;
	margin-top: 30px;
	display: flex;
	flex-flow: wrap;
	justify-content: center;
}

div.nullMessage {
	font-size: 30px;
	text-align: center;
}

#myBoardArea {
	background-color: #eeeeee;
	min-height: 700px;
	border-radius: 5px;
	margin-top: 30px;
}

#myReplyArea {
	background-color: #eeeeee;
	min-height: 700px;
	border-radius: 5px;
	margin-top: 30px;
}

#myTicketingArea {
	background-color: #eeeeee;
	min-height: 700px;
	border-radius: 5px;
	margin-top: 30px;
	padding: 20px;
}

div.ticket {
	width: 80%;
	border: 1px solid #00adb5;
	height: 100px;
	margin: auto;
	border-radius: 10px;
	display: flex;
	justify-content: space-between;
	padding: 15px;
	align-items: center;
	margin-top: 20px;
}

div.t_date {
	font-size: 30px;
	font-weight: bold;
}

div.t_time {
	font-size: 30px;
}

div.t_home_title {
	font-size: 10px;
}

button.ticketCancel {
	border: 1px solid #00adb5;
	font-size: 13px;
	height: 20px;
	border-radius: 10px;
	padding: 15px;
	font-weight: 600;
	display: flex;
	align-items: center;
	cursor: pointer;
}
div.gameIdx{
	border-right: 1px solid #393e46;
	height: 100%;
	display : flex;
	align-items: center;
	padding-right: 10px;
}

div.productBox {
	width: 20%;
	max-height: 230px;
	margin: 20px;
	border-radius: 10px;
	border: 2px solid #00adb5;
}

div.textbox {
	text-align: center;
	font-weight: bold;
	padding: 10px;
}

div.imgbox>img {
	width: 100%;
	max-height: 100px;
}

div.productCount {
	text-align: center;
	padding: 10px;
}

#ticketingBtn {
	border: 1px solid #00adb5;
	font-size: 13px;
	height: 20px;
	border-radius: 10px;
	padding: 15px;
	font-weight: 600;
	display: flex;
	align-items: center;
	cursor: pointer;
}

div.isTicket {
	display: flex;
	justify-content: center;
}
</style>
<body>
	<header>
		<div class="header_main_nav">
			<a href="${cpath }/
            " style="width: 180px;"> <img
				src="
                            ${cpath }/resources/image/projectLogo.jpg
                        "
				width="40px" class="header_top_logo">
			</a>
			<div class="header_top_main flex">
				<span style="font-weight: bold;">League of Legends Champions
					Korea</span>
			</div>
			<div style="width: 280px; padding: 5px;">
				<div class="header_profile">
					${login.userid }님
					<%--                 	<c:if test="${not empty login }"><a href="${cpath }/member/logout"><button>로그아웃</button></a></c:if> --%>
					<c:if test="${not empty login }">
						<a style="display: flex; color: white;"
							href="${cpath }/member/myPage"> <img
							src="
	                    			${cpath }/upload/${login.profile }
	                            "
							height="40px" width="40px" class="header_profile_img">
						</a>
					</c:if>
					<c:if test="${empty login }">
						<a style="display: flex; color: white;"
							href="${cpath }/member/login"> <img
							src="
	                    			 https://www.studiopeople.kr/common/img/default_profile.png
	                            "
							height="40px" width="40px" class="header_profile_img">
						</a>
					</c:if>
					<div class="header_hambuger">
						<img
							src="
                                https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaqp21hEdWBoLlJkP18uFqogFJSYzWZn6nTg&usqp=CAU
                            "
							class="header_profile_img" height="40px">
					</div>
				</div>
			</div>
		</div>
		<nav class="header_nav">
			<div class="inner_con">
				<ul class="sub_menu">
					<li class="sub_menu_li"><a href="${cpath }/">홈</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>Hm_1</li>
								<li>Hm_2</li>
								<li>Hm_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a href="${cpath }/community/list">커뮤니티</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>Cu_1</li>
								<li>Cu_2</li>
								<li>Cu_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a href="${cpath }/goods/search">굿즈
							응모</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>Cu_1</li>
								<li>Cu_2</li>
								<li>Cu_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a
						href="${cpath }/ticketing/ticketinglist">예매</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>Cu_1</li>
								<li>Cu_2</li>
								<li>Cu_3</li>
							</ul>
						</div></li>

					<li class="sub_menu_li"><a href="${cpath }/game/list">일정</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>ck_1</li>
								<li>ck_2</li>
								<li>ck_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a href="${cpath }/lckVideo">영상</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>vi_1</li>
								<li>vi_2</li>
								<li>vi_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a href="${cpath }/teamRanking">순위</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>rn_1</li>
								<li>rn_2</li>
								<li>rn_3</li>
							</ul>
						</div></li>
					<li class="sub_menu_li"><a href="${cpath }/matchPrediction">승부예측</a>
						<div class="gnb_dep">
							<ul class="sub_nav">
								<li>wn_1</li>
								<li>wn_2</li>
								<li>wn_3</li>
							</ul>
						</div></li>
					 <c:if test="${login.grade == 5 }">
                    
                    <li class="sub_menu_li">
                        <a href="${cpath }/admin">관리자 페이지</a>
                    </li>
                    </c:if>
				</ul>
			</div>
		</nav>

	</header>
	<section id="main">
		<div id="root">
			<div id="leftArea">
				<ul>
					<li class="checked">내 프로필</li>
					<li>내 상품함</li>
					<li>예매 내역</li>
					<li><a href="${cpath }/member/logout">로그아웃</a></li>
				</ul>
			</div>
			<div id="rightArea">
				<div id="myProfile" class="menu hidden">
					<div class="modal hidden">
						<div class="box">
							<div class="box_top">
								<span>프로필 편집</span>
								<button id="close">x</button>
							</div>
							<form id="modifyForm" method="POST" enctype="multipart/form-data">
								<div class="fileArea">
									<div id="preview"></div>
									<label for="file-upload" class="custom-file-upload">변경</label>
									<input id="file-upload" type="file" name="upload"
										accept="image/*">
								</div>
								<p>
									<input type="text" name="nickName" placeholder="닉네임" required
										autocomplete="off">
								</p>
								<input type="hidden" name="userid" value="${login.userid }">
								<div id="modifyFormSubmit">
									<input type="submit" value="수정하기">
								</div>

							</form>
						</div>
						<div class="overlay"></div>
					</div>
					<div class="category">내 프로필</div>
					<div id="nickNameArea">
						<img id="myPageImg" src="${cpath }/upload/${login.profile}">
						<div class="nickName">${login.nickName }</div>
						<div id="modifyBtnArea">
							<button id="modifyBtn">프로필 편집</button>
						</div>
					</div>
					<div id="userInfoArea">
						<div class="userInfo">
							<div class="column">회원 등급</div>
							<div id="grade">${login.grade }</div>
						</div>
						<div class="userInfo">
							<div class="column">이메일</div>
							<div>${login.email }</div>
						</div>
						<div class="userInfo">
							<div class="column">응원팀</div>
							<div>${login.favoriteTeam }</div>
						</div>
						<div class="userInfo">
							<div class="column">주 포지션</div>
							<div>${login.mainPosition }</div>
							<c:if
								test="${empty login.mainPosition || login.mainPosition == '주 포지션' }">미정</c:if>
						</div>
						<div class="userInfo">
							<div class="column">부 포지션</div>
							<div>${login.subPosition }</div>
							<c:if
								test="${empty login.subPosition || login.mainPosition == '부 포지션'  }">미정</c:if>
						</div>
						<div class="userInfo">
							<div class="column">출석 포인트</div>
							<div>${login.point }p</div>
						</div>
						<div class="userInfo">
							<div class="column">응모권</div>
							<div>
								<a href="${cpath }/goods/search">${login.ticket }개</a>
							</div>
						</div>

					</div>
				</div>

				<div id="myProduct" class="menu hidden">
					<div class="category">내 상품함</div>
					<div class="productList">

						<div id="myProductArea">
							<c:if test="${empty productList }">
								<div class="nullMessage">상품이 없습니다</div>
							</c:if>
							<c:forEach var="goods" items="${productList }">
								<div class="productBox">
									<div class="textbox">${goods.goodsName }</div>
									<div class="imgbox">
										<img src="${cpath }/upload/${goods.goodsImage}">
									</div>
									<div class="productCount">보유 개수 : ${goods.count }</div>
									<c:if test="${goods.goodsName == '경기 관람권(1인)' }">
										<div class="isTicket">
											<a href="${cpath }/ticketing/ticketinglist"><button
													id="ticketingBtn">예매하기</button></a>
										</div>
									</c:if>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div id="myBoard" class="menu hidden">
					<div class="category">내 게시물</div>
					<c:if test="${empty list }">
						<div id="myBoardArea">
							<div class="nullMessage">작성한 게시글이 없습니다</div>

						</div>
					</c:if>
				</div>
				<div id="myReply" class="menu hidden">
					<div class="category">내 댓글</div>
					<c:if test="${empty list }">
						<div id="myReplyArea">
							<div class="nullMessage">작성한 댓글이 없습니다</div>

						</div>
					</c:if>
				</div>
				<div id="myTicketing" class="menu hidden">
					<div class="category">예매 내역</div>
					<div id="myTicketingArea">
						<c:if test="${empty ticketingList }">
							<div class="nullMessage">예매 내역이 없습니다</div>
						</c:if>
						<c:forEach var="info" items="${ticketingList }">
							<div class="list">
								<div class="ticket" idx="${info.idx }">
									<div class="t_date flex font-sokcho">
										<div class="t_month">
											<fmt:formatDate value="${info.gameDate}" pattern="MM" />
										</div>
										.
										<div class="t_day">
											<fmt:formatDate value="${info.gameDate}" pattern="dd" />
										</div>
										<div class="t_week">
											(
											<fmt:formatDate value="${info.gameDate}" pattern="EE" />
											)
										</div>
									</div>
									<div class="v-line"></div>
									<div class="t_time font-sokcho">${info.gameTime}</div>
									<div class="v-line"></div>
									<div class="t_title">
										2024 LCK ${info.title } (
										<fmt:formatDate value="${info.gameDate}" pattern="MM" />
										.
										<fmt:formatDate value="${info.gameDate}" pattern="dd" />
										) - ${info.title.substring(info.title.length() - 3)}
									</div>
									<div class="v-line"></div>
									<div class="t_home">
										<div class="t_home_title">홈</div>
										<div class="t_home_location">${info.stadium }</div>
									</div>
									<div class="seat">${info.seat }석</div>
									<c:if test="${info.deleted == 0 }">
										<button class="ticketCancel">취소하기</button>
									</c:if>
									<c:if test="${info.deleted == 1 }">
										<div class="ticketCancel"></div>
										예매 취소됨
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>

		</div>
	</section>
	<script>

	const inputImg = document.querySelector('input[name="upload"]')
	const preview = document.getElementById('preview')
	const modifyBtn = document.getElementById('modifyBtn')
	const modal1 = document.querySelector('.modal')
	const close = document.getElementById('close')
	const modifyFormSubmit = document.getElementById('modifyFormSubmit')
	const modifyForm = document.getElementById('modifyForm')
	const cpath = '${cpath}'
	const grade = document.getElementById('grade')
	const checked = document.querySelector('.checked')
	const tickets = document.querySelectorAll('.ticket')
	
	
	switch(grade.innerText){
		case '0' : grade.innerText = '브론즈'
			break;
		case '1' : grade.innerText = '실버'
			break;
		case '2' : grade.innerText = '골드'
			break;
		case '3' : grade.innerText = '플레티넘'
			break;
		case '4' : grade.innerText = '다이아'
			break;
		case '5' : grade.innerText = '챌린저'
			break;
	}
	switch(checked.innerText){
		case '내 프로필' :
			document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
			document.getElementById('myProfile').classList.remove('hidden')
			break;
		case '내 상품함' :
			document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
			document.getElementById('myProduct').classList.remove('hidden')
			break;
		case '예매 내역' :
			document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
			document.getElementById('myTicketing').classList.remove('hidden')
			break;
	}
	
	// 이미지 미리보기
	function changeHandler(event) {
	    // event.target 은 파일을 첨부하는 input 요소이다
	    // preview는 미리보기 그림을 보여줄 div 요소이다
	    const preview = document.getElementById('preview')
	    if(event.target.files && event.target.files[0]) {
	        preview.style.height = '150px'
	        preview.style.width = '150px'
	        const reader = new FileReader()
	        reader.onload = (e) => {
	            preview.style.backgroundImage = 'url(\'' + e.target.result + '\')'
	        }
	        reader.readAsDataURL(event.target.files[0])
	    }
	    else {
	        preview.style.backgroundImage = ''
	    }
	}
	
	inputImg.addEventListener('change', changeHandler)
	preview.addEventListener('dragover', () => {
	preview.style.height = 0
	preview.style.border = 0
	})
	// 모달 창 띄우기
	modifyBtn.onclick = function(){
		modal1.classList.remove('hidden')
	}
	close.onclick = function(){
		modal1.classList.add('hidden')
	}
	
	// 프로필 수정 
	async function modifyFormSubmitHandler(event){
		event.preventDefault()
		const url = cpath + '/ajax/modifyProfile'
		const formData = new FormData(event.target)
		const opt = {
			method: 'POST',
			body: formData,
		}
		const result = await fetch(url,opt).then(resp => resp.text())
		if(result == 1){
			 location.reload()
		}
		else{
			alert('두 글자 이상 입력해주세요')
		}
	}
	modifyForm.onsubmit = modifyFormSubmitHandler
	
	const lis = document.querySelectorAll('ul > li')
	lis.forEach(li => {
		li.onclick = function (){
			lis.forEach(e => e.classList.remove('checked'))
			li.classList.add('checked')
			switch(li.innerText){
				case '내 프로필' :
					document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
					document.getElementById('myProfile').classList.remove('hidden')
					break;
				case '내 상품함' :
					document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
					document.getElementById('myProduct').classList.remove('hidden')
					break;
				case '작성한 글' :
					document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
					document.getElementById('myBoard').classList.remove('hidden')
					break;
				case '작성한 댓글' :
					document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
					document.getElementById('myReply').classList.remove('hidden')
					break;
				case '예매 내역' :
					document.querySelectorAll('.menu').forEach(e => e.classList.add('hidden'))
					document.getElementById('myTicketing').classList.remove('hidden')
					break;
			}
		}
	})
	
	
	tickets.forEach(ticket => {
		ticket.querySelector('.ticketCancel').onclick = async function(){
			const idx = ticket.getAttribute('idx')
			const url = '${cpath}/ajax/ticketCancel'
			const ob = {
					idx : idx,
			}
			const opt = {
					method: 'POST',
					body: JSON.stringify(ob),
					headers: {'Content-Type' : 'application/json; charset=utf-8'}
			}
			const result = await fetch(url,opt).then(resp => resp.text())
			if(result == 1){
				alert('예매 취소되었습니다')
				location.reload()
			}
		}
	})
	
</script>
</body>
</html>