<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script>
	const cpath = '${cpath}'
	const url = '${url}'
	const msg = '${msg}'
	
	if(url == '') {
		alert(msg)
		history.go(-1)
	}
	else {
		alert(msg)
		location.href = cpath + url
	}
</script>

</body>
</html>