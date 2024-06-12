<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<style>
body{
 background-color: #eee;
}
.section {
	width: 1400px;
	max-height: max-content;
	border: 2px solid grey;
	border-radius:20px;
	margin: auto auto;
	margin-top: 10px;
	margin-bottom: 10px;
	background-color: rgb(255, 255, 240);
	  
}

.section  h3 {
	color: black;
	text-align: center;
	font-weight: bold;
	padding-left: 10px;
}

.section>.idx {
	color: black;
	font-size: 16px;
	font-weight: bold;
	padding: 10px 0;
}

.idx>h3 {
	margin: 0;
}

.contentAndimage {
	color: black;
}

.contentAndimage>.content {
	padding: 10px;
	font-weight: bold;
	border-left:1px solid grey;
	width: 700px;
	height: 475px;
}

.contentAndimage>.image {
	padding: 10px;
	
	width: 700px;
	height: 475px;
}

.contentAndimage>.image>img {
	width: 700px;
	height: 475px;
}

#BoardHateCount{
	margin-right: 5px;
}
.BoardLikeCount > h3{
	padding-right:5px;
}

.boardLike {
	width:70px;
	height:40px;	
	font-size: 30px;
	display: flex;
	align-items: center;
	justify-content: center;		
}
.boardHate{
	width:70px;
	height:40px;
	font-size: 30px;
	display: flex;
	align-items: center;
	justify-content: center;

}
.boardReport{
	width:70px;
	height:60px;
	display: flex;
	align-items: center;
	justify-content: center;
}


.BoardLikeyBtn{
	all:unset;
	cursor: pointer;
	color: red;
	font-size: 33px;
	margin:auto auto;
	height:50px;
	padding:3px;
	
}
.BoardHateBtn{
	all:unset;
	cursor: pointer;
	margin: auto auto;
	height: 53px;
	padding:5px;
	
	
}
.BoardHateBtn > img{
	margin: 5px;
	width:45px;
	height:45px;
}

