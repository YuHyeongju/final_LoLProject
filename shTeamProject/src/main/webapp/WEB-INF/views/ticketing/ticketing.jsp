<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.main {
		border: none;
	}
	.A img {
		width: 200px;
	}
	.B img {
		width: 50px;
	}
	.C img {
		width: 50px;
	}
	.D img {
		width: 50px;
	}
	.E img {
		width: 50px;
	}
	.stage_seat img {
		cursor: pointer;
	}
	.stage_bg {
		background-image: url("${cpath}/resources/image/LCK_STAGE.png");
		background-position : center;
		background-repeat: no-repeat;
		background-size: 850px;
		padding: 30px;
		height: 750px;
		width: 850px;
		border: 2px solid black;
		background-color: white;
	}
	input[type="checkbox"] {
		display: none;
	}
	
	#A1 {
    	transform: translate(70px, 5px);
	}
	#A2 {
		transform: translate(375px, 5px);
	}
	#A3 {
		transform: translate(-355px, 98px);
	}
	#A4 {
		transform: translate(-30px, 98px);
	}
	#A5 {
		transform: translate(323px, 130px);
	}
	
	#B1 {
		transform: translate(55px, 5px);
	}
	#B2 {
		transform: translate(60px, 10px);
	}
	#B3 {
		transform: translate(65px, 15px);
	}
	#B4 {
		transform: translate(70px, 20px);
	}
	#B5 {
		transform: translate(-167px, 55px);
	}
	#B6 {
		transform: translate(-163px, 60px);
	}
	#B7 {
		transform: translate(-158px, 65px);
	}
	#B8 {
		transform: translate(-152px, 70px);
	}
	
	#C1 {
		transform: translate(555px, -30px);
	}
	#C2 {
		transform: translate(560px, -35px);
	}
	#C3 {
		transform: translate(565px, -40px);
	}
	#C4 {
		transform: translate(570px, -45px);
	}
	#C5 {
		transform: translate(332px, 20px);
	}
	#C6 {
		transform: translate(335px, 15px);
	}
	#C7 {
		transform: translate(341px, 10px);
	}
	#C8 {
		transform: translate(346px, 5px);
	}
	
	#D1 {
		transform: translate(115px, 15px);
	}
	#D2 {
		transform: translate(130px, 25px);
	}
	#D3 {
		transform: translate(145px, 35px);
	}
	#D4 {
		transform: translate(160px, 45px);
	}
	#D5 {
		transform: translate(175px, 55px);
	}
	#D6 {
		transform: translate(190px, 45px);
	}
	#D7 {
		transform: translate(205px, 35px);
	}
	#D8 {
		transform: translate(220px, 25px);
	}
	#D9 {
		transform: translate(231px, 15px);
	}
	
	#E1 {
		transform: translate(115px, 15px);
	}
	#E2 {
		transform: translate(130px, 25px);
	}
	#E3 {
		transform: translate(145px, 35px);
	}
	#E4 {
		transform: translate(160px, 45px);
	}
	#E5 {
		transform: translate(175px, 55px);
	}
	#E6 {
		transform: translate(190px, 45px);
	}
	#E7 {
		transform: translate(205px, 35px);
	}
	#E8 {
		transform: translate(220px, 25px);
	}
	#E9 {
		transform: translate(231px, 15px);
	}
	
	#Z1 {
		transform: translate(145px, 50px);
	}
	.stage_info {
		background-color: black;
		padding: 10px;
		margin-bottom: 10px;
	}
	
	.stage_info_title {
		color: white;
		font-size: 22px;
	}
	.stage_info_sub {
		color: gray;
		font-size: 14px;
		margin-top: auto;
	}
	.stage_ticketing {
		border: 2px solid black;
		margin-left: 10px;
		width: 33%;
		background-color: white;
	}
	.stage_ticketing_day {
		background-color: black;
		color: white;
		text-align: right;
		font-size: 20px;
		padding: 5px;
	}
	.width_120px {
		width: 120px;
	}
	.padding_10px {
		padding: 10px;
	}
	.margin_10px {
		margin: 10px;
	}
	.margin_top_auto {
		margin-top: auto;
	}
	.margin_auto {
		margin: auto;
	}
	.font-blod-size-19px {
		font-size: 19px;
		font-weight: bold;
	}
	.rectangle {
		width: 150px;
		height: 150px;
	}
	.stage_ticketin_btns {
		justify-content: space-evenly;
	}
	.stage_ticketin_btn {
		background-Color: #ffe6f2;
		font-weight: bold;
		color: #ff0080;
		width: 130px;
		height: 30px;
	}
	.team_info {
		justify-content: center;
	}
	.team_left, .team_right {
		border: 1px solid black;
		text-align: center;
	}
	.disable-click {
		pointer-events: none;
	}
