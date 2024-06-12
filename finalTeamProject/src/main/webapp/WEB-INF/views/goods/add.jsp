<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
	p {
		display: flex;
		justify-content: center;
	}
	
	#imagePreview {
		max-width: 200px;
		max-height: 200px;
		border-radius: 50%;
	}
	
	input[type="text"],
	input[type="number"] {
		width: 200px;
		padding: 10px 5px;
	}
</style>

	<h2 align="center">굿즈 상품 등록 (어드민 전용)</h2>
	
	<form method="POST" enctype="multipart/form-data">
		<p><input type="text" name="name" placeholder="상품 이름"></p>
		<p><input type="number" min="0" max="100" name="ticketCount" placeholder="차감 응원권 개수"></p>
	<p>
		<input type="file" name="upload" required>
	</p>
	<p>
		<img id="imagePreview" src="">
	</p>
	<p><input type="submit" value="등록하기"></p>
</form>
 <script>
        var fileInput = document.querySelector('input[type="file"]');
        // 이미지 미리보기를 위한 img 요소 가져오기
        var imagePreview = document.getElementById('imagePreview');

        fileInput.addEventListener('change', function(event) {
            var file = event.target.files[0]; // 업로드된 첫 번째 파일 가져오기

            var reader = new FileReader();

            reader.onload = function(event) {
                imagePreview.src = event.target.result;
            };

            reader.readAsDataURL(file);
        });
        
        
 </script>

</body>
</html>