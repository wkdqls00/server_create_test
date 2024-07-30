<%@page import="dao.PayDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("loginId");
	int point = (int)((Math.random() * 1000) + 1);
	PayDAO pDao = new PayDAO();
	pDao.pointPlus(point, id);
%>

<script>
	alert("<%= point %> 점 적립되었습니다.");
	window.location.href="https://www.koreaisacademy.com";
</script>