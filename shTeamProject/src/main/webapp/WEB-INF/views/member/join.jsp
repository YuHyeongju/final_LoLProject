<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>

<title>회원가입</title>

<style>
	body{
		background-color: #eeeeee;
		
	}
	.main{
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
	div.login span{
		color: black;
		font-size: 30px;
		font-weight: bold;
	}
	div.login_logo{
		text-align: center;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	#title{
		color: black;
		font-size: 30px;
		font-weight: bold;
	}
	#joinForm{
		text-align: center;
	}
	#content{
		color: red;
		font-size: 13px;
	}
	div.login_left{
		flex : 3;
		background-color: white;
	}
	div.login_logo > img{
		width: 50px;
		height: 50px;
	}
	div.login_right{
		flex: 7;
		background-image: url("${cpath}/resources/image/login2.gif");
		background-repeat: no-repeat;
		background-size: 100%;
		
	}
	label img{
		width: 70px;
		height: 70px;
		border-radius: 10px;
	}
	span#timer{
		color : blue;
	}
 	input[type="radio"]{ 
 		display: none; 
 	} 
	.border{
		border: 1px solid black;
	}
	input[name="upload"] {
            width: 300px;
            height: 25px;
        }
       
    #preview {
 		box-sizing: border-box;
        bottom: 0;
        width: 300px;
        height: 0;
        background-position: center center;
        background-repeat: no-repeat;
        background-size: auto 100%;
        margin-top: 20px;
        overflow: hidden;
        border-radius: 50%;
        margin-left: 30px;
    }
    #loginBack{
    	all : unset;
    	position: absolute;
    	top : -3px;
    	right: 7px;
    	font-weight: bold;
    	color: white;
    }
    #loginBack:hover{
    	cursor: pointer;
    }
    #joinForm {
    	position: relative;
    }
    #joinForm input[name="checkId"],
    #joinForm input[name="userpw"],
    #joinForm input[name="checkEmail"],
    #joinForm input[name="nickName"]
    {
    	width: 200px;
		height: 35px;
		border-radius: 5px;
    }
    #loadingImg{
    	width: 20px;
    	height: 20px;
    	margin-left: 5px;
    }
    #dupCheck{
    	all : unset;
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	position: absolute;
    	width: 70px;
    	padding: 5px;
    	font-size: 14px;
    	margin-left: 5px;
    	top : 60px;
    	cursor: pointer;
    }
    #dupCheckMessage{
    	font-size: 13px;
    }
    #mailSend{
    	all : unset;
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	width: 100px;
    	padding : 5px;
    	font-size: 14px;
    	margin-top : 5px;
    	cursor: pointer;
    	display: inline;
    }
    #timer{
    	font-size: 13px;
    	position: absolute;
    	top: 240px;
    }
    #authMessage{
    	font-size: 13px;
    }
    #mailSendTag{
    	margin-bottom: 0;
    }
    #mailMessage{
    	font-size: 13px;
    }
    #mailNum input[type="text"]{
    	width: 200px;
		height: 35px;
		border-radius: 5px;
		margin-left: 48px;
    }
    #auth{
    	all : unset;
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 14px;
    	cursor: pointer;
    }
    #favoriteTeamSelect{
    	font-weight: bold;
    	color: #393e46;
    }
    input[type="file"]{
    	display: none;
    }
    #fileSelect{
    	text-align: center;
    }
    .custom-file-upload {
		border: 1px solid #00adb5;
		height: 20px;
		width : 60px;
		border-radius: 10px;
		padding: 5px;
		font-size : 13px;
		display: flex;
		align-items: center;
		justify-content : center;
		font-weight : bold;
	  	cursor: pointer;
	  	margin-top: 20px;
	  	margin-left: 30px;
	  	position: absolute;
	  	right: 10px;
	}
	
	#joinForm input[type="submit"]{
		all : unset;
    	border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 13px;
    	cursor: pointer;
    	font-weight: bold;
	}
	#nextForm{
		border: 1px solid #00adb5;
    	border-radius: 5px;
    	padding : 5px;
    	font-size: 13px;
    	cursor: pointer;
    	font-weight: bold;
    	background-color: white;
    	margin-top: 10px;
	}
	.hidden{
		display: none;
	}
	#previewId{
		position: relative;
    	top: -35px;
	}
	#favoriteTeamSelect label:hover{
		cursor : pointer;
	}
	select{
		width: 100px;
		padding: 10px;
		border-radius: 5px;
    	border: 1px solid #00adb5;
	}
