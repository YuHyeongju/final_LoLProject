<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp" %>
<style type="text/css">
	body {
		background-color: #eeeeee;
	}
   .LiveLCK {
      display: flex;
      justify-content: center;
      margin-top: 70px;
      margin-bottom: 50px;
   
   }
   .carousel-container {
    position: relative;
    display: flex;
    align-items: center; /* 버튼을 수직 중앙에 정렬 */
	width: 100%;
	margin-top: 50px;
	}
   
    .video-carousel-wrapper {
    	position: relative;
        width: 1005px; 
        margin: auto;
        overflow-x: hidden;
        overflow-y: hidden;
        
    }
    
  	#prev, #next {
    cursor: pointer;
    padding: 10px 20px; /* 버튼 크기 조정 */
    color:#eeeeee;
    background-color: #00adb5; /* 배경색 변경 가능 */
    border: none;
  	position: absolute;
  	top: 50%;
  	font-size: 18px; /* 버튼 텍스트 크기 */
  	transform: translateY(-50%);
  	
	}
	
	#prev {
    	left: 40px;
	}
	
	#next {
	    right: 35px; /* 오른쪽 버튼 위치 조정 */
	}
   
    
    
    
    .video-container-group {
        display: flex;
        transition: transform 0.5s ease-out; /* 부드러운 이동 효과 */
    }
    
    
    .video-container {
       margin-right: 30px;
       width:320px;
       height: 180px;
       flex-shrink: 0;
       

   }
   
   .video-container:last-child {
        margin-right: 0;
    }
   
   
   
    video, .fallback-image {
        width: 100%; /* 컨테이너에 맞게 조정 */
        height: 100%; /* 컨테이너에 맞게 조정 */
    }
 
 /* new-video*/
 
    
  .new-carousel-container {
    position: relative;
    display: flex;
    align-items: center;
    width: 100%;
    margin-top: 50px;  
	}
	
	
	/* 캐러셀의 비디오 래퍼와 그룹에 대한 스타일 */
	.new-video-carousel-wrapper {
	    position: relative;
	    width: 1005px; /* 캐러셀의 너비 조정 */
	    margin: auto;
	    overflow-x: hidden;
        overflow-y: hidden;
	}
	/* 이전/다음 버튼 스타일 */
	.prev-btn, .next-btn {
	    cursor: pointer;
	    padding: 10px 20px;
	    color:#eeeeee;
	    background-color: #00adb5; /* 버튼 배경색 */
	    border: none;
		position:absolute;
		top:50%;
		font-size: 18px; /* 버튼 텍스트 크기 */
	    transform: translateY(-50%);
	    
	}
	.prev-btn {
	    left: 40px; /* 왼쪽 버튼 위치 조정 */
	}
	
	.next-btn {
	    right: 35px; /* 오른쪽 버튼 위치 조정 */
	}
	
	.new-video-container-group {
	    display: flex;
	    transition: transform 0.5s ease; /* 부드러운 전환 효과 */
	}

	/* 새 비디오 컨테이너 스타일 */
	.new-video-container {
		display:flex;
		flex-direction: column;
		align-items : center;
	    margin-right: 30px; /* 항목 사이 간격 */
	    width: 320px; /* 비디오 항목의 최소 너비 */
	    flex-shrink: 0; /* 비디오 항목의 축소 방지 */
	    
	}
	.new-video-container:last-child {
		margin-right: 0;
	}
	.new-video-container a {
	    text-decoration: none;
	    color: black; /* 링크 색상 */
	}
	
	.new-video-container img {
	    width: 100%; /* 이미지를 컨테이너에 맞게 조정 */
	    height: 180px; /* 이미지의 높이를 자동으로 조정 */
	}
	.video-title {
		display:block;
		text-align : center;
	    width: 100%;
	    margin-top: 10px;
	    margin-left: auto; /* 왼쪽 마진 자동 */
    	margin-right: auto; /* 오른쪽 마진 자동 */
	    color: #222831;
	}
	



    
    
    
    
   
   
   
