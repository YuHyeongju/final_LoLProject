<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCK_Service</title>
<link type="text/css" rel="stylesheet" href="${cpath }/resources/css/header_style.css">
<link rel="shortcut icon" type="image/x-icon" href="https://new-version.download/wp-content/uploads/league-of-legends.png">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	.hiddens {
    	display: none;
    	height: 0;
	}
</style>
</head>
<body>
    <header>
        <div class="header_main_nav">
            <a href="${cpath }" style="width: 180px;">
                <img src="${cpath }/resources/image/projectLogo.jpg" width="40px" class="header_top_logo">
            </a>
            <div class="header_top_main flex">
                <div class="clol hiddens">
                    <img src="https://opgg-com-image.akamaized.net/attach/images/20190923112436.948459.gif" class="lol">
                </div>
                <span id="rainbowText" style="font-weight: bold; font-size: 25px;">League of Legends Champions Korea</span>
            </div>
            <div style="width: 180px; padding: 5px;"> 
                <div class="header_profile">
                    <c:if test="${empty login}">
                        <a href="${cpath }/member/login" style="color: white;">로그인</a>
                    </c:if>
                    <c:if test="${not empty login}">
                        <a style="color: white;">${login.userid }님</a>
                    </c:if>
                    <c:if test="${empty login }">
                    	<a href="${cpath }/member/login"><img src="https://www.studiopeople.kr/common/img/default_profile.png"
                     height="40px" width="40px" class="header_profile_img"></a>  
                    </c:if>
					<c:if test="${not empty login }">
						<a href="${cpath }/member/myPage"><img src="${cpath }/upload/${login.profile}"
                     height="40px" class="header_profile_img"></a>
					</c:if>
                    <div id="modal" class="hidden">
					    <div class="content">
					        <form id="addForm" action="">
					            <h3>계정 정보</h3>
					            <p>
					                <c:choose>
									    <c:when test="${empty login}">
									        <p>회원 정보 없습니다.</p>
									    </c:when>
									    <c:otherwise>
									        <table>
									            <thead>
									                <tr>
									                    <th>번호</th>
									                    <th>굿즈번호</th>
									                    <th>유저아이디</th>
									                    <th>상품개수</th>    
									                    <th>굿즈 이름</th>
									                    <th>굿즈 사진</th>    
									                </tr>
									            </thead>
									            <tbody>
									            <%-- <c:forEach var="memberGoods" items="${memberGoodsList}">
									                    <c:if test="${login.userid == memberGoods.userid}">
													        <tr>
													            <td>${memberGoods.idx}</td>
													            <td>${memberGoods.goodsIdx}</td>
													            <td>${memberGoods.userid}</td>
													            <td>${memberGoods.count}</td>
													        </tr>
													    </c:if>
												</c:forEach> --%>
									                <c:forEach var="memberGoods" items="${memberGoodsList}">
									                    <c:if test="${login.userid == memberGoods.userid}">
													        <tr>
													            <td>${memberGoods.idx}</td>
													            <td>${memberGoods.goodsIdx}</td>
													            <td>${memberGoods.userid}</td>
													            <td>${memberGoods.count}</td>
													            <td>${memberGoods.goodsName}</td>
													            <td><img src="${cpath }/upload/${memberGoods.goodsImage}" height="100px" width="120px"></td>		
													        </tr>
										                </c:if>
									                </c:forEach>
									                
									            </tbody>
									        </table>
									    </c:otherwise>
									</c:choose>
					                <input id="close" type="button" value="돌아가기">
					            </p>
					        </form>
					    </div>
					    <div class="overlay"></div>
					</div>
                    <div class="header_hambuger">
                        <img id="Easter_egg" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaqp21hEdWBoLlJkP18uFqogFJSYzWZn6nTg&usqp=CAU" class="header_profile_img" height="40px">
                    </div>
                </div>
            </div>
        </div>
        <nav class="header_nav">
            <div class="inner_con">
                <ul class="sub_menu">
                    <li class="sub_menu_li">
                        <a href="${cpath }/">홈</a>
                        <ul class="sub_nav">
                            <li>Hm_1</li>
                            <li>Hm_2</li>
                            <li>Hm_3</li>
                        </ul>
                    </li>
                    <li class="sub_menu_li">
                        <a href="${cpath }/community/list">커뮤니티</a>
                        <ul class="sub_nav">
                            <li>Hm_1</li>
                            <li>Hm_2</li>
                            <li>Hm_3</li>
                        </ul>
                    </li>
                    <li class="sub_menu_li">
                        <a href="${cpath }/goods/search">굿즈 응모</a>
                        <ul class="sub_nav">
                            <li>Cu_1</li>
                            <li>Cu_2</li>
                            <li>Cu_3</li>
                        </ul>
                    </li>
                    <li class="sub_menu_li">
                        <a href="${cpath }/ticketing/ticketinglist">예매</a>
                        <ul class="sub_nav">
                            <li>sb_1</li>
                            <li>sb_2</li>
                            <li>sb_3</li>
                        </ul>
                    </li>
                    <li class="sub_menu_li">
                        <a href="${cpath }/lckVideo">영상</a>
                        <ul class="sub_nav">
                            <li>vi_1</li>
                            <li>vi_2</li>
                            <li>vi_3</li>
                        </ul>
                    </li>
                    <li class="sub_menu_li">
                        <a href="${cpath }/teamRanking">순위</a>
                        <ul class="sub_nav">
                            <li>rn_1</li>
                            <li>rn_2</li>
                            <li>rn_3</li>
                        </ul>
                    </li>
                     <li class="sub_menu_li">
                        <a href="${cpath }/game/list/">일정</a>
                        <ul class="sub_nav">
                            <li>rn_1</li>
                            <li>rn_2</li>
                            <li>rn_3</li>
                        </ul>
                    </li>
                   
                    <li class="sub_menu_li">
                        <a href="${cpath }/matchPrediction">승부예측</a>
                        <ul class="sub_nav">
                            <li>wn_1</li>
                            <li>wn_2</li>
                            <li>wn_3</li>
                        </ul>
                    </li>
                    <c:if test="${login.grade == 5 }">
                    
                    <li class="sub_menu_li">
                        <a href="${cpath }/admin">관리자 페이지</a>
                        <ul class="sub_nav">
                            <li>wn_1</li>
                            <li>wn_2</li>
                            <li>wn_3</li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
        </nav>

    </header>

    <div class="header_img"></div>
    
    <script>
        // 무지개색 배열
        var rainbowColors = ['#ff0000', '#ff7f00', '#ffff00', '#00ff00', '#0000ff', '#4b0082', '#9400d3'];

        // span 요소 선택
        var spanElement = document.getElementById('rainbowText');

        // 색상 인덱스 초기화
        var colorIndex = 0;

        
    </script>

<script>
    // 문서가 모두 불러지면 특정 요소를 호출하여 이벤트를 연결하는 함수
    function loadHandler() {
    	
    }
    
    // 문서가 로드될 때 loadHandler 함수 호출
    window.addEventListener('DOMContentLoaded', loadHandler)
</script>



</body>
</html>
