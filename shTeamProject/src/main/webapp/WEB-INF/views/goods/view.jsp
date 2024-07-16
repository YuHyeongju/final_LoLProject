<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#itemInfo {
		border: 2px solid blue;
		border-radius: 10px;
		width: 600px;
		height: 500px;
		margin: 0 auto;
		margin-top: 30px;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-flow: column;
	}

	.imgbox {
			height: 120px;
			width: 200px;
			justify-content: center;
			align-items: center;
		}
	.imgbox > img {
		max-height: 100%;
		max-width: 100%;
	}
</style>

<section id="itemInfo">
	<div id="itemInfoInner">
		<p>상품번호 : ${dto.idx }</p>
		<p>상품명 : ${dto.name }</p>
		<p>교환 응원권 개수 : ${dto.ticketCount }</p>
		<p>교환된 개수 : ${dto.saled }</p>
		<p class="imgbox">
			<img src="${cpath }/upload/${dto.image}">
		</p>
		<p>
			재고 : <span>${dto.productCount }</span>
			<button id="plus">➕</button>
			<button id="minus">➖</button>
			<button><a href="${cpath }/goods/search">돌아가기</a></button>
		</p>
	</div>
	<div>
		<a href="${cpath }/goods/delete/${dto.idx}"><button>판매 중지</button></a>
	</div>
</section>
<script>
	const plusBtn = document.getElementById('plus')
	const minusBtn = document.getElementById('minus')
	
	function plusHandler(event) {
		const url = '${cpath}/goodsPlus?idx=' + ${dto.idx}
		fetch(url)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					const span = event.target.parentNode.querySelector('span')
					span.innerText = +span.innerText + 1
				}
			})
	}
	
	function minusHandler(event) {
		const url = '${cpath}/goodsMinus?idx=' + ${dto.idx}
		fetch(url)
			.then(resp => resp.text())
			.then(text => {
				if(text == 1) {
					const span = event.target.parentNode.querySelector('span')
					span.innerText = +span.innerText - 1
				}
			})
	}
	plusBtn.onclick = plusHandler
	minusBtn.onclick = minusHandler
</script>

</body>
</html>