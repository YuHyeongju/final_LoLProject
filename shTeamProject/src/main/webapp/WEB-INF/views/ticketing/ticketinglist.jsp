<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
   
   <Style>
      .list {
         /* border: 1px solid blue; */
         width: 1080px;
         margin: auto;
         height: 3000px;
         background-color: #eee;
         padding: 10px 0;
      }
      .ticket {
         width: 980px;
         height: 120px;
         background-color: white;
         margin: 10px auto;
         border-left: 2px solid #6cd7d8;
         justify-content: space-between;
         
      }
      .on {
         border-left: 2px solid #ff655b;
      }
      .old {
         border-left: 2px solid gray;
      }
      .left {
         text-align: center;
         justify-content: center;
         align-items: center;
          justify-content: space-between;
          width: 100%;
          padding: 0 25px;
      }
      .right {
         width: 170px;
         height: 100%;
         float: right;
         background-color: #6cd7d8;
         text-align: center;
          justify-content: center;
          display: flex;
          align-items: center;
          color: white;
      }
      .right > a {
         color: white;
      }
      .dayon {
         background-color: #ff655b;
      }
      .dayold {
         background-color: gray;
      }
      .t_date {
         align-items: baseline;
      }
      .t_date > .t_month, .t_day {
         font-size: 40px;
      }
      .t_time {
         font-size: 40px;
      }
      .t_home_title {
         text-align: left;
         font-size: 12px;
         color: gray;
      }
      .v-line {
         border-left: 1px solid gray;
         height: 45px; 
      }
      .top_btn {
         justify-content: center;
         padding: 10px;
         background-color: #2f323a;
      }
      .top_btn > button {
         margin-left: 15px;
         border: none;
         color: white;
         background-color: #2f323a;
         font-size: 16px;
      }
      .disable-click {
          pointer-events: none;
      }
      .ticket_topimg {
         background-image: url("https://ticketimage.interpark.com/TicketImage/sports/web/bg/PE021.jpg");
         height: 282px;
          padding-top: 22px;
          background-position: center;
      }
      .main {
      	border: none;
      	top: 0;
      }
   </Style>
   
   <div class="ticket_topimg">
      
   </div>
      
    <div class="top_btn flex">
        <button id="pastGamesBtn" class="font-sokcho">종료된 경기</button>
        <button id="ongoingGamesBtn" class="font-sokcho">진행중인 경기</button>
        <button id="futureGamesBtn" class="font-sokcho">예정인 경기</button>
        <button id="allGamesBtn" class="font-sokcho">전체 일정보기</button>
        <button id="prevPageBtn" class="font-sokcho">이전 페이지</button>
          <button id="nextPageBtn" class="font-sokcho">다음 페이지</button>
    </div>
   <div class="main">
       <div class="list">
          <span class="flex font-sokcho" style="margin: 10px auto; width: 980px; font-size: 24px;">예매하기</span>
           <c:forEach var="game" items="${gameList}">
               <div class="ticket flex" data-status="${game.status}">
                   <div class="left flex">
                       <div class="t_date flex font-sokcho">
                           <p class="t_month"><fmt:formatDate value="${game.gameDate}" pattern="MM" /></p>.
                           <p class="t_day"><fmt:formatDate value="${game.gameDate}" pattern="dd" /></p>
                           <p class="t_week">(<fmt:formatDate value="${game.gameDate}" pattern="EE" />)</p>
                       </div>
                       <div class="v-line"></div>
                       <div class="t_time font-sokcho">${game.gameTime}</div>
                       <div class="v-line"></div>
                       <div class="t_title">2024 LCK ${game.title } (<fmt:formatDate value="${game.gameDate}" pattern="MM" />.<fmt:formatDate value="${game.gameDate}" pattern="dd" />) - ${game.title.substring(game.title.length() - 3)}</div>
                       <div class="v-line"></div>
                       <div class="t_home">
                           <div class="t_home_title">홈</div>
                           <div class="t_home_location">${game.stadium }</div>
                       </div>
                   </div>
                   <div class="right flex">
                       <a href="<c:url value="/ticketing/ticketing?idx=${game.idx}" />">판매예정<br>
                       <span style="font-size: 13px;">
                          <fmt:formatDate value="${game.gameDate}" pattern="MM" />월
                          <fmt:formatDate value="${game.gameDate}" pattern="dd" />일
                          14시 오픈
                          </span></a>
                   </div>
               </div>
           </c:forEach>
       </div>  
   </div>
   
   
