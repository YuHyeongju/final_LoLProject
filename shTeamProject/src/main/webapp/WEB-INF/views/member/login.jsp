<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
	body{
		background-color: #eeeeee;
		display: flex;
		justify-content : center;
		align-items : center;
	}
	div.login{
		position : relative;
		position : fixed;
		top : 10%;
		width: 1380px;
		display: flex;
		height: 543px;
	}
	#loginForm{
		text-align: center;
	}
	div.login span{
		color: black;
		font-size: 30px;
		font-weight: bold;
	}
	#content{
		color: red;
		font-size: 13px;
	}
	div.login_left{
		flex : 3;
		background-color: white;
		color: #eee;
	}
	div.login_logo{
		text-align: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	div.login_logo > img{
		width: 50px;
		height: 50px;
	}
	div.login input[type="text"],
	div.login input[type="password"]{
		width: 260px;
		height: 35px;
		border-radius: 5px;
	}
	#login{
		all : unset;
		color: #393e46;
		
	}
	#login:hover{
		font-weight: bold;
		cursor: pointer;
	}
	#pLogin{
		margin-bottom: 150px;
	}
	input[type="button"]{
		all : unset;
		color: #393e46;
	}
	input[type="button"]:hover{
		font-weight: bold;
		cursor: pointer;
	}
	div.login_right{
		flex: 7;
		background-image: url("${cpath}/resources/image/login2.gif");
		background-repeat: no-repeat;
		background-size: 100%;
		
	}
	.overlay{
		z-index: 2;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    height: 100%;
	    background-color: rgba(0, 0, 0, 0.5);
	}
	.box{
		width: 400px;
        height: 300px;
        background-color: white;
	
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 3;
        border-radius: 5px;
	}
	.modal{
		
	}
	div.modal.hidden > div.box {
            top: 120%;
            transition-duration: unset;
    }
    div.modal > div.box {
        top: 50%;
        transition-duration: 1s;
    }
    div.modal.hidden > div.overlay {
            display: none;
    }
    div.modal2.hidden > div.box {
            top: 120%;
            transition-duration: unset;
    }
    div.modal2 > div.box {
        top: 50%;
        transition-duration: 1s;
    }
    div.modal2.hidden > div.overlay {
            display: none;
    }
    .hidden{
    	display: none;
    }
    #loginBack{
    	all : unset;
    	position: absolute;
    	top : -3px;
    	right: 7px;
    	font-weight: bold;
    }
    #loginBack:hover{
    	cursor: pointer;
    }
    div.modal input[type="text"],
    div.modal input[type="email"]{
    	width: 200px;
		height: 35px;
		border-radius: 5px;
    }
    div.modal form{
    	text-align: center;
    	padding-top: 40px;
    	position: relative;
    }
    #resetFormClose{
    	all : unset;
    	color: #393e46;
    	font-weight: bold;
    	position: absolute;
    	top: 1px;
    	right: 7px;
    }
    #resetFormClose:hover{
    	cursor: pointer;
    }
    #resetPassSend{
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    	background-color: white;
    }
    #loadingImg{
    	width: 20px;
    	height: 20px;
    }
    div.modal2 form{
    	text-align: center;
    	padding-top: 40px;
    	position: relative;
    }
    div.modal2 input[type="text"],
    div.modal2 input[type="password"]{
    	width: 200px;
		height: 35px;
		border-radius: 5px;
    }
     #changeFormClose{
    	all : unset;
    	color: #393e46;
    	font-weight: bold;
    	position: absolute;
    	top: 1px;
    	right: 7px;
    }
    #changeFormClose:hover{
    	cursor: pointer;
    }
    #changePass{
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    	background-color: white;
    }
</style>
</head>
<body>

<!-- 임시 비밀번호 발급 모달 -->
<div class="modal hidden">
	<div class="box">
		<form>
			<p><input type="text" name="userid" placeholder="ID"></p>
			<p><input type="email" name="email" placeholder="Email"></p>
			<p><input id="resetPassSend" type="submit" value="임시 비밀번호 발급"></p>
			<p class="message"></p>
			<p><input id="resetFormClose" type="button" value="x"></p>
		</form>
	</div>
	<div class="overlay "></div>
</div>

<!-- 새 비밀번호 설정 모달 -->
<div class="modal2 hidden">
	<div class="box">
		<form>
			<p><input type="text" name="userid" placeholder="아이디"></p>
			<p><input type="password" name="userpw" placeholder="비밀번호"></p>
			<p><input type="password" name="newPassword" placeholder="새 비밀번호"></p>
			<p class="message"></p>
			<p><input id="changePass" type="submit" value="변경"></p>
			<p><input id="changeFormClose" type="button" value="x"></p>
		</form>
	</div>
	<div class="overlay "></div>
</div>


<div class="login">
	<div class="login_left">
		<div class="login_logo">
			<img src="${cpath }/resources/image/loginLogo.png">
		</div>
		<button id="loginBack">x</button>
		<form id="loginForm">
			<span>로그인</span>
			<p><input type="text" name="userid" placeholder="계정이름"></p>
			<p><input type="password" name="userpw" placeholder="비밀번호"></p>
			<p><span id="content"></span></p>
			<p id="pLogin">
				<button id="login">로그인</button>
			</p>
			<input id="join" type="button" value="회원가입"> |
			<input id="resetPassBtn" type="button" value="비밀번호 찾기"> |
			<input id=changePassBtn type="button" value="비밀번호 변경">
		</form>
	</div>
	<div class="login_right">
		
	</div>
