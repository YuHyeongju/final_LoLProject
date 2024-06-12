<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style type="text/css">
	body {
		background-color: #eeeeee;
	}

.backgroundlogoimg{
	
  	position: fixed;
  	top: 13%;
  	left:17%;
    width: 80%;
    height: 80%;
    background-repeat: no-repeat;
    background-size:cover;
    background-position:center;
    opacity: 0.5; /* 배경 이미지에 투명도 적용 */
    z-index: -1; /* 콘텐츠가 배경 이미지 위에 오도록 설정 */

}
table {
    border-collapse: collapse;
}



.table-wrap {
	margin-top: 50px;
    margin-right: 90px;
}

.TeamCoach table {
    min-width: 500px; /* 테이블의 최소 너비 설정 */
    table-layout: fixed; /* 선택적: 테이블 레이아웃을 고정하여 열 너비가 일정하게 유지되도록 함 */
}


.TeamCoach th, .TeamCoach td {
    padding: 10px; /* 셀의 패딩 조정 */
    border: 1px solid #ddd;
    text-align: left;
    word-break: break-word; /* 긴 단어가 있을 경우 줄바꿈 */
    color: #222831;
}
.TeamCoach th {
	color: #222831;
}

thead > th {
    background-color: #eeeeee;
    text-align: center;
}



.coach > tr > td:nth-child(2), .teaminfo > tr > td:nth-child(2) {
    font-weight: bold;
    text-align: center;
}

tbody > tr:nth-child(odd) {
    background-color: #eeeeee;
}

tbody > tr:nth-child(even) {
    background-color: #eeeeee;
}

.common-container, .teaminfo-container {
    position: relative;
    z-index: 1; /* 배경보다 상위에 콘텐츠를 위치시킵니다 */
	}


.common-container { /* 공통 컨테이너 스타일 추가 */
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    margin-top: 50px;
	gap:10px;
	padding: 20px;
}


.teaminfo-container {
	position:relative;
	display: flex;
	flex-direction: column;
    flex-wrap: wrap;
    justify-content: space-around;
    align-items: flex-start;
     /* 수정: 상단 여백 제거 */
    max-width: 1200px;
    gap: 20px;
}

.teaminfo-row {
    display: flex;
    justify-content: center;
    gap: 20px; /* 선수 정보 항목 사이의 간격 */
}
.second-row {
	display: flex;
	justify-content: center;
	width: 100%;
}




.teaminfo-item {
    margin: 10px;
    text-align: center;
    font-size: 1.2em;
    color: black;
    flex: 1 1 30%;
    flex-basis: 30%;
    color: #222831;
   
}

.teaminfo-item > br + * {
  font-weight: bold;
  display: block;
  text-align: center;
  margin-top: 5px;
  
}

.teaminfo-item img {
    width: 300px;
    height: auto;
    margin-bottom: 20px;
    
}


</style>

<body>

    <c:forEach var="dto" items="${list}">
    <div class="backgroundlogoimg" style="background-image: url(${dto.teamimg})"></div>
    <div class="common-container">
        <div class="table-container">
            <div class="table-wrap">
                <table class="TeamCoach">
                    <thead>
                        <tr>
                            <th>코칭 스태프</th>
                            <th>이름</th>
                        </tr>
                    </thead>
                    <tbody class="coach">
                        <c:forEach var="dto" items="${list}">
                            <tr>
                                <td>감독</td>
                                <td>${dto.headCoach}</td>
                            </tr>
                            <tr>
                                <td>코치</td>
                                <td>${dto.coach}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="teaminfo-container">
            <c:forEach var="dto" items="${list}">
            <div class="teaminfo-row">
                <div class="teaminfo-item">
                    <img alt="" src="${dto.topImageURL}"><br>TOP<br>${dto.top}
                </div>
                <div class="teaminfo-item">
                    <img alt="" src="${dto.jungleImageURL}"><br>JGL<br>${dto.jungle}
                </div>
                <div class="teaminfo-item">
                    <img alt="" src="${dto.midImageURL}"><br>MID<br>${dto.mid}
                </div>
              </div>
             <div class="teaminfo-row second-row">
                <div class="teaminfo-item">
                    <img alt="" src="${dto.adCarryImageURL}"><br>AD<br>${dto.adCarry}
                </div>
                <div class="teaminfo-item">
                    <img alt="" src="${dto.supporterImageURL }"><br>SUP<br>${dto.supporter}
                </div>
             </div>
            </c:forEach>
        </div>
    </div>
   
 </c:forEach>





</body>
</html>