<script>
    $(document).ready(function() {
        var pageSize = 4; // 한 페이지에 표시될 항목 수
        var currentPage = 0; // 현재 페이지 인덱스

        // 주어진 페이지에 대한 티켓 렌더링 함수
        function renderTickets(startIndex) {
            $(".ticket").hide(); // 모든 티켓 숨기기
            $(".ticket").slice(startIndex, startIndex + pageSize).show(); // 현재 페이지에 해당하는 티켓만 표시
        }

        // 페이지 네비게이션을 처리하는 함수
        function navigateToPage(page) {
            currentPage = page;
            var startIndex = currentPage * pageSize;
            renderTickets(startIndex);
        }
      
        // 페이지 로딩 후 초기 페이지 렌더링
        renderTickets(0); // 변경된 부분        
        
        // 다음 페이지 버튼 클릭 처리
        $("#nextPageBtn").click(function() {
            if ((currentPage + 1) * pageSize < $(".ticket").length) {
                navigateToPage(currentPage + 1);
            }
        });

        // 이전 페이지 버튼 클릭 처리
        $("#prevPageBtn").click(function() {
            if (currentPage > 0) {
                navigateToPage(currentPage - 1);
            }
        });

        // 현재 날짜를 가져오는 함수
        function getCurrentDate() {
            var currentDate = new Date();
            var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
            var day = currentDate.getDate();
            return { month: month, day: day };
        }

        // 종료된 경기인지 확인하는 함수
        function isPastGame(gameMonth, gameDay, currentMonth, currentDay) {
            return (gameMonth < currentMonth || (gameMonth === currentMonth && gameDay < currentDay));
        }

        // 진행중인 경기인지 확인하는 함수
        function isOngoingGame(gameMonth, gameDay, currentMonth, currentDay) {
            return (gameMonth === currentMonth && gameDay === currentDay);
        }

        // 현재 날짜를 가져옵니다.
        var currentDate = getCurrentDate();
        var currentMonth = currentDate.month;
        var currentDay = currentDate.day;

        $(".ticket").each(function() {
            var gameMonth = parseInt($(this).find(".t_month").text());
            var gameDay = parseInt($(this).find(".t_day").text());

            if (isPastGame(gameMonth, gameDay, currentMonth, currentDay) || isOngoingGame(gameMonth, gameDay, currentMonth, currentDay)) {
                // 게임이 이미 지난 경우
                $(this).addClass("old");
                $(this).find(".right").addClass("dayold");
                $(this).find(".right").addClass("disable-click");
                $(this).find(".right span").hide();
                $(this).find(".right a").text("판매 종료");
            } else if (((gameMonth == currentMonth && gameDay >= currentDay) && // 같은 달이면서 현재 날짜 이후의 경우
                          (gameMonth == currentMonth && gameDay <= currentDay + 4)) ||
                     (gameMonth == currentMonth + 1 && gameDay <= 3)) { // 다음 달이면서 3일 이내의 경우
                $(this).addClass("on");
                $(this).find(".right").addClass("dayon");
                $(this).find(".right span").hide();
                $(this).find(".right a").text("예매하기");
            } else {
                // 그 외의 경우
                $(this).find(".right").addClass("disable-click");
            }
        });

        // 종료된 경기 버튼 클릭 시 실행되는 함수
        function showPastGames() {
            var currentDate = getCurrentDate();
            $(".ticket").each(function() {
                var gameDate = $(this).find(".t_month").text() + $(this).find(".t_day").text();
                if (gameDate < currentDate.month.toString().padStart(2, '0') + currentDate.day.toString().padStart(2, '0')) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
            navigateToPage(0);
        }

        // 진행중인 경기 버튼 클릭 시 실행되는 함수
        function showOngoingGames() {
            var currentDate = getCurrentDate();
            $(".ticket").each(function() {
                var gameDate = $(this).find(".t_month").text() + $(this).find(".t_day").text();
                if (gameDate === currentDate.month.toString().padStart(2, '0') + currentDate.day.toString().padStart(2, '0')) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        // 예정인 경기 버튼 클릭 시 실행되는 함수
        function showFutureGames() {
            var currentDate = getCurrentDate();
            $(".ticket").each(function() {
                var gameDate = $(this).find(".t_month").text() + $(this).find(".t_day").text();
                if (gameDate > currentDate.month.toString().padStart(2, '0') + currentDate.day.toString().padStart(2, '0')) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        }

        // 전체 일정보기 버튼 클릭 시 실행되는 함수
        function showAllGames() {
            $(".ticket").show();
        }

        // 각 버튼에 대한 클릭 이벤트 핸들러 추가
        $("button:nth-child(1)").click(showPastGames);
        $("button:nth-child(2)").click(showOngoingGames);
        $("button:nth-child(3)").click(showFutureGames);
        $("button:nth-child(4)").click(showAllGames);
    });
</script>



</body>
</html>