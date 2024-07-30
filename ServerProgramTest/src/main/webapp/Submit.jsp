<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 페이지</title>
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
		<div style="width: 218px">
			<h1>회원가입</h1>
			<form action="Submit2.jsp">
				ID : <input type="text" name="id" style="margin-left: 27px; margin-bottom: 2px; width: 155px;"> <br>
				PW : <input type="password" name="pw" style="margin-bottom: 2px; margin-left: 19px; width: 155px;"> <br>
				Name : <input type="text" name="name" style="margin-bottom: 2px; width: 155px; margin-left: 2px;"> <br>
				<button type="submit">작성완료</button>
			</form>
		</div>
	</div>
</body>
</html>