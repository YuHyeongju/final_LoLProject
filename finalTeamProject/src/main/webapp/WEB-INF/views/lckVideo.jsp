<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-color: #eeeeee;
	}
    .video-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        max-width: 2600px; /* Enough for 4 videos per row with margin */
    	margin-top: 20px;
    }
    .video-item {
        margin: 10px;
        width: 400px;
        overflow: hidden;
		display: block;
    }
    .video-item img {
        width: 100%;
        height: auto;
    }
    .video-title {
        display: block;
        margin-top: 5px;
        font-size: 20px;
        color: #eeeeee;
        text-decoration: none;
        text-align: center;
        background-color: #222831;
    	padding: 5px 0; /* 타이틀 내부의 상하 패딩으로 공간 확보 */
    }
    .show-more-container {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }
    .show-more {
        padding: 10px 40px; /* Adjust padding to make it more elliptical */
        background-color: #00adb5; /* Example button color */
        color: white; /* Text color */
        border: none; /* Remove border */
        cursor: pointer;
        border-radius: 20px; /* Rounded edges for an elliptical shape */
        outline: none; /* Remove outline */
        font-size: 16px; /* Adjust font size as needed */
    	margin-bottom: 30px;
    }
</style>
</head>
<body>

<div class="video-container">
    <c:forEach items="${videos}" var="video" varStatus="status">
        <div class="video-item" style="${status.index < 12 ? 'display: block;' : ''}">
            <a href="${video.videoUrl}" target="_blank">
                <img src="${video.imageUrl}" alt="Video thumbnail">
                <span class="video-title">${video.title}</span>
            </a>
        </div>
    </c:forEach>
</div>

<div class="show-more-container">
    <button class="show-more" onclick="showMoreVideos()">더 보기</button>
</div>

<script>
let currentDisplayLimit = 12; // 현재 표시된 영상의 최대 수

// 페이지 로딩 시 초기 설정
document.addEventListener('DOMContentLoaded', function() {
    showInitialVideos();
});

function showInitialVideos() {
    var videos = document.querySelectorAll('.video-item');
    for (var i = 0; i < videos.length; i++) {
        videos[i].style.display = i < currentDisplayLimit ? 'block' : 'none';
    }
}

// "더 보기" 버튼 클릭 시 추가 영상 표시
function showMoreVideos() {
    var videos = document.querySelectorAll('.video-item');
    let newLimit = currentDisplayLimit + 12; // 다음 표시할 영상의 수

    for (var i = currentDisplayLimit; i < videos.length && i < newLimit; i++) {
        videos[i].style.display = 'block';
    }

    currentDisplayLimit = newLimit; // 현재 표시된 영상의 수 업데이트

    if (currentDisplayLimit >= videos.length) {
        document.querySelector('.show-more').style.display = 'none'; // 모든 영상이 표시되면 버튼 숨김
    }
}
</script>


</body>
</html>