</style>
</head>
<body>
<div class="main">

<div class="login">
	<button id="loginBack">x</button>
	<div class="login_left">
		<div class="login_logo">
			<img src="${cpath }/resources/image/loginLogo.png">
		</div>
		<form id="joinForm" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="grade" value="0">
			<input type="hidden" name="locked" value="0">
			<span class="prev" id="title">회원가입</span>
			<p class="prev">
				<input type="text" name="checkId" placeholder="ID" required autofocus autocomplete="off">
				<input type="hidden" name="userid">
				
				<input id="dupCheck" type="button" value="중복확인"><br><span class="prev" id="dupCheckMessage"></span>	
			</p>
		<p>
			<input id="password" class="prev" type="password" name="userpw" placeholder="Password" required autocomplete="off">
			<br><span class="prev" id="passwordCheck"></span>
		</p>
		<p><input class="prev" type="text" name="nickName" placeholder="활동명" required></p>
		<p class="prev" id="mailSendTag">
			<input type="email" name="checkEmail" placeholder="Email" required><span class="prev" id="timer"></span><br><span class="prev" id="authMessage"></span>
			<br><input id="mailSend" type="button" value="인증번호 전송">
			<input type="hidden" name="email">
		</p>
			<span class="prev" id="mailMessage"></span>
		<p id="mailNum" class="hidden">
			<input type="text" placeholder="인증번호 입력">
			<input id="auth" type="button" value="확인">
		</p>
		<button class="prev hidden" id="nextForm">다음</button>
		<p id="favoriteTeamSelect" class="next hidden">
			응원팀<br>
			<label><input type="radio" value="T1" name="favoriteTeam" checked><img src="https://nng-phinf.pstatic.net/MjAyMzExMjFfMTkg/MDAxNzAwNTM5MzQyMTEx.Us_eFQthpJBOl1wtObn1jx9mu8xWwzjjfV5uSX2wnLIg.n_y-rzUkfZYKa6RMLtQ5cHDzlEVXdoNIsgP3y2X8-8cg.PNG/QDjIsYvDxwritmxpmHbm.png?type=f120_120"></label>
			<label><input type="radio" value="젠지" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyMzExMzBfMTMx/MDAxNzAxMjkxMTQxOTI0.35KDbIgQhqzkTbLv0fpYha0lONR-361OV4H7e2B12AQg.f8N-nXoqv7PyhRMjQrutFrbxdkWqIsanyd2tVEpLiDIg.PNG/qMJJzeIENwyuXsYROOPC.png?type=f120_120"></label>
			<label><input type="radio" value="한화생명" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMDlfMjMy/MDAxNzA0Nzc3NjI1MTQ2.eGW1SDrSWl18jzPXlcvANpcCWKpYsf6IjimjGSDjoMQg.hlnvjyQsj9nIiMZeA4OhBE55kkwj5teP9EQv1jiyrdwg.PNG/nISCkMhXrbDUSwvvNBHU.png?type=f120_120"></label>
			<label><input type="radio" value="DK" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMDlfNTgg/MDAxNzA0Nzc3NjI0ODA1.uP8whgaogDi-GLls0pPlth5tVi5acxjke0-74Dnf2m8g.brYwG671SDjVq_Th3I9b186GljCzVCeTeF6M4QmYmhMg.PNG/JANOgpIgUsUIPAWNCIpx.png?type=f120_120"></label>
			<label><input type="radio" value="KT" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyMzA4MTlfMjc5/MDAxNjkyNDQyNDYxNDgy.cBlE3Sb3Gp1z2HZHBdG0FIPf6tpFKweqHKQOzB_8RW0g.ZeyxGwH-HRGEhQx-0O2F3toKuiAhqIdM-JE7E_ed6KMg.PNG/NAIEIeJiaObEkzClVJwv.png?type=f120_120"></label>
			<label><input type="radio" value="광동" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMDlfMTUz/MDAxNzA0Nzc3NjI0NDYx.pwI63gxV6bchL79xehGs5pCBg1wcfab-vg736b_7Af8g.ug-8GjyqA1Tf8bbRLXZIObCxaqMa-dbMVqoAnRg5uksg.PNG/xLgdUaDMDGMoDngAuQOr.png?type=f120_120"></label>
			<label><input type="radio" value="피어엑스" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMTdfMTQ3/MDAxNzA1NDUwODI1MDY1.mzjIt5UK0wxw7-mj0PDNSFpRPuoJZGgXuSChv3qVQgMg.0PsgAYMDt5UBeYaNnsUIMdZlfyOPOUVBNWvtwRDPFVYg.PNG/wxWTByBxjAqjMQOpVEqx.png?type=f120_120"></label>
			<label><input type="radio" value="OK저축은행" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMDlfNzkg/MDAxNzA0Nzc3NjIzNzE0.ggqk_IRt-0UKOdF1dgczPjArzZMwB5lgtx3dL8MGW2Mg.GRnW5Zms76fG1kAZoeg_CU6nhQLdEzvBfDrldNW6E1Ag.PNG/sEAYkgonQtCbnyhRHAXb.png?type=f120_120"></label>
			<label><input type="radio" value="농심" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAyMTdfNTEg/MDAxNzA4MTQ1NjYwOTk4.IeqZ-I2JUp2513V-r6_Z5DHSKmJEUffyScLDbNYqLAIg.HyKiFSxpjNNvDg-UnTX_W23WwEFQZ5e6ltkWXWACjzcg.PNG/FbiVSngXvuCwIXkiBrce.png?type=f120_120"></label>
			<label><input type="radio" value="DRX" name="favoriteTeam"><img src="https://nng-phinf.pstatic.net/MjAyNDAxMDlfMjU2/MDAxNzA0Nzc3NjI1NTA0.SKtMtPI2qdxYF5G11OvPo-CvPIqzYUw4C2UQy-QYsygg.CE3_sM5g3CWukjkIx4XAuQO8YHkY3t8PUa8EqdJ5-Asg.PNG/FbqNKUQHEjoWMLhgmXuQ.png?type=f120_120"></label>
		</p>
			<div id="fileSelect" class="next hidden">
				<label for="file-upload" class="custom-file-upload">파일 선택</label>
				<input id="file-upload" type="file" name="upload" accept="image/*">
				<div id="preview"></div>
				<div id="previewId"></div>
			</div>
		
		<p class="next hidden">
			<select name="mainPosition" required>
				<option value="">주 포지션</option>
				<option value="탑">탑</option>
				<option value="정글">정글</option>	
				<option value="미드">미드</option>
				<option value="원딜">원딜</option>
				<option value="서폿">서폿</option>
			</select>
			<select name="subPosition" required>
				<option value="">부 포지션</option>
				<option value="탑">탑</option>
				<option value="정글">정글</option>
				<option value="미드">미드</option>
				<option value="원딜">원딜</option>
				<option value="서폿">서폿</option>
			</select>
		</p>
		<p class="next hidden">
			<input type="submit" value="회원가입">
		</p>
		</form>
	</div>
	<div class="login_right"></div>
