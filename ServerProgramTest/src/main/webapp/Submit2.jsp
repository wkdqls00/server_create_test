<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	
	MemberDAO mDao = new MemberDAO();
	mDao.registerMember(id, pw, name);
%>

<script>
	alert("가입되었습니다. 로그인 해주세요.");
	location.href="Login.jsp";
</script>