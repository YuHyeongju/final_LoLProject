<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<style>
		.search {
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
			border: 1px solid green;
			height: auto;
			padding: 10px;
			display: flex;
            flex-wrap: wrap; /* 자식 요소가 너비를 초과하면 다음 줄로 내려감 */
            justify-content: space-between;
            background-color: white;
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
		.imgbox > img {
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
		.btnbox > p {
			padding-bottom: 10px;
		}
		p {
			margin: 0;
		}
		.flex > button {
			margin: 5px 15px;
		}
		.flex {
			justify-content: center;
		}
		.top_content {
			width: 1050px;
			border: 1px solid black;
			margin: auto;
			text-align: right;
			padding: 10px;
		}
	</style>

	<section class="search">
		<h2 align="center">상품 조회</h2>
		<form>
			<input type="serach" name="search" placeholder="검색할 상품 입력">
			<input type="submit" value="검색">
		</form>
		
		<div class="main">
			<h1>Goods</h1>
			<div class="top_content">
				<button><a href="${cpath }/goods/add.jsp">추가</a></button>
			</div>
			
			<div class="content font-sokcho">
				<c:forEach var="item" items="${list }">
					<div class="box"  id="item" idx=${goods.idx }>
						<div class="textbox">
							${goods.name }
						</div>
						<div class="imgbox">
							<img src="${cpath }/upload/${goods.image}">
						</div>
						<div class="line"></div>
						<div class="btnbox">
							<p>차감 응원권 개수 : ${goods.ticketCount }</p>
							<a href="#">교환하기</a>
							<div class="flex">
								<button>수정</button>
								<button>삭제</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	    </div>
	</section>
	
	<script>
	const empty = '${isEmpty}'
	const search = document.querySelector('.search')
	
	if(empty != '') {
		var msg = document.createElement('h2')
		msg.innerText = '현재 등록된 상품이 없습니다'
		var childElements = search.children
		for(let i = 0; i < childElements.length; i++) {
			search.removeChild(childElements[i])
		}
		search.appendChild(msg)
	}
	
	const item = document.getElementById('item')
	item.onclick = function() {
		location.href = '${cpath}/goods/view/' + item.getAttribute('idx')
	}
</script>


</body>
</html>