</div>



</div>
</body>
<script>
	const dupCheck = document.getElementById('dupCheck')
	const dupCheckMessage = document.getElementById('dupCheckMessage')
	const mailSend = document.getElementById('mailSend')
	const mailMessage = document.getElementById('mailMessage')
	const auth = document.getElementById('auth')
	const authMessage = document.getElementById('authMessage')
	const form = document.forms[0]
	const cpath = '${cpath}'
	const labels = document.querySelectorAll('label')
	const radios = document.querySelectorAll('input[type="radio"]')
	const imgs = document.querySelectorAll('label img')
	const inputImg = document.querySelector('input[name="upload"]')
    const preview = document.getElementById('preview')
    const previewId = document.getElementById('previewId')
    const loginBack = document.getElementById('loginBack')
    const nextForm = document.getElementById('nextForm')
    const password = document.getElementById('password')
    const passwordCheck = document.getElementById('passwordCheck')
    const prevs = document.querySelectorAll('.prev')
    const nexts = document.querySelectorAll('.next')
    
	let remainingTime = 180
	
	function passwordCheckHandler(){
			if(password.value.length < 4){
				passwordCheck.innerText = '비밀번호는 4글자 이상 사용 가능합니다'
				passwordCheck.style.cssText = 'font-size : 13px; color : red;'
			}else{
				passwordCheck.innerText = ''
			}
		}
	password.oninput = passwordCheckHandler
	if(document.querySelector('input[name="checkId"]').getAttribute('disabled') == 'disabled' && 
	document.querySelector('input[name="checkEmail"]').getAttribute('disabled') == 'disabled'){
		nextForm.classList.remove('hidden')
	}
	
	// 다음 페이지 버튼
	function nextFormHandler(event){
		event.preventDefault()
		if(document.getElementById('password').value == '' || 
			document.querySelector('input[name="nickName"]').value == ''){
			authMessage.innerText = '비밀번호 혹은 활동명을 확인해주세요'
			authMessage.style.color = 'red'
			return
			}
		const prevs = document.querySelectorAll('.prev')
		prevs.forEach(prev => {
			prev.classList.add('hidden')
		})
		const nexts = document.querySelectorAll('.next')
		nexts.forEach(next => {
			next.classList.remove('hidden')
		})
	}
	
	nextForm.onclick = nextFormHandler
	
	loginBack.onclick = function(){
		history.back()
	}
	// 아이디 중복체크 핸들러
	const buttonHandler = async function buttonHandler(event){
		const userid = document.querySelector('input[name="checkId"]').value
		const url = '${cpath}/ajax/dupCheck/' + userid
		const result = await fetch(url).then(resp => resp.text())
		console.log(result)
		if(result == 0){
			dupCheckMessage.innerText = '사용 가능한 아이디입니다'
			dupCheckMessage.style.color = 'blue'
			dupCheck.style.cssText = 'display: none;'
			document.querySelector('input[name="checkId"]').setAttribute("disabled","disabled")
			document.querySelector('input[name="userid"]').value = document.querySelector('input[name="checkId"]').value
		}else{
			dupCheckMessage.innerText = '사용 불가능한 아이디입니다'
			dupCheckMessage.style.color = 'red'
		}
	}
	
	// 이메일 핸들러
	const emailHandler = async function emailHandler(event){
		event.preventDefault()
		if(document.querySelector('input[name="checkId"]').getAttribute('disabled') != 'disabled'){
			mailMessage.innerText = '아이디 중복확인 필요'
			mailMessage.style.color = 'red'
			return
		}
		mailSend.style.cssText = 'display: none;'
		mailMessage.innerText = ''
		authMessage.innerText = ''
		document.getElementById('timer').innerHTML = '<img id="loadingImg" src="${cpath}/resources/image/loading.gif">'
		document.getElementById('timer').style.cssText = 'display: inline;'
		const url = '${cpath}/ajax/sendMail'
			const opt = {
					method:'POST',
					body: JSON.stringify({
						
						address : document.querySelector('input[name="checkEmail"]').value
					}),
					headers : {
						'Content-Type' : 'application/json;charset=utf-8'
					}
			}
			const result = await fetch(url,opt).then(resp => resp.text())
			const message = event.target.querySelector('p.message')
			if(result == 1){
				mailMessage.innerText = '메일을 전송했습니다'
				mailMessage.style.color = 'blue';
				document.getElementById('mailNum').classList.remove('hidden')
				const mailSendTag = document.getElementById("mailSendTag")
					
				// 감소 타이머 설정 (1초마다 실행)
				const timerInterval = setInterval(function() {
				    // 남은 시간 감소
				    remainingTime--

				    // 남은 시간이 0 이하일 경우 타이머 중지
				    if (remainingTime <= 0) {
				        clearInterval(timerInterval)
				        document.getElementById('timer').innerText = '인증번호 만료'
				        document.getElementById('timer').style.color = 'red'
				        	if(document.querySelector('input[name="checkEmail"]').getAttribute('disabled') != 'disabled'){
				        mailSend.style.cssText = 'display: block;'
						}
				    } else {
				        let mm = Math.floor(remainingTime / 60) + ':'
				        let ss = remainingTime % 60
				        if(mm == '0:')mm = ''
				        if(ss < 10)ss = '0' + ss
				        document.getElementById('timer').innerText = '남은 시간: ' + mm + ss
				        document.getElementById('timer').style.color = 'grey'
				    }
				}, 1000)
			}else{
				mailMessage.innerText = '이메일을 다시 확인해주세요'
					document.getElementById('timer').innerText = ''
				mailMessage.style.color = 'red'
				mailSend.style.cssText = 'display: inline;'
			}
			}
				
	
	// 이메일 인증 확인 핸들러
	auth.onclick = async function(event){
		event.preventDefault()
		const inputNumber = document.querySelector('#mailNum > input').value
		const url = '${cpath}/ajax/authNumber/' + inputNumber
		const result = await fetch(url).then(resp => resp.text())
		const timer = document.getElementById('timer')
		const message = document.getElementById('authMessage')
		if(result == 1){
	        message.innerText = '인증성공'
        	message.style.color = 'blue'
        	document.getElementById('mailNum').style.cssText = 'display: none;'
        	timer.style.cssText = 'display: none;'
        	mailMessage.style.cssText = 'display: none;'
        	mailSend.style.cssText = 'display: none;'
        	document.querySelector('input[name="email"]').value = document.querySelector('input[name="checkEmail"]').value
        	document.querySelector('input[name="checkEmail"]').setAttribute("disabled","disabled");
        	
	        if(document.querySelector('input[name="checkId"]').getAttribute('disabled') == 'disabled' && 
	        document.querySelector('input[name="checkEmail"]').getAttribute('disabled') == 'disabled'){
	        	nextForm.classList.remove('hidden')
	        }
		}
		else{
	        message.innerText = '인증실패'
        	message.style.color = 'red'
        	mailSend.style.cssText = 'display: block;'
		}
	}
	
	// 회원가입 폼 제출 핸들러
	const formHandler = async function formHandler(event){
		event.preventDefault()
		if(document.querySelector('input[name="checkId"]').getAttribute('disabled') == 'disabled' && 
		document.querySelector('input[name="checkEmail"]').getAttribute('disabled') == 'disabled'){
			const url = cpath + '/ajax/join'
			const formData = new FormData(event.target)
			const opt = {
					method: 'POST',
					body: formData,
				}
			const result = await fetch(url,opt).then(resp => resp.text())
			if(result == 1){
				alert('가입이 완료되었습니다')
				location.href = cpath + '/member/login'
			}
			else{
				alert('가입 실패')
			}
			
		}
		else{s
			if(document.querySelector('input[name="email"]').getAttribute('disabled') != 'disabled')alert('이메일 인증을 완료해주세요')
			if(document.querySelector('input[name="checkId"]').getAttribute('disabled') != 'disabled')alert('아이디 중복확인을 해주세요')
		}
	}
	// 라벨 클릭 핸들러
	
	imgs.forEach(img => {
		img.onclick = function(){ 
//			radios.forEach(e => e.classList.remove('border'))
			imgs.forEach(e => e.classList.remove('border'))
			img.classList.add('border')
		}
	})
	// 이미지 미리보기 핸들러
	function changeHandler(event) {
            // event.target 은 파일을 첨부하는 input 요소이다
            // preview는 미리보기 그림을 보여줄 div 요소이다
            const preview = document.getElementById('preview')
            if(event.target.files && event.target.files[0]) {
                preview.style.height = '60px'
                preview.style.width = '60px'
		        previewId.innerText = document.querySelector('input[name="userid"]').value + '님 환영합니다'
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
	dupCheck.onclick = buttonHandler
	mailSend.onclick = emailHandler
	form.onsubmit = formHandler
</script>
</body>
</html>