</div>



<script>
// 	const loginBtn = document.getElementById('login')
 	const joinBtn = document.getElementById('join')
 	const resetPassForm = document.forms[0]
 	const changePassForm = document.forms[1]
	const loginForm = document.forms[2]
	const resetPass = document.getElementById('resetPass')
	const modal = document.querySelector('.modal')
	const modal2 = document.querySelector('.modal2')
	const resetPassSend = document.getElementById('resetPassSend')
	const resetFormClose = document.getElementById('resetFormClose')
	const resetPassMessage = document.querySelector('p.message')
	const changePassBtn = document.getElementById('changePassBtn')
	const changeFormClose = document.getElementById('changeFormClose')
	const changePass = document.getElementById('changePass')
	const loginBack = document.getElementById('loginBack')
	
	const cpath = '${cpath}'
	
	loginBack.onclick = function(){
		history.back()
	}
	// 로그인 핸들러
	const loginHandler = async function loginHandler(event){
		event.preventDefault()
		const url = cpath + '/ajax/login'
		const ob = {
			userid : event.target.querySelector('input[name="userid"]').value,
			userpw : event.target.querySelector('input[name="userpw"]').value
		}
		console.log(ob)
		const opt = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {'Content-Type' : 'application/json; charset=utf-8'}
			}
		const result = await fetch(url,opt).then(resp => resp.text())
		if(result == 0){
			const content = document.getElementById('content')
			content.innerText = '계정이름 혹은 비밀번호를 확인해주세요'
		}else{
			location.href = cpath
		}
	}
	const joinHandler = function(event){
		event.preventDefault()
		location.href = '${cpath}/member/join'
	}
	
	// 비밀번호 재설정 모달 열기
	function resetPassHandler(){
		modal.classList.remove('hidden')
	}
	
	// 새 비밀번호 이메일 전송 핸들러
	async function resetPassSendHandler(event){
		event.preventDefault()
		resetPassMessage.innerHTML = '<img id="loadingImg" src="${cpath }/resources/image/loading.gif">'
		const url = cpath + '/ajax/resetPass'
		const ob = {
				userid : event.target.querySelector('input[name="userid"]').value,
				email : event.target.querySelector('input[type="email"]').value,
		}
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {'Content-Type' : 'application/json; charset=utf-8'}
		}
	const result = await fetch(url,opt).then(resp => resp.text())
	if(result == 1){
		resetPassMessage.innerText = '메일 전송되었습니다'
			resetPassMessage.style.cssText = 'color : blue; font-size : 13px;'
		resetPassSend.classList.add('hidden')
	}
	else{
		resetPassMessage.innerText = '아이디 혹은 이메일을 확인해주세요'
		resetPassMessage.style.cssText = 'color : red; font-size : 13px;'
	}
	}
	
	// 비밀번호 발급 창 닫기
	function resetFormCloseHandler(){
		location.href = cpath + '/member/login'
	}
	
	// 비밀번호 변경 창 띄우기
	function changePassBtnHandler(){
		modal2.classList.remove('hidden')
	}
	
	// 비밀번호 변경 창 닫기
	function changeFormCloseHandler(){
		// modal2.classList.add('hidden')
		location.href = cpath + '/member/login'
	}
	// 비밀번호 변경 핸들러
	async function changePassFormHandler(event){
		event.preventDefault()
		const url = cpath + '/ajax/changePass'
		const ob = {
			userid : event.target.querySelector('input[name="userid"]').value,
			userpw : event.target.querySelector('input[name="userpw"]').value,
			newPassword : event.target.querySelector('input[name="newPassword"]').value,
		}
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {'Content-Type' : 'application/json; charset=utf-8'}
		}
		const result = await fetch(url,opt).then(resp => resp.text())
		if(result == 1){
			event.target.querySelector('p.message').innerText = '비밀번호 변경 완료'
			event.target.querySelector('p.message').style.cssText = 'font-size : 13px; color : blue;'
			changePass.classList.add('hidden')
		}
		else if(result == 3){
			event.target.querySelector('p.message').innerText = '새 비밀번호는 4자 이상 가능합니다'
			event.target.querySelector('p.message').style.cssText = 'font-size : 13px; color : red;'
		}
		else{
			event.target.querySelector('p.message').innerText = '아이디와 비밀번호를 확인해주세요'
			event.target.querySelector('p.message').style.cssText = 'font-size : 13px; color : red;'
		}
	}
	
	
	loginForm.onsubmit = loginHandler
	resetPassBtn.onclick = resetPassHandler
	resetPassForm.onsubmit = resetPassSendHandler
	resetFormClose.onclick = resetFormCloseHandler
	joinBtn.onclick = joinHandler
	changePassBtn.onclick = changePassBtnHandler
	changeFormClose.onclick = changeFormCloseHandler
 	changePassForm.onsubmit = changePassFormHandler
		
</script>




</body>
</html>