</style>

<script>
    // 페이지가 로드될 때 실행되는 함수
    window.addEventListener('DOMContentLoaded', function() {
        // 만약 login이 비어있으면 로그인 페이지로 리디렉션
        <c:if test="${empty login}">
	        if (confirm("로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?")) {
	            window.location.href = "${cpath}/member/login";
	        } else {
	        	confirm("싫어도 로그인해야해요 ~")
	        	window.location.href = "${cpath}/member/login";
	        }
        </c:if>
    });
</script>




<div class="main">

	<div class="stage_info flex">
		<div class="stage_info_title">
			LCK ${game.title }
			(<fmt:formatDate value="${game.gameDate}" pattern="MM" />.
			<fmt:formatDate value="${game.gameDate}" pattern="dd" />) -
			${game.title.substring(game.title.length() - 3)}
			${game.redTeam }
			vs
			${game.blueTeam }
			&nbsp;
		</div>
		<div class="stage_info_sub">
			| ${game.stadium }
		</div>
		<div class="hidden">
		<c:forEach var="memberGoods" items="${memberGoodsList}">
			<c:if test="${login.userid == memberGoods.userid}">
				<tr>
					<td>${memberGoods.goodsName}</td>	
					<td>${memberGoods.count}</td>
				</tr>
			</c:if>
			<c:if test="${memberGoods.goodsName == '경기 관람권(1인)' && memberGoods.count <= 0}">
	            <script>
	                alert('티켓이 필요합니다');
	                window.location.href = '${cpath}/goods/search';
	            </script>
	        </c:if>
		</c:forEach>
		</div>
	</div>
	<div class="stage flex">
		<div class="stage_bg">
			<div class="stage_seat">
				<div class="A">
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/A1.png" name="A1" id="A1">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/A2.png" name="A2" id="A2">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/A3.png" name="A3" id="A3">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/A4.png" name="A4" id="A4">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/A5.png" name="A5" id="A5">
	                </label>
	            </div>
	            <div class="B">
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B1.png" name="B1" id="B1">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B2.png" name="B2" id="B2">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B3.png" name="B3" id="B3">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B4.png" name="B4" id="B4">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B5.png" name="B5" id="B5">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B6.png" name="B6" id="B6">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B7.png" name="B7" id="B7">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/B8.png" name="B8" id="B8">
	                </label>
	            </div>
				<div class="C">
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C1.png" name="C1" id="C1">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C2.png" name="C2" id="C2">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C3.png" name="C3" id="C3">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C4.png" name="C4" id="C4">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C5.png" name="C5" id="C5">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C6.png" name="C6" id="C6">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C7.png" name="C7" id="C7">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/C8.png" name="C8" id="C8">
	                </label>
	            </div>
	            <div class="D">
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D1.png" name="D1" id="D1">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D2.png" name="D2" id="D2">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D3.png" name="D3" id="D3">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D4.png" name="D4" id="D4">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D5.png" name="D5" id="D5">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D6.png" name="D6" id="D6">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D7.png" name="D7" id="D7">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D8.png" name="D8" id="D8">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/D9.png" name="D9" id="D9">
	                </label>
	            </div>
				<div class="E">
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E1.png" name="E1" id="E1">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E2.png" name="E2" id="E2">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E3.png" name="E3" id="E3">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E4.png" name="E4" id="E4">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E5.png" name="E5" id="E5">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E6.png" name="E6" id="E6">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E7.png" name="E7" id="E7">
	                </label>
	                <label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/E8.png" name="E8" id="E8">
	                </label>
	                <label>
	                	<img src="${cpath}/resources/image/STAGE_SEET_before/E9.png" name="E9" id="E9">
	                </label>
	            </div>
	            <div class="Z disable-click">
	            	<label>
	                    <img src="${cpath}/resources/image/STAGE_SEET_before/STAFF.png" name="Z1" id="Z1">
	                </label>
	            </div>
			</div>
		</div>
	
		<form class="stage_ticketing" action="${cpath}/ticketing/ticketings" method="POST"  id="ticketingForm">
			<div class="stage_ticketing_day padding_10px">
				관람일 :
				<fmt:formatDate value="${game.gameDate}" pattern="yyyy" />년
				<fmt:formatDate value="${game.gameDate}" pattern="MM" />월
				<fmt:formatDate value="${game.gameDate}" pattern="dd" />일
				(<fmt:formatDate value="${game.gameDate}" pattern="EE" />)
				${game.gameTime}
			</div>
			<div class="team_info padding_10px flex">
				<div class="team_left margin_10px rectangle">
					<img src="${cpath }/resources/image/Team_logo/${game.redTeam }.svg" width="150px" height="120px">
					${game.redTeam }
				</div>
				<span class="margin_auto">VS</span>
				<div class="team_right margin_10px rectangle">
					<img src="${cpath }/resources/image/Team_logo/${game.blueTeam }.svg" width="150px" height="120px">
					${game.blueTeam }
				</div>
				<!-- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="black">
				  <path d="M0 0h24v24H0z" fill="none"/>
				  <path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/>
				</svg> -->
			</div>
			<div class="stage_ticketing_date flex padding_10px">
				<span class="width_120px font-blod-size-19px">관람일</span>
				<input type="date" readonly id="cal_date" value="<fmt:formatDate value="${game.gameDate}" pattern="yyyy-MM-dd" />">
			</div>
			<div class="flex padding_10px">
				<span class="width_120px font-blod-size-19px">인원수</span>
				<input type="text" id="imageSeatDisplay" readonly="readonly">
				<span class="font-blod-size-19px">명</span>
			</div>
			<div class="flex padding_10px">
				<span class="width_120px font-blod-size-19px">현재 좌석</span>
				<input type="text"  id="imageIdDisplay" readonly="readonly">
			</div>
			<div class="flex padding_10px stage_ticketin_btns">
				<!-- <input type="submit" class="stage_ticketin_btn" name="autoAssignButton" value="자동 배정" onclick="autoAssign()"> -->
				<input type="submit" class="stage_ticketin_btn" name="sitesubmit" value="좌석 선택" onclick="submitTicketingForm()">
				<input type="hidden" name="gameIdx" id="gameIdx" value="${game.idx }">
		        <%-- <input type="hidden" name="gameTime" id="gameTime" value="${game.gameDate}"> --%>
		        <input type="hidden" name="seat" id="seat">
		        <input type="hidden" name="userid" id="userid" value="${login.userid}">
				<a href="${cpath }/ticketing/ticketinglist">
					<input type="submit" class="stage_ticketin_btn" name="return" value="돌아가기">
				</a>
			</div>
		</form>
	</div>

