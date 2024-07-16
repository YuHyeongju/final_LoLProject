<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.list_main {
        width: 1380px;
        position: relative;
        margin: auto;
        
    }
    .month_ul {  
      border: 1px solid #eee;
      width: auto;
      flex-wrap: wrap;
      justify-content: space-between;
      padding: 0;
    }
    .month_li {
      	height: 50px;
      	line-height: 250%;
        display: inline-block;
        background-color: #00ADB5;
        font-size: 18px;
        width: 340px;
        text-align: center;
    }
   .month_li > .month_a {
      font-weight: 570;
      color: #151618;
      margin: 10px;
   }
    .item {
       color: #000;
    }
    .date {
       font-weight: 900;
       background-color: #cfcfcf;
       padding: 13px 15px;
       font-size: 18px;
       border-top: 1px solid #ededed;
       border-bottom: 1px solid #eee;
       margin: 0;
    }
   
    .game1 {
       border-bottom: #ededed;
    }
    .day {
        flex: 1;
        margin: auto;
        padding: 15px;
    }
    .score {
        flex: 3;
		justify-content: center;
	}
   .sub_score {
	    display: flex;
    	align-items: center;
    	justify-content: space-between;
	}
	.score_num {
		font-weight: 1000}
    .time {
        font-weight: 900;
    }
    .title {
        color:#777;
    }
    .result {
        width: 37px;
        padding: 3px 0;
        margin: 10px;
        border-radius: 3px;
        color: #a0a5b6;
        background-color: #f5f6f9;
    }
    .btns {
        flex: 1;
        text-align: right;
        margin: auto;
        padding: 10px;
    }
	.score_center {
    	display: flex;
    	align-items: center;
    	justify-content: center;	
    	text-align: center;
/*     	flex-grow: 1; */
		width: 100px;
	}

	.score_center img,
	.score_center span {
    	margin: 0 3px; /* 이미지와 점수 사이에 조금의 여백 추가 */
	}

	.score_center .divider {
    	text-align: center; /* 내부 텍스트 가운데 정렬 */
    	font-weight: bold; /* 글자 두껍게 */
    	color: #777; /* 색상 지정 */
    	margin: 0 3px; /* : 표시와 주변 요소 사이에 조금의 여백 추가 */
	}
	.leftTeam{
		width: 200px;
		text-align: right;	
	}
	.rightTeam{
		width: 200px;
	}
    button {
    	border: 1px solid #cfcfcf;
        display: inline-block;
        padding: 8px 0px;
        font-size: 13px;
        font-weight: 600;
        width: 74px;	
        cursor: pointer;
        text-align: center;	
        border-radius: 3px;
        background-color: #f5f6f9; 
        color: #777; 
    }

    button:hover {
        background-color: #eeeeee; 
    }
 </style>


<div class="list_main">
        <ul class="month_ul" >
        	<li class="month_li"><a class="month_a" href="${cpath }/game/list/2024-01">1월</a></li>
        	<li class="month_li"><a class="month_a" href="${cpath }/game/list/2024-02">2월</a></li>
        	<li class="month_li"><a class="month_a" href="${cpath }/game/list/2024-03">3월</a></li>
        	<li class="month_li"><a class="month_a" href="${cpath }/game/list/2024-04">4월</a></li>
        </ul>

    <div class="item">
          <c:forEach var="date" items="${datelist }">
           <div class="box">
              <p class="date">${date }</p>
              <c:forEach var="dto" items="${list }">
                 <c:if test="${date == dto.gameDate }">
                    <ul class="box list">
                          <li class="game1 flex">
                             <div class="day">
                                <span class="time">${dto.gameTime }</span>
                                <span class="result">${dto.status == 0 ? "종료" : dto.status == 1 ? "경기중" : "예정"}</span>
                                <span class="title">${dto.title }</span>
                             </div>
                              <div class="score flex">
                                  <div class="sub_score">
   		 							<span class="leftTeam">${dto.redTeam }</span>
   		 							<div class="score_center">
   		 								<c:if test="${not empty dto.redTeamImg }">
   		 									<img src="${dto.redTeamImg }" width="24px" height="24px">
   		 								</c:if>
	    								<span class="score_num">${dto.redScore }</span>
    									<span class="divider">:</span> <!-- : 표시할 요소 -->
    									<span class="score_num">${dto.blueScore }</span>
    									<c:if test="${not empty dto.blueTeamImg }">
   		 									<img src="${dto.blueTeamImg }" width="24px" height="24px">
   		 								</c:if>
   		 							</div>
    								<span class="rightTeam">${dto.blueTeam }</span>
								</div>
                             </div>
                             <div class="btns">
                                <div class="btn">
                                     <c:choose>
                                         <c:when test="${dto.status == 0}">
                                     
<%--                                                <a href="${cpath}/game/reVideo/${dto.idx}"> --%>
<!--                                                 <button>다시보기</button> -->
<!--                                                </a> -->
                                               <c:if test="${not empty login.userid}">
                                               <a href="${cpath}/game/MVP/${dto.idx }">
                                               <button class="mvpBtn">MVP투표</button>   
                                               </a>
                                               </c:if>  
                                         </c:when>
                                         
                                         <c:when test="${dto.status == 1}">
                                         	
                                              <a href="${cpath}/">
                                                <button>중계보기</button>
                                               </a>
                                               
                                         </c:when>
                                         <c:otherwise>
                                               <a href="${cpath}/matchPrediction">
                                                <button class="predictionBtn">예측하기</button>
                                               </a>
                                         </c:otherwise>
                                     </c:choose>
                                 </div>
                             </div>
                          </li>
                    </ul>
                 </c:if>
              </c:forEach>
           </div>
        </c:forEach>
    </div>
</div>   

</body>
</html>