.boardReportBtn{
	all:unset;
	font-size: 30px;
	margin:10px;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

hr {
	margin: 0;
}


.reply {
	width: 1400px;
	max-height: max-content;
	
}

.reply>h3 {
	text-align: left;
}

.reply>hr {
	border: none;
}


.reply .writer {
	width: 75px;
	height: 30px;
	margin-top:10px;
	margin-left: 20px;
	border: 1px solid grey;
	border-radius: 30px;
	padding:10px;
	text-align: center;
	font-size:16px;
	font-weight: bold;
}

.reply  .writeReply {
	padding:10px;
	margin-top: 10px;
	margin-left: 10px;
	resize: none;
	width:1150px;
	max-height: max-content;
	border: 1px solid grey;
	border-radius: 30px;
	overflow-wrap: break-word;
	
}


.submitBtn {
	margin-top: 25px;
	margin-left: 10px;
	width: 70px;
	height: 50px;
	border: transparent;
	border-radius: 30px;
	font-weight: bold;
	
}
.submitBtn:hover {
	background-color: orange;
	font-weight: bold;
}

.replyList {
	width: fit-conent;
	max-height: 440px; 
	overflow-y:scroll;
	
	padding: 10px;	
}

.replyArea {
	margin: 20px; 
	border : 1px solid grey;
	width: 1300px;
	color: black;
	border-radius: 30px;
	
	
}
.replyArea > .idx{
	padding: 10px;
	margin: 0;
	display: flex;
	align-items: center;
	font-weight: bold;
}
.replyArea>.replyWriter{
	padding: 10px;
	margin: 0;
	display: flex;
	align-items: center;
	font-weight: bold;
	width:50px;
}

.replyArea>.replyContent {
	width: 650px;
	padding: 10px;
	margin: 0;
	overflow-wrap: break-word;
	display: flex;
	align-items: center;
	font-weight: bold;
}

.replyLikeCount{
	margin:10px;
	width:170px;
	display:flex;
	text-align: center;
	align-items: center;
	font-weight: bold;
}

.replyLike{
	width:40px;
	height:40px;
	font-size: 25px;
	padding:5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.replyHate{
	width:40px;
	height:42px;
	font-size: 25px;
	padding:5px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.replyReport{
	width:40px;
	height:40px;
	font-size: 25px;
	padding:5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.replyLikeBtn{
	all:unset;
	margin:0 10px;
	color: red;
	display: flex;
	align-items: center;
	cursor: pointer;
	font-size: 35px;
}
.replyHateBtn{
	all:unset;
	font-size: 35px;
	margin:0 10px;
	display: flex;
	align-items: center;
	cursor: pointer;
}
.replyHateBtn > img{
	width:48px;
	height:48px;
	padding:5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
.replyReportBtn{
	all:unset;
	font-size: 40px;
	margin:10px;
	display: flex;
	align-items: center;
	cursor: pointer;
}

.replyModifyBtn {
	margin:10px;
	width: 70px;
	height: 30px;
	border-radius: 30px;
	border: transparent;
	font-weight: bold;
	
}

.replyModifyBtn:hover {
	background-color: orange;
	font-weight: bold;
}

.replyDeleteBtn {
	margin:10px;
	width: 70px;
	height: 30px;
	border-radius: 30px;
	border: transparent;
	font-weight: bold;
}

.replyDeleteBtn:hover {
	background-color: orange;
	font-weight: bold;
}


.boardModifyBtn{
	margin:10px;
	width: 100px;
	height: 30px;
	border-radius: 30px;
	border: transparent;
	font-weight: bold;
}
.boardModifyBtn:hover {
	background-color: orange;
	font-weight: bold;
}
.boardDeleteBtn{
	margin:10px;
	width: 100px;
	height: 30px;
	border-radius: 30px;
	border: transparent;
	font-weight: bold;
}
.boardDeleteBtn:hover {
	background-color: orange;
	font-weight: bold;
}
.goToListBtn{
	margin:10px;
	width: 200px;
	height: 30px;
	border-radius: 30px;
	border: transparent;
	font-weight: bold;	
}
.goToListBtn:hover {
	background-color: orange;
	font-weight: bold;
}
.buttons {
	padding: 5px;
}

.buttons>button {
	margin: 10px;
}

.buttons>a {
	line-height: 40px;
	padding-left: 10px;
}
</style>
</head>
<body>
	<div class="section">
		<div class="title flex">
			<h3>글 제목:</h3>
			<h3>${dto.title }</h3>
		</div>
		<hr>
		<div class="idx flex">
			<h3>글 번호:</h3>
			<h3>${dto.idx }</h3>
		</div>
		<hr>
		<div class="writer flex">
			<h3>작성자:</h3>
			<h3>${dto.writer }</h3>
		</div>
		<hr>
		<div class="writeDate flex">
			<h3>작성일자:</h3>
			<h3>${dto.writeDate }</h3>
		</div>
		<hr>
		<div class="BoardLikeCount flex">
			<h3>좋아요:</h3>
			<h3 id="BoardLikeCount">${BoardLikeCount }</h3>
			<h3>싫어요:</h3>
			<h3 id="BoardHateCount">${BoardHateCount }</h3>
			
			<div class="boardLike">
				<c:if test= "${BoardLikeOne.likey == 1 }"><button class="BoardLikeyBtn">&#x2764</button></c:if>
				<c:if test= "${BoardLikeOne.likey == 0 }"><button class="BoardLikeyBtn">&#x1F90D</button></c:if>
				<c:if test= "${empty BoardLikeOne }"><button class="BoardLikeyBtn">&#x1F90D</button></c:if>
			</div>
			
			<div class="boardHate">
				<c:if test= "${BoardLikeOne.hate == 1 }"><button class="BoardHateBtn">&#128148</button></c:if>
				<c:if test= "${BoardLikeOne.hate == 0 }"><button class="BoardHateBtn"><img src="${cpath }/resources/image/heart-broken-outline.png" ></button></c:if>
				<c:if test= "${empty BoardLikeOne }"><button class="BoardHateBtn"><img src="${cpath }/resources/image/heart-broken-outline.png" ></button></c:if>
			</div>
			
			<div class="boardReport">
				<c:if test="${dto.resultBoardReport == 0 }"><button class="boardReportBtn"><img src="${cpath }/resources/image/siren-rounded-outline_.png" style="width:40px; height:40px;"></button></c:if>
				<c:if test="${dto.resultBoardReport == 1}"><button class="boardReportBtn">🚨</button></c:if>
			</div>
			
		</div>
		<hr>
		
		<div class="contentAndimage flex">
			<div class="image">
				<c:if test="${dto.image != null }">
					<img src="${cpath }/upload/${dto.image }">
				</c:if>
			</div>
			<div class="content">${dto.content }</div>
		</div>
		<hr>
		<div class="reply">
			<h3>댓글 ${replyCount }</h3>
			<hr>
			<c:if test="${dto.category != '공지'}">
				<form action="${cpath }/reply/write" method="POST" class="flex">
					<!-- login정보에서 writer를 가져올 수 없음으로 입력하여 넘겨줌 -->
					<input type="hidden" name="boardIdx" value="${dto.idx }">
					<p>
						<input class="writer" type="text" name="writer"
							value="${login.userid }" readonly>
					</p>
					<p>
						<textarea class ="writeReply" name="content" required></textarea>
					</p>
					<input class="submitBtn" type="submit" value="댓글 작성" ${not empty login.userid ? '':'disabled' }>
				</form>
			</c:if>
			<hr>
			<div class="replyList">
				<c:if test="${not empty list}">
					<div class="replyListInner ">
						<c:forEach var="reply" items="${list }">
							<div class="replyArea flex">
								<div class="idx">${reply.idx}</div>
								<div class="replyWriter">${reply.writer}</div>
								<div class="replyContent">${reply.content }</div>
								<div class="replyLikeCount">좋아요: ${reply.replyLikeCount}  / 싫어요: ${reply.replyHateCount } </div>
								<div class="replyLike">
									<c:if test= "${reply.likey 	== 1 }"><button class="replyLikeBtn">&#x2764</button></c:if>
									<c:if test= "${reply.likey == 0 }"><button class="replyLikeBtn">&#x1F90D</button></c:if>
									<c:if test= "${empty reply.likey}"><button class="replyLikeBtn">&#x1F90D</button></c:if>
								</div>
								<div class="replyHate">
									<c:if test= "${reply.hate == 1 }"><button class="replyHateBtn">&#128148</button></c:if>
									<c:if test= "${reply.hate == 0 }"><button class="replyHateBtn"><img src="${cpath }/resources/image/heart-broken-outline.png" ></button></c:if>
									<c:if test= "${empty reply.hate}"><button class="replyHateBtn"><img src="${cpath }/resources/image/heart-broken-outline.png" ></button></c:if>
								</div>
								<div class="replyReport">
									<c:if test="${reply.resultReplyReport == 0 }"><button class="replyReportBtn"><img src="${cpath }/resources/image/siren-rounded-outline_.png" style="width:35px; height:35px;"></button></c:if>
									<c:if test="${reply.resultReplyReport == 1 }"><button class="replyReportBtn">🚨</button></c:if>
								</div>	
								<button class="replyModifyBtn" ${not empty login.userid && reply.writer == login.userid ? '':'disabled' }>댓글 수정</button>
								<a href="${cpath }/reply/delete/${reply.idx}"><button
										class="replyDeleteBtn" ${not empty login.userid && reply.writer == login.userid ? '':'disabled' }>댓글 삭제</button></a>
							</div>
						</c:forEach>

					</div>
				</c:if>
			</div>
		</div>

		<div class="buttons flex">
			<a href="${cpath }/community/modifyBoard/${dto.idx}"><button class="boardModifyBtn"${not empty login.userid && dto.writer == login.userid ? '':'disabled'  }>게시글 수정</button></a>
			<a href="${cpath }/community/delete/${dto.idx}"><button class="boardDeleteBtn"${not empty login.userid && dto.writer == login.userid ? '':'disabled' }>게시글 삭제</button></a>
			<a href="${cpath }/community/list"><button class="goToListBtn">게시판 메인으로 돌아가기</button></a>
		</div>
	</div>


	<script>// 댓글 수정 스크립트
		const modifyBtn = document.querySelectorAll('.replyModifyBtn') 
		const cpath = '${cpath}'
		const idx = '${dto.idx}'
		modifyBtn.forEach(btn => {
			btn.addEventListener('click', async function(event){
				event.preventDefault()
				// 수정 버튼 클릭하면 수정 폼 띄우기
				const reply = this.parentElement // 수정버튼의 부모요소를 가리킴
				const writerText = reply.querySelector('.replyWriter').innerText 
				const contentText = reply.querySelector('.replyContent').innerText 
				const replyIdx = reply.querySelector('.idx').innerText
				
				
				// 댓글 내용을 수정 폼에 채우기
				const writerInput = document.createElement('input') //  input이라는 이름의 html요소 생성
                writerInput.type = 'text';
                writerInput.value = writerText;
                const contentInput = document.createElement('textarea') //  textarea이라는 이름의 html요소 생성
                contentInput.value = contentText;
                
                // 수정 폼을 만들고 기존 폼을 대체함
                reply.innerHTML = ''
                reply.appendChild(writerInput)
                reply.appendChild(contentInput)
                
                // 수정 폼에 스타일 적용
				writerInput.style.padding = '5px'
				writerInput.style.margin = '10px'
				writerInput.style.borderRadius = '20px'
				writerInput.style.border = '1px solid grey'
				writerInput.style.height = '20px'
				writerInput.style.width = '70px'
				writerInput.style.textAlign = 'center'
				writerInput.style.display = 'flex'
				writerInput.style.alignItems = 'center'
				
				
				
				contentInput.style.padding = '5px' 
				contentInput.style.margin = '10px' 
				contentInput.style.borderRadius = '20px'
				contentInput.style.border = '1px solid grey'
				contentInput.style.height = '20px'
				contentInput.style.width = '1080px'
				contentInput.style.resize = 'none'
				contentInput.style.lineHeight = '20px'
				
				
				
                
                // 수정 완료 버튼 추가
                const submitBtn = document.createElement('button')
                submitBtn.innerText = '수정 완료'
                submitBtn.classList.add('submitBtn') // submitBtn에 css클래스 추가 -> css적용가능
                reply.appendChild(submitBtn)
                submitBtn.style.margin = '0'
                submitBtn.style.borderRadius = '30px'
                submitBtn.style.width = '70px'
                submitBtn.style.fontWeight = 'bold'
                
               
                
                // 수정완료 버튼을 누를시 이벤트 처리
                submitBtn.addEventListener('click',async function(event){
                	event.preventDefault()
                	// 수정된 데이터를 가져와서 처리
                	const modifyWriter = writerInput.value
                	const modifyContent = contentInput.value
            
                	const json = {  // 서버로 보낼 데이터
                		   writer: modifyWriter,
                           content: modifyContent,
                		   idx: replyIdx
                	}
                	console.log(json)
                	
                	const result = await fetch(cpath + '/ajax/reply/modify',{
                		method:'POST',
                		headers:{
                			
                			'Content-Type':'application/json; charset=utf-8'
                		},
                		body: JSON.stringify(json)
                	})
            
                	location.reload() 
                	
               	    	
                })
                
                
			})
		})
	</script>
	<script>
	// 게시글 좋아요 
		
		const boardIdx = '${dto.idx}' // 게시글 idx
		const userid = '${login.userid}'       // 원래 login.userid 해야함.
		const likeBtn = document.querySelector('.boardLike > .BoardLikeyBtn')
		const BoardLikeCountDiv = document.getElementById('BoardLikeCount')
		
		
		
		likeBtn.addEventListener('click',async function(event){
				event.preventDefault()
				
				const url = cpath + '/ajax/BoardLikey'
				console.log(boardIdx)
				console.log(userid)
				
				const opt = {
					method:'POST',
					headers: {
						'Content-Type': 'application/json;charset=utf-8',
					},
					
					body:JSON.stringify({
						boardIdx : boardIdx,
						userid : userid,
					})
					
					
				}
				if(userid == ''){
					alert("로그인이 필요합니다.")	
					location.href = cpath + '/member/login'
				}
				
				
				await fetch(url,opt)
				location.reload()
		})
		
	
	</script>
	<script>
	// 게시글 싫어요
		

		const hateBtn = document.querySelector('.boardHate > .BoardHateBtn')
		const BoardHateCountDiv = document.getElementById('BoardHateCount')
		
		
		hateBtn.addEventListener('click',async function(event){
				event.preventDefault()
				
				const url = cpath + '/ajax/BoardHate'
				console.log(boardIdx)
				console.log(userid)
				
				const opt = {
					method:'POST',
					headers: {
						'Content-Type': 'application/json;charset=utf-8',
					},
					
					body:JSON.stringify({
						boardIdx : boardIdx,
						userid : userid,
					})
				}
				if(userid == ''){
					alert("로그인이 필요합니다.")	
					location.href = cpath + '/member/login'
				}
				
				
				await fetch(url,opt)
				location.reload()
			
		})
		
	
	</script>
	<script>
	// 댓글 좋아요
		
		const replyLikeBtns = document.querySelectorAll('.replyLike > .replyLikeBtn')
		
		replyLikeBtns.forEach(LikeBtn =>{
			LikeBtn.addEventListener('click',async function(event){
				event.preventDefault()
				
				  // 클릭된 버튼의 부모 요소에서 댓글 인덱스와 사용자 ID를 가져오기
				 const replyIdx = LikeBtn.closest('.replyArea').querySelector('.idx').textContent;
				// btn.closest: btn 요소의 부모 요소들 중에서 클래스가 replyArea인 가장 가까운(상위의) 요소를 찾음.
				
				
				console.log('댓글 인덱스:', replyIdx)
				console.log('사용자 ID:',userid)
				
				const url = cpath + '/ajax/ReplyLikey'
				
				const opt = {
					method:'POST',
					headers: {
						'Content-Type': 'application/json;charset=utf-8',
					},
					body:JSON.stringify({
						replyIdx:replyIdx,
						userid:userid,
					})
				}
				if(userid == ''){
					alert("로그인이 필요합니다.")	
					location.href = cpath + '/member/login'
				}
			await fetch(url,opt)
			location.reload()
			})	
		
		})
	</script>
	<script>
	// 댓글 싫어요
		
		const replyHateBtns = document.querySelectorAll('.replyHate > .replyHateBtn')
		console.log('선택된 버튼의 개수',replyHateBtns.length)
		
		
		replyHateBtns.forEach(HateBtn =>{
			HateBtn.addEventListener('click',async function(event){
				event.preventDefault()
				
				  // 클릭된 버튼의 부모 요소에서 댓글 인덱스와 사용자 ID를 가져오기
				 const replyIdx = HateBtn.closest('.replyArea').querySelector('.idx').textContent;
				// btn.closest: btn 요소의 부모 요소들 중에서 클래스가 replyArea인 가장 가까운(상위의) 요소를 찾음.
				
				
				console.log('댓글 인덱스:', replyIdx)
				console.log('사용자 ID:',userid)
				
				const url = cpath + '/ajax/ReplyHate'
				
				const opt = {
					method:'POST',
					headers: {
						'Content-Type': 'application/json;charset=utf-8',
					},
					body:JSON.stringify({
						replyIdx:replyIdx,
						userid:userid,
					})
				}
				if(userid == ''){
					alert("로그인이 필요합니다.")	
					location.href = cpath + '/member/login'
				}
			await fetch(url,opt)
			location.reload()
			})	
		
		})
	</script>
	<script>
	// 게시글 신고
		
		const reportUser = '${login.userid}'
		const reportedUser = '${dto.writer}'
	
		const boardReportBtn = document.querySelector(".boardReportBtn")
		
		boardReportBtn.addEventListener('click',async function(event){
			event.preventDefault()
			
			
			const url = cpath + '/ajax/BoardReport'
			
			const opt = {
				method:'POST',
				headers:{
					'Content-Type': 'application/json;charset=utf-8',
				},
				body:JSON.stringify({
					boardIdx:boardIdx,
					reportUser:reportUser,
					reportedUser:reportedUser,
				})
				
			}
			
			if(reportUser == ''){
				alert('로그인이 필요합니다.')	
				location.href = cpath + '/member/login'
				return
			}else if(reportUser == reportedUser){
				console.log(reportUser)
				console.log(reportedUser)
				
				alert('본인의 게시글을 신고할 수 없습니다.')
				return
			}
			
			const result = await fetch(url,opt).then(resp => resp.text())
			
			if(result == 1 && reportUser != reportedUser){
				alert('게시글 신고가 접수 되었습니다.')
			}	
			else if(result == 0){
				alert('게시물 신고는 한 번만 가능합니다.')
			}else{
				alert('게시글 신고에 실패 했습니다.')
			}
			location.reload()
		})
	</script>
	<script>
		// 댓글 신고
		
		const replyReportBtns = document.querySelectorAll('.replyReportBtn')
		
		
		replyReportBtns.forEach(reportBtn =>{
			reportBtn.addEventListener('click',async function(event){
				event.preventDefault()
				
				const replyIdx = reportBtn.closest('.replyArea').querySelector('.idx').textContent
				
				const reportedReplyUser = reportBtn.closest('.replyArea').querySelector('.replyWriter').textContent
				console.log(reportedReplyUser)
				console.log(reportUser)
				
				const url = cpath + '/ajax/ReplyReport'
				
				const opt = {
					method: 'POST',
					headers:{
						'Content-Type': 'application/json;charset=utf-8',
					},
					body:JSON.stringify({
						replyIdx:replyIdx,
						reportUser:reportUser,
						reportedUser:reportedReplyUser,
						
					})
					
				}
				
				
				if(reportUser == ''){
					alert("로그인이 필요합니다.")	
					location.href = cpath + '/member/login'
					return
				}else if(reportUser == reportedReplyUser){
					alert('본인의 댓글을 신고할 수 없습니다.')
					return
				}
				
				const result = await fetch(url,opt).then(resp => resp.text())
				
				if(result == 1 && reportUser != reportedReplyUser){
					alert('댓글 신고가 접수 되었습니다.')
				}	
				else if(result == 0){
					alert('댓글 신고는 한 번만 가능합니다.')
				}else{
					alert('댓글 신고에 실패 했습니다.')
				}
				location.reload()
			})
		})
		
		
	
	</script>
</body>
</html>