</style>
</head>
<body>
  
   
   
     <!-- YouTube 비디오를 담을 컨테이너 -->
   <div class="LiveLCK">
       <div id="player"></div>
   </div>
   
   
 <div class="new-carousel-container">
    <button class="prev-btn">&lt;</button>
    <div class="new-video-carousel-wrapper">
        <div class="new-video-container-group" id="new-carousel-group">
            <!-- 비디오 목록을 JSTL forEach 루프를 사용해 여기에 추가 -->
            <c:forEach items="${videos}" var="video" varStatus="status">
                <div class="new-video-container" style="${status.index < 8 ? 'display: flex;' : 'display: none;'}">
                    <a href="${video.videoUrl}" target="_blank">
                        <img src="${video.imageUrl}" alt="Video thumbnail">
                        <span class="video-title">${video.title}</span>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
    <button class="next-btn">&gt;</button>
</div>
   
   
   
   
<div class="carousel-container">   
	<button id="prev">&lt;</button>
<div class="video-carousel-wrapper" >
  <div class="video-container-group" id="carousel-group">
  
   <div class="video-container active" id="container1">
       <video id="video1" controls></video>
       <img class="fallback-image" id="fallback-image1" alt="" src="https://nng-phinf.pstatic.net/MjAyNDAyMTVfMjEz/MDAxNzA3OTI0MTIxNDc2.gTIYU3j1D-vSLBjARzUVkgqPJJQ0DTb-tX6QzDC8AXAg.uLj_o6VLu8Fm9pOamC7G4wlqMiZ8KNKPCLx3Nevxxhkg.PNG/0215_%EC%B9%B4%EC%82%AC%EB%94%983.png">
   </div>
   
   <div class="video-container" id="container2">
       <video id="video2" controls></video>
       <img class="fallback-image" id="fallback-image2" alt="" src="https://nng-phinf.pstatic.net/MjAyMzEyMjBfNDkg/MDAxNzAzMDU1NjA1MTY2.bCUbi8bRvnKsF6Gmw_EIPrll1fPYTkJzTDo243vchEEg.JIYN6Ve8RVWFNqjdiwrEImVAAK4s-bNrJRRGA0ikM8sg.JPEG/%EA%B7%B8%EC%9C%BD.jpg" >
   </div>
   
   <div class="video-container" id="container3">
       <video id="video3" controls></video>
       <img class="fallback-image" id="fallback-image3" alt="" src="https://nng-phinf.pstatic.net/MjAyNDAyMTRfNDMg/MDAxNzA3OTA5MTQ5NDU4.G5K-PKWURUPk7PC42iPSXn6YSOBF2I2PAW1Smzt0Wk4g.nwSoSF4VAZshbbuf2ksHk68NA5dZTqhFequVgvGWEHgg.JPEG/333333.jpg">
   </div>
   
   <div class="video-container" id="container4">
       <video id="video4" controls></video>
       <img class="fallback-image" id="fallback-image4" alt="" src="https://nng-phinf.pstatic.net/MjAyMzEyMjBfMTMw/MDAxNzAzMDUxNzA1NTA5.g_uSuAAi_FZgVW5lXWBXBy0Iw4vVX4M_oXrgPs0so04g.HIQH9g-GL62n5xU7sp8Yn7-mq91mJPyjMpZUHejm48sg.JPEG/KakaoTalk_20231220_145418378.jpg">
   </div>
   
   <div class="video-container" id="container5">
       <video id="video5" controls></video>
       <img class="fallback-image" id="fallback-image5" alt="" src="https://nng-phinf.pstatic.net/MjAyMzEyMTlfMTk1/MDAxNzAyOTYyODMwMjk5.4ZFVeyiMnFZN1LxYfLmyua402NJGJ-nPtwL7TKyrcBgg.7TpsVurMp20Fs6XHlRMUQf-JqmIu0PyNp2MolURABwQg.PNG/KakaoTalk_20231219_140925744.png">
   </div>
   
   <div class="video-container" id="container6">
       <video id="video6" controls></video>
       <img class="fallback-image" id="fallback-image6" alt="" src="https://nng-phinf.pstatic.net/MjAyMzEyMThfODUg/MDAxNzAyODkwOTExNjcx.eNZNw7jE2uVB9ONNgYbpeCICvQSLOKQoNkXXiN3PbSMg.crVP8eb-RB4UvCjfFxXWYVUrhnj6X_LBnbiabbhwo8gg.PNG/%EC%A0%9C%EB%AA%A9_%EC%97%86%EC%9D%8C-3.png">
   </div>

   <div class="video-container" id="container7">
    <video id="video7" controls></video>
    <img class="fallback-image" id="fallback-image7" alt="" src="https://nng-phinf.pstatic.net/MjAyMzEyMTVfMTgx/MDAxNzAyNjAxMjEyMTYw.Hw6vs76aI0L1zeu4fziwXDE35gidFriwTSgAjq7KWxUg.0V3KaKvctGKcVYa76UiDVTXMjXeUSuUezHX6nGU4y9kg.PNG/123.png">