</div>

<script>
//AJAX 호출
window.addEventListener('DOMContentLoaded', function() {
    const gameIdx = '${game.idx}'; // JSP에서 게임 인덱스 가져오기
    fetch('${cpath}/ticketing/deleted-seats?gameIdx=' + gameIdx)
        .then(response => response.json())
        .then(deletedSeats => {
            // 삭제된 좌석을 반복하며 해당 좌석의 포인터 이벤트를 비활성화합니다.
            deletedSeats.forEach(seatId => {
                const seatElement = document.getElementById(seatId);
                if (seatElement) {
                    seatElement.style.pointerEvents = 'none';
                    seatElement.style.filter = "opacity(0.5) drop-shadow(0 0 0 #373737) blur(10px)"
                }
            });
        })
        .catch(error => console.error('삭제된 좌석을 가져오는 중 오류가 발생했습니다:', error));
});



// 이전에 클릭된 이미지의 참조를 저장하는 변수
let previousClickedImage = null

// 각 이미지를 클릭할 때마다 이미지의 ID 값을 텍스트 입력란에 표시하고, 클릭된 이미지의 색상을 변경하는 함수
document.querySelectorAll('.stage_seat img').forEach(img => {
    img.addEventListener('click', () => {
        // 클릭된 이미지의 ID 가져오기
        const clickedImageId = img.id
        if (previousClickedImage && previousClickedImage !== img) {
            // 이전에 클릭된 이미지의 색상 원래대로 변경
            previousClickedImage.style.filter = "grayscale(0%)"
        }

        // 이미지 클릭시 색상 변경
        if (previousClickedImage === img) {
            // 이미 자기 자신을 클릭한 경우, 색상 원래대로 변경
            img.style.filter = "grayscale(0%)" // 회색 제거
            previousClickedImage = null; // 이전에 클릭된 이미지 변수 초기화
            // 텍스트 입력란 비우기
            document.getElementById('imageIdDisplay').value = ''
            document.getElementById('imageSeatDisplay').value = ''
        } else {
        	 // 색상 변경
            img.style.filter = "opacity(0.5) drop-shadow(0 0 0 #373737) blur(10px)"
            // 텍스트 입력란에 이미지 ID 표시
            document.getElementById('imageIdDisplay').value = clickedImageId
            // 현재 클릭된 이미지를 이전에 클릭된 이미지로 설정
            previousClickedImage = img
            
            // 이미지 ID가 A1, A2, A3, A4, A5인 경우에만 document.getElementById('imageSeatDisplay').value를 5로 설정
            if (clickedImageId === 'A1' || clickedImageId === 'A2') {
                document.getElementById('imageSeatDisplay').value = 1	// 5
            } else if(clickedImageId === 'A3' || clickedImageId === 'A4' || clickedImageId === 'A5') {
            	document.getElementById('imageSeatDisplay').value = 1	// 3
            }else {
                document.getElementById('imageSeatDisplay').value = 1
            }
        }
    });
});

