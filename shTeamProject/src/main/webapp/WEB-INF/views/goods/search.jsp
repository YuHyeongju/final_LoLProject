<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
.search_none {
	position: absolute;
	top: 20%;
	left: 27%;
	width: 900px;
	height: 600px;
	border: 2px solid black;
	border-radius: 15px;
	display: flex;
	align-items: center;
	flex-flow: column;
}

input[type="search"] {
	width: 300px;
	height: 40px;
	border-radius: 10px;
}

table {
	border-collapse: collapse;
	margin-top: 20px;
	width: 700px;
}

th, td {
	text-align: center;
}

#item:hover {
	cursor: pointer;
	background-color: lightgrey;
}

.content {
	margin: auto;
	width: 1050px;
	/* border: 1px solid green; */
	height: auto;
	padding: 10px;
	display: flex;
	flex-wrap: wrap; /* 자식 요소가 너비를 초과하면 다음 줄로 내려감 */
	justify-content: space-between;
	background-color: white;
	border: 10px solid transparent;
	transition: box-shadow 0.3s ease-in-out;
}

.content:hover, .content:focus {
	box-shadow: 0 0 0 3px #000;
}

.box {
	border: 1px solid #B9C9EE;
	margin: 5px;
	border-radius: 10%;
	text-align: center;
}

.box:hover {
	border: 1px solid #625bca;
}

.textbox {
	padding: 5px 0;
}

.imgbox {
	height: 120px;
	width: 200px;
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.imgbox>img {
	max-height: 100%;
	max-width: 100%;
}

.line {
	border-top: 1px solid #B9C9EE;
	width: 100%;
}

.btnbox {
	padding: 10px 0;
}

.btnbox>p {
	padding-bottom: 10px;
}

p {
	margin: 0;
}

.flex>button {
	margin: 5px 15px;
}

.flex {
	justify-content: center;
}

.top_content {
	width: 1050px;
	/* border: 1px solid black; */
	margin: auto;
	text-align: right;
	padding: 10px;
}

#myTicket {
	text-align: left;
}

.main {
	border: none;
	top: 0;
}

button {
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
input[type="submit"]{
	all : unset;
	border: 1px solid #00adb5;
	font-size: 13px;
	height: 20px;
	border-radius: 10px;
	padding: 5px;
	font-weight: 600;
	cursor: pointer;
}
form{
	display: flex;
	justify-content: center;
}
</style>

<div class="main">
	<section class="search">
		<!-- <h2 align="center">상품 조회</h2>
   <form style="text-align: center;">
      <input type="search" name="search" id="searchInput" placeholder="검색할 상품 입력">
      <input type="submit" value="검색">
   </form> -->
		<h2 align="center">상품 거래소</h2>
		<div class="top_content">
			<c:if test="${login.userid == 'admin'}">
				<a href="${cpath }/goods/add"><button>추가</button></a>
			</c:if>
			<div id="myTicket">티켓 개수 : ${login.ticket}</div>
		</div>
		<div class="content font-sokcho">
			<c:forEach var="goods" items="${list }">
				<div class="box" id="goods" idx=${goods.idx }>
					<div class="textbox">${goods.name }</div>
					<div class="imgbox">
						<img src="${cpath }/upload/${goods.image}">
					</div>
					<div class="line"></div>
					<div class="btnbox">
						<p class="ticketCount">차감 교환권 개수 : ${goods.ticketCount }</p>
						<p>상품 개수 : ${goods.productCount }</p>
						<c:if
							test="${goods.productCount > 0 && login.ticket >= goods.ticketCount}">
							<form action="${cpath}/member/updateTicket/${goods.idx}"
								method="POST">
								<input type="hidden" name="ticket" value="${goods.ticketCount }">
								<input type="hidden" name="memberIdx" value="${login.idx }">
								<input type="submit" value="교환하기">
							</form>
						</c:if>
						<!-- 
               상품 : ${goods.idx }
               로그인 : ${login.idx }
                -->
					</div>
				</div>
			</c:forEach>
		</div>


	</section>
</div>
<script>
   const empty = '${isEmpty}'
   const search = document.querySelector('.search')
   if(empty != '') {
      var msg = document.createElement('h2')
      msg.innerText = '현재 등록된 상품이 없습니다'
      msg.style.position = 'absolute'
      msg.style.top = '45%'
      msg.style.left = '32%'
      var childElements = search.children
      for(let i = 0; i < childElements.length; i++) {
         search.removeChild(childElements[i])
      }
      search.appendChild(msg)
   }

   document.querySelectorAll('.imgbox').forEach(imgbox => {
       // 만약 login.userid가 admin인 경우에만 클릭 이벤트를 바인딩합니다.
       if ('${login.userid}' === 'admin') {
           imgbox.onclick = function() {
               const idx = imgbox.parentNode.getAttribute('idx');
               location.href = '${cpath}/goods/view/' + idx;
           };
       }
   });
   
</script>





</body>
</html>