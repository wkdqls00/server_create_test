<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인체크.
	if(session.getAttribute("loginId") == "*") {
%>
<script>
	alert("아이디/비밀번호를 다시 확인하세요.");
</script>
<% } %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 페이지</title>
	<style>
		button {
			width: 100%;
		}
		.main_content{
		display: flex;
	    justify-content: center;
	    align-items: center;
		}
	</style>
</head>
<body>
	<div class="main_content">
		<div style="width: 200px">
			<h1>로그인</h1>
			<form action="${pageContext.request.contextPath}/LoginServlet" method="post">
				ID : <input type="text" name="id" style="margin-left: 8px; margin-bottom: 2px; width: 155px;"> <br>
				PW : <input type="password" name="pw" style="margin-bottom: 2px; width: 155px;"> <br>
				<button type="submit" style="margin-bottom: 2px;">로그인</button> <br>
				<button onclick="location.href='Submit.jsp'">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>