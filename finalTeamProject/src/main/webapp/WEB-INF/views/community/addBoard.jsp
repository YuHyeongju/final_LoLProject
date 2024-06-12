<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
body{
	background-color: #eee;
	
}
p{
	color: 
	black;
}
.section {
	
	width: 1000px;
	height: 600px;
	border: 2px solid black;
	margin: auto auto;
	background-color: rgb(255, 255, 240);
	border-radius: 30px;
	
	
}
.writeForm{
	display: flex;
	justify-content: center;
	align-items: center; 
	width:600px;
	height:600px;
	margin:auto auto; 
	
}
.writeForm{
	position: relative;
}
.writeForm > form > p{
	padding:10px;
	
	
}
.writeForm input[type = "text"]{
	
	border: 1px solid gray;
	cursor: pointer;
	border-radius: 20px;
	padding: 5px 10px;
	font-weight: bold;
}
.writeForm .category{
	border: 1px solid gray;
	cursor: pointer;
	border-radius: 20px;
	padding: 5px 10px;
	font-weight: bold;
	color:gray;
}
.writeForm .isNotice{
	
	font-weight: bold;
	
}
.writeForm .isNotice input[type="checkbox"]{
	transform: scale(1.4);
	margin-right: 10px;
}
.writeForm textarea{
	resize: none;
	border-radius: 20px;
	border: 1px solid gray;
	padding:7px;
	font-weight: bold;
}
.writeForm .custom-file-upload{
	display: inline-block;
    padding:5px;
    cursor: pointer;
    background-color: transparent;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    font-weight:bold;
    position: relative;
    z-index: 3;
    
}
.writeForm .custom-file-upload:hover{
	background-color: orange;
}

.writeForm input[type = "file"]{
	display:none;
	position: absolute;
	top:563px;
	left:771px;
	
}

.writeForm input[type = "submit"]{
	background-color: transparent;
	border: none;
	padding: 5px 10px;
	font-weight: bold;
	font-size: 18px;
	margin: 0;
}
.writeForm input[type = "submit"]:hover{
	background-color: orange;
	border: none;
	cursor: pointer;
	border-radius: 20px;
	padding: 5px 10px;
}
.btn{
	width:50px;
	height:50px;
	position: relative;
}
#goToListBtn{
	background-color: transparent;
	border: none;
	position: absolute;
	top: -230px;
	left:150px;
	transform: translate(-50%, -50%);
	font-size: 30px;
	cursor: pointer;
	color: gray;
	font-weight: bold;
}
#preview{
	position:absolute;
	top:20px;
	right:100px;
	width:200px;
	height:200px;
	margin:10px;
	border-radius: 50px;
	overflow: hidden;
}
.fileName{
	display:inline-block;
	font-weight: bold;
	overflow: hidden; /* 텍스트가 넘치는 부분을 숨김 */
	white-space: nowrap; /* 텍스트가 줄 바꿈되지 않고 모두 한 줄에 표시되도록 설정 */
	text-overflow: ellipsis; /* 텍스트가 넘칠 때 "..."으로 표시 */
	width: 200px; 
	vertical-align: -3px;
}
</style>

<div class="section">
	<div class="writeForm">
		<form method="POST" enctype="multipart/form-data">
			<p>
				<input type="hidden" name="writer" placeholder="작성자 입력" value="${login.userid }" required>
			</p>
			<p>
				<input type="text" name="title" placeholder="글 제목 입력" required
					autofocus>
			</p>
			<p>
				<select name="category" class="category">
					<option selected>==카테고리 선택 ==</option>
					<option value="Lck 이야기">Lck 이야기</option>
					<option value="자유 게시판">자유 게시판</option>
					<option value="T1 응원방">T1 응원방</option>
					<option value="젠지 응원방">젠지 응원방</option>
					<option value="한화생명 응원방">한화생명 응원방</option>
					<option value="KT 응원방">KT 응원방</option>
					<option value="광동 응원방">광동 응원방</option>
					<option value="DK 응원방">DK 응원방</option>
					<option value="OK저축은행 응원방">OK저축은행 응원방</option>
					<option value="구인 구직 게시판">구인 구직 게시판</option>
					<c:if test="${login.userid == 'admin' }">
						<option value="공지">공지</option>
					</c:if>
				</select>
			</p>
			<p>
				<c:if test="${login.userid == 'admin' }">
					<label class="isNotice"><input type="checkbox" name="isNotice" value="1">공지</label>
				</c:if>
			</p>
			<p id="fileTag">
				<label for="upload" class="custom-file-upload">
					파일 선택
				</label>
				<input id="upload" type="file" name="upload" style="color:black;">
				<span class="fileName"></span>
			</p>
				<div id="preview"></div> <!-- 파일 미리보기 -->
			<textarea rows="10" cols="70" name ="content" placeholder="내용 입력" required></textarea>
			<p>
				<input type="submit" value="게시글 작성">
			</p>
		</form>
			<div class="btn">
				<a href="${cpath }/community/list"><button id="goToListBtn">X</button></a>
			</div>
	
	</div>
</div>
<script>
    // 파일 선택 시 미리보기 및 파일 이름 업데이트
    const input = document.getElementById('upload')
    const preview = document.getElementById('preview')
	const fileNameSpan = document.querySelector('#fileTag .fileName')
	
	
	
    input.addEventListener('change', () => {
        const file = input.files[0]
        if (file) {
            // FileReader 객체를 사용하여 파일을 읽음
            const reader = new FileReader()
            console.log(reader)
            reader.onload = function(e) {
                preview.style.backgroundImage = 'url(' + e.target.result + ')' // 파일 미리보기 업데이트 
              	preview.style.backgroundSize = 'cover'
              	preview.style.backgroundRepeat = 'no-repeat'
              	preview.style.backgroundPosition = 'center center'
              	
              
            }
            
           /*  const maxLength = 30
            fileName = file.name
            if(fileName.length > maxLength){
            	fileName = fileName.substring(0,maxLength) + '...' // 최대 길이보다 길어지면 ... 처리
            } */
            fileNameSpan.textContent = file.name// 파일 태그의 내용을 파일 이름으로 채움
           /*  fileNameSpan.style.display = 'inline-block'
            fileNameSpan.style.overflow = 'hidden' // 텍스트가 넘치는 부분을 숨김
            fileNameSpan.style.whiteSpace = 'nowrap' // 텍스트가 줄 바꿈되지 않고 모두 한 줄에 표시되도록 설정
            fileNameSpan.style.width = '200px'  */
            
          	//fileLabel.style.display = 'inline-block' // 파일 선택 버튼을 감싸는 label 요소를 다시 보이도록 설정
            
          	
          	
            reader.readAsDataURL(file);
        } 
    });
</script>
</body>
</html>