</div>
 </div>
</div>
       <button id="next">&gt;</button>
</div>


 
    <script>
      // YouTube IFrame API를 비동기적으로 로드
      var tag = document.createElement('script');
      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // YouTube IFrame Player API가 준비되면 이 함수가 자동으로 호출됨
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '720', // 비디오의 높이
          width: '1280',  // 비디오의 너비
          videoId: 'Zw0A8bSfSPM', // 재생할 YouTube 비디오 ID
          playerVars: {'autoplay' : 1, 'mute' : 1},
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // YouTube 플레이어가 준비되면 이 함수가 호출됨
      function onPlayerReady(event) {
      //  event.target.playVideo(); // 비디오 자동 재생
      }

      // 플레이어의 상태가 변경될 때마다 이 함수가 호출됨
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING) {
          // 예를 들어, 비디오가 재생 중일 때 수행할 작업
        }
      }
    </script>
    
<script type="text/javascript">   
document.addEventListener('DOMContentLoaded', function() {
    const newCarouselGroup = document.querySelector('.new-video-container-group');
    let currentIndex = 0; // 현재 비디오 인덱스 초기화
    const moveDistance = 350; // 이동 거리 설정
    // 총 아이템 수는 초기에 표시되는 아이템만 고려
    const totalItems = newCarouselGroup.querySelectorAll('.new-video-container:not([style*="display: none"])').length;
    const carouselWidth = newCarouselGroup.offsetWidth; // 캐러셀의 너비
    const itemWidth = 320; // 각 아이템의 너비

    // 페이지 로드 후 계산될 수 있도록 setTimeout 사용
    setTimeout(function() {
        const visibleItems = Math.floor(carouselWidth / itemWidth); // 한 번에 보여줄 수 있는 아이템 수
        document.querySelector('.next-btn').addEventListener('click', function() {
            if (currentIndex < totalItems - visibleItems) {
                currentIndex++;
                newCarouselGroup.style.transform = 'translateX(-' + (moveDistance * currentIndex) + 'px)';
            }
        });

        document.querySelector('.prev-btn').addEventListener('click', function() {
            if (currentIndex > 0) {
                currentIndex--;
                newCarouselGroup.style.transform = 'translateX(-' + (moveDistance * currentIndex) + 'px)';
            }
        });
    }, 0);
});
</script> 



    
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
   
   const carousel = document.querySelector('.video-container-group');
    let offset = 0; // 현재 캐러셀의 위치
    let moveDistance = 350; // 한 번에 이동할 거리: 비디오 너비

    document.getElementById('next').addEventListener('click', function() {
        if (offset > -moveDistance * (carousel.children.length - 3)) {
            offset -= moveDistance;
            carousel.style.transform = 'translateX(' + offset + 'px)';
        }
    });

    document.getElementById('prev').addEventListener('click', function() {
        if (offset < 0) {
            offset += moveDistance;
            carousel.style.transform = 'translateX(' + offset + 'px)';
        }
    });
   
     // video1 설정
    setupVideoAndFallback(
        'video1', 
        'fallback-image1', 
        'https://livecloud.akamaized.net/chzzk/lip2_kr/cflexnmss2u0077/bo5nirrajgqcqhfookg3ynpccy39pdpc0t/hls_playlist.m3u8?hdnts=st=1711067050~exp=1711099460~acl=*/bo5nirrajgqcqhfookg3ynpccy39pdpc0t/*~hmac=8edfac4f8e04ef80e12a55e0a3029dbe15e59e26a0fc5a7f4a4d62127b9227b4'
    );

    // video2 설정
    setupVideoAndFallback(
        'video2', 
        'fallback-image2', 
        'https://livecloud.pstatic.net/chzzk/lip2_kr/cflexnmss2u0005/wrevc3nsngcuzk9d4adliida54zrqhms23/hls_playlist.m3u8?hdnts=st=1711093634~exp=1711124244~acl=*/wrevc3nsngcuzk9d4adliida54zrqhms23/*~hmac=c2dcac4c4c3fcd5aa3f29635329f54b162c6b662fa07fbeabbce21cfcc0334ed'
    );

    // video3 설정
    setupVideoAndFallback(
        'video3', 
        'fallback-image3', 
        'https://livecloud.akamaized.net/chzzk/lip2_kr/cflexnmss2u0003/jmy6r07nzeinpilgr1qkcpmcgh6qce3sje/hls_playlist.m3u8?hdnts=st=1711429495~exp=1711461905~acl=*/jmy6r07nzeinpilgr1qkcpmcgh6qce3sje/*~hmac=49acfba1279bc5e90f3095f9600351b1d31f8740d33109c55909f837bbe989b0'
    );
    
    // video4 설정
    setupVideoAndFallback(
        'video4', 
        'fallback-image4', 
      'https://livecloud.pstatic.net/chzzk/lip2_kr/cflexnmss2u0020/fftasy1bx4lnvkvmnwkmyb2cfq4tg7oan7/hls_playlist.m3u8?hdnts=st=1711339018~exp=1711369628~acl=*/fftasy1bx4lnvkvmnwkmyb2cfq4tg7oan7/*~hmac=12afe9557c37803d4cd0b1caa4f8d0bef755eff15470ae197c1a7dea0df53cc6'
    );
    
    // video5 설정
    setupVideoAndFallback(
        'video5', 
        'fallback-image5', 
      'https://livecloud.pstatic.net/chzzk/lip2_kr/cflexnmss2u0003/u8qi0ugbwrtmg02awrbtfbh49remmoqkoo/hls_playlist.m3u8?hdnts=st=1711338239~exp=1711368849~acl=*/u8qi0ugbwrtmg02awrbtfbh49remmoqkoo/*~hmac=eacd7502afc4a16d242033213daf885ffe8a81c4c663dcd2893c10c7a15aa762'
    );
    
    // video6 설정
    setupVideoAndFallback(
        'video6', 
        'fallback-image6', 
      'https://livecloud.pstatic.net/chzzk/lip2_kr/cflexnmss2u0003/hvfkc60oo0xvwgvzqesqidg5qh4651xpwq/hls_playlist.m3u8?hdnts=st=1711338617~exp=1711369227~acl=*/hvfkc60oo0xvwgvzqesqidg5qh4651xpwq/*~hmac=26561695f1232020b31cd1a5ee151c5bd844433802a32489acef36056d74233f'
    );

     // video7 설정
     setupVideoAndFallback(
        'video7', 
        'fallback-image7', 
        'https://livecloud.pstatic.net/chzzk/lip2_kr/cflexnmss2u0002/ciwkmnnwnbdk49qudu5juizcfznnl1vi55/hls_playlist.m3u8?hdnts=st=1711413467~exp=1711444077~acl=*/ciwkmnnwnbdk49qudu5juizcfznnl1vi55/*~hmac=2564f7eca40009ed486746df3a15aa9726477e562b0eb6a85939553d30028611'
        );
   
    
    
    // 함수 정의 부분
    function setupVideoAndFallback(videoId, fallbackImageId, videoSrc) {
        var video = document.getElementById(videoId);
        var fallbackImage = document.getElementById(fallbackImageId);

        // 비디오 로딩 실패 처리
        var loadingTimeout = setTimeout(function() {
            video.style.display = 'none';
            fallbackImage.style.display = 'block';
        }, 8000); // 8초 후 실행

        video.oncanplay = function() {
            clearTimeout(loadingTimeout);
            fallbackImage.style.display = 'none';
            video.style.display = 'block';
        };

        // HLS 지원 여부에 따라 비디오 소스 설정
        if (Hls.isSupported()) {
            var hls = new Hls();
            hls.loadSource(videoSrc);
            hls.attachMedia(video);
        } else if (video.canPlayType('application/vnd.apple.mpegurl')) {
            video.src = videoSrc;
        }
    }

  

   


});
</script>

    
   
   
</body>
</html>