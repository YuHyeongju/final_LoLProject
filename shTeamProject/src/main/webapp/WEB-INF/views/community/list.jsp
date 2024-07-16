<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 - 리스트</title>
<script>
	const cpath = '${cpath}'
</script>
<style>
body{
	background-color:#eee;
}
.board {
	width: 1400px;
	max-height: max-content;
	margin: auto auto;
	
}

.category>ul {
	padding: 0;
	flex-flow: wrap;
	padding-left: 30px;
 
}

.category .item {
	width: 150px;
	height: 70px;
	font-weight: bold;
	border: 1px solid grey;
	border-radius: 20px;
	margin: 10px;
	padding: 10px;
	color: black;
	text-align: center;
	line-height: 70px;
	background-color: #6cd7d8;
}

.item>a {
	display: inline-block;
	width: 100%;
	height: 100%
}

.category .item:hover {
	background-color: orange;
	box-shadow: 4px 4px 2px 2px black;
	cursor: pointer;
}

.content {
	width: 1300px;
	max-height: max-content; 
	margin: auto;
	margin-top: 20px;
	background-color: rgb(255, 255, 240);
	
	
}

.content>.totalBoard {
	width: 1300px;
	height: 40px;
	align-items: center;
	background-color: rgba(255, 255, 240, 0.8);
	
}
.content  .writeA{
	margin-left:auto;
	margin-right: 40px;
	
}
.content h3 {
	color: black;
	padding-left: 10px;
}


.content>hr {
	border: 1px solid grey;
	margin: 0;
}

.content .allBoardBtn {
	background-color: transparent;
	border: none;
	padding: 5px 10px;
	font-weight: bold;
	font-size: 18px;
	margin: 0;
}

.content .allBoardBtn:hover {
	background-color: orange;
	border: none;
	cursor: pointer;
	border-radius: 20px;
	padding: 5px 10px;
}

/* .content .searchbar > form{
	line-height:40px;
	margin: 10px;
} */

.content #searchArea{
	border:none;
	padding:5px;
	background-color:rgb(255, 255, 240);
	font-weight: bold;
	
}
.content #searchArea:hover{
	padding:5px;
	background-color: orange;
}
.content #searchBtn {
	border: none;
	background-color: transparent;
	font-weight: bold;
	padding: 5px;
}

.content #searchBtn:hover {
	border: none;
	background-color: orange;
	border-radius: 20px;
	padding: 5px;
	cursor: pointer;
}

.content  #writeBtn {
	border: none;
	background-color: transparent;
	font-weight: bold;
	padding: 5px;
	margin: 0 10px;
	font-size: 18px;
	
}

.content  #writeBtn:hover {
	border: none;
	background-color: orange;
	border-radius: 20px;
	padding: 5px;
	cursor: pointer;
}
.boardHeader{
	background-color: rgba(255, 255, 240, 0.8);
}

.boardHeader>.categoryHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 150px;
	text-align: center;
}

.boardHeader>.writeIdxHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 100px;
	text-align: center;
}

.boardHeader>.titleHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 500px;
	text-align: center;
}

.boardHeader>.replyCountHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 100px;
	text-align: center;
}

.boardHeader>.writeDateHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 200px;
	text-align: center;
}

.boardHeader>.writerHeader {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 150px;
	text-align: center;
}



.innerContent  .category {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 150px;
	text-align: center;
}

.innerContent .writeIdx {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 100px;
	text-align: center;
}

.innerContent .title {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 500px;
	text-align: center;
	overflow: hidden;
}

.innerContent .replyCount {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 100px;
	text-align: center;
}

.innerContent .writeDate {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 200px;
	text-align: center;
}

.innerContent .writer {
	padding: 10px;
	color: black;
	font-weight: bold;
	width: 150px;
	text-align: center;
}


.innerContent > .innerContentInfo:hover {
	color: black;
	font-weight: bold;
	background-color: orange !important;
}


.innerContent>hr {
	margin: 0;
}
.innerContent > .notice{
	
}
.paging {
	width: 1400px;
	justify-content: center;
	
}

.paging>.pagingInner {
	margin: 10px;
	
	padding:10px;
}

.bold {
	font-weight: bold;
	color: red;
}
.normal{
	font-weight: bold;
}
.prev{
	font-weight: bold;
}
.next{
	font-weight: bold;
}

