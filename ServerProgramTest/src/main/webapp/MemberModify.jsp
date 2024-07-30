<%@page import="dto.*"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	
	String id = request.getParameter("user_id");
	MemberDAO mDao = new MemberDAO();
	MemberInfoAdminDTO mDto = mDao.selectMemberInfoAdminDTO(id);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 관리 - 수정 관리자</title>
</head>
<body>
	<div class="main_content">
		<div style="width: 300px">
			<h1>회원 관리 - 수정 관리자</h1>
			<form action="${pageContext.request.contextPath}/ModifyServlet" method="post">
				ID : <input type="text" name="id" style="margin-left: 27px; margin-bottom: 2px; width: 155px;" value="<%= mDto.getId() %>" readonly> <br>
				PW : <input type="text" name="pw" style="margin-bottom: 2px; margin-left: 19px; width: 155px;" value="<%= mDto.getPwString() %>"> <br>
				Name : <input type="text" name="name" style="margin-bottom: 2px; width: 155px; margin-left: 2px;" value="<%= mDto.getName() %>"> <br>
				Point : <input type="text" name="point" style="margin-bottom: 2px; width: 155px; margin-left: 6px;" value="<%= mDto.getPoint() %>"> <br>
				<button type="submit" style="width: 216px">작성완료</button>
			</form>
		</div>
	</div>
</body>
</html>