//자동 배정 함수
/* function autoAssign() {
    // 이미 선택된 좌석을 저장할 배열
    const selectedSeats = [];
    
    // stage_seat 아래의 모든 이미지 가져오기
    const seatImages = document.querySelectorAll('.stage_seat img');
    
    // 이미 선택된 좌석 추적
    seatImages.forEach(img => {
        if (img.classList.contains('selected')) {
            selectedSeats.push(img.id); // 이미 선택된 좌석의 ID를 배열에 추가
        }
    });
    
    // 랜덤 이미지 선택
    let randomImage;
    do {
        const randomIndex = Math.floor(Math.random() * seatImages.length);
        randomImage = seatImages[randomIndex];
    } while (selectedSeats.includes(randomImage.id)); // 이미 선택된 좌석이면 다시 선택
    
    // 랜덤 이미지를 클릭한 것처럼 처리
    randomImage.click();
} */

//"좌석 선택" 버튼 클릭 이벤트 핸들러
document.querySelector('.stage_ticketin_btn[name="sitesubmit"]').addEventListener('click', function(event) {
    // 기본 제출 동작을 막음
    event.preventDefault()
    
    // submitTicketingForm 함수 호출
    submitTicketingForm()
});

/* document.querySelector('.stage_ticketin_btn[name="autoAssignButton"]').addEventListener('click', function(event) {
    event.preventDefault()
    autoAssign()
}); */

document.querySelector('.stage_ticketin_btn[name="return"]').addEventListener('click', function(event) {
    event.preventDefault()
    window.location.href = "${cpath}/ticketing/ticketinglist"
});

</script>

<script>
function submitTicketingForm() {
    // 이미지 ID 표시
    const imageId = document.getElementById('imageIdDisplay').value;

    // 히든 필드에 값을 설정합니다.
    document.getElementById('seat').value = imageId;
    
 	// 콘솔에 출력
    console.log("히든 필드에 설정된 값:", document.getElementById('seat').value);

    // 폼을 가져와서 데이터를 설정한 뒤 제출합니다.
    const form = document.getElementById('ticketingForm');
    form.submit();
}
</script>





</body>
</html>