</style>
</head>
<body>
	<div class="board frame">
		<div class="category">
			<ul class="flex">
				<li class="item"><a
					href="${cpath}/community/list/category/LCK 이야기">LCK 이야기</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/자유 게시판">자유 게시판</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/팁과 공략">팁과 공략</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/T1 응원방">T1 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/젠지 응원방">젠지 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/한화생명 응원방">한화생명 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/KT 응원방">KT 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/광동 응원방">광동 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/DK 응원방">DK 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/피어엑스 응원방">피어엑스 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/농심 응원방">농심 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/DRX 응원방">DRX 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/OK저축은행 응원방">OK저축은행 응원방</a></li>
				<li class="item"><a
					href="${cpath}/community/list/category/구인 구직 게시판">구인 구직 게시판</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="totalBoard flex">
				<div>
					<h3 id="clickCategory">${not empty category ? paging.category :'전체 게시글'}</h3>
				</div>
				<a href="${cpath }/community/list"><button class="allBoardBtn">전체
						게시글 보기</button></a>
				<div class="searchbar flex">
					<form action="${cpath }/community/listSearch">
						<input type="search" name="search" placeholder="검색어 입력"
							id="searchArea"> <input type="hidden" name="category"
							value="${paging.category }"> <input type="submit"
							value="검색" id="searchBtn">
					</form>
				</div>
				<a class="writeA" href="${cpath }/community/addBoard"><button id="writeBtn"${not empty login.userid ? '':'disabled' }>글 쓰기</button></a>
			</div>
			<hr>
			<div class="boardHeader flex">
				<div class="categoryHeader">분류</div>
				<div class="writeIdxHeader">게시글 번호</div>
				<div class="titleHeader">게시글 제목</div>
				<div class="replyCountHeader">댓글 수</div>
				<div class="writeDateHeader">작성 날짜</div>
				<div class="writerHeader">작성자</div>
			</div>
			<hr>
			<div class="innerContent">
				<c:forEach var="dto" items="${list }">
					<div class="innerContentInfo flex" style = "background-color: ${dto.category == '공지' ? 'rgba(254, 199, 180, 0.9)': 'rgba(255, 255, 240, 0.9)'}">
						<div id = "notice"></div>				
						<div class="category" style="color:${dto.category == '공지' ? 'red' : 'black'}">${dto.category == '공지' ? '📌':''}   ${dto.category}</div>
						<div class="writeIdx">${dto.idx }</div>
						<div class="title">
							<a href="${cpath}/community/view/${dto.idx}"> ${dto.title }</a>
						</div>
						<div class="replyCount">${dto.replyCount }</div>
						<div class="writeDate">${dto.writeDate }</div>
						<div class="writer">${dto.writer }</div>
					</div>
					<hr>
				</c:forEach>
			</div>
		</div>
		<div class="paging flex">
			<div class="pagingInner">
				<c:if test="${paging.prev }">
					<a class="prev"
						href="${cpath }/community/list/${paging.begin - 1}?search=${paging.search }&category=${paging.category}">[이전]</a>
				</c:if>

				<c:forEach var="i" begin="${paging.begin}" end="${paging.end}">
					<a class="${paging.page == i ? 'bold': 'normal' }"
						href="${cpath }/community/list/${i}?search=${paging.search }&category=${paging.category}">[${i}]
					</a>
				</c:forEach>

				<c:if test="${paging.next }">
					<a class="next"
						href="${cpath }/community/list/${paging.end + 1}?search=${paging.search }&category=${paging.category}">[다음]</a>
				</c:if>
			</div>

		</div>
	</div>
	
	<script>
		// 카테고리에 따라 배경이 변경되는 스크립트
		const category = '${paging.category}'
		const innerContent = document.querySelector('.innerContent')
		const content = document.querySelector('.content')
		const innerContents = document.querySelectorAll('.innerContent .innerContentInfo')

		// 배경 이미지 객체를 저장하는 객체
		const backgroundImages = {
			'T1 응원방' : 'T1.png',
			'젠지 응원방' : '젠지.png',
			'한화생명 응원방' : '한화생명.png',
			'KT 응원방' : 'kt롤스터.png',
			'광동 응원방' : '광동프릭스.png',
			'DK 응원방' : 'KIA.png',
			'피어엑스 응원방' : '피어엑스.png',
			'농심 응원방' : '농심레드포스.png',
			'OK저축은행 응원방' : 'ok저축은행.png',
			'DRX 응원방' : 'DRX.png'
		};

		// 해당 카테고리에 대한 배경 이미지 설정
		if (backgroundImages.hasOwnProperty(category)) {
			//hasOwnProperty : 객체가 특정 속성을 직접 소유하고 있는지 확인
			const backgroundImageUrl = cpath + '/resources/image/'
					+ backgroundImages[category]
			innerContent.style.backgroundImage = 'url(' + backgroundImageUrl + ')'
			innerContent.style.backgroundRepeat = 'no-repeat'
			innerContent.style.backgroundPosition = 'center center'
			
				

			if(innerContents.length < 6){
				innerContent.style.backgroundSize = '20%'
				innerContent.style.maxHeight = 'max-content'
				
				
			}
			if(innerContents.length < 2){
				innerContent.style.backgroundSize = '10%'
				innerContent.style.maxHeight = 'max-content'
				
				
			}
			
		}
	</script>
</body>
</html>
