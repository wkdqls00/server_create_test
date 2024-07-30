<%@page import="dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = (String)session.getAttribute("loginId");
	if (!(id.equals("admin"))) {
%>
	<script>
		location.href="main.jsp";
	</script>
<%
	}
	MemberDAO mDao = new MemberDAO();
	ArrayList<MemberListDTO> listMember = mDao.selectMemberListDTO();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<style>
		table {
			border-collapse: collapse;
			border: 1px solid #222;
			width: 100%;
		}
		td, th {
			border: 1px solid #222;
			text-align: center;
		}
		.header {
			display: flex;
	    	justify-content: space-between;
			align-items: center;
		}
		.wrap {
			padding: 15px;
		}
	</style>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$(function() {
		
		
		// 회원 삭제
		$(".delete_btn").click(function() {
			
		let user_id = $(this).parent().parent().attr("id");
			$.ajax({
				url: '${pageContext.request.contextPath}/AjaxMemberDelete',
				data: {user_id : user_id},
				type: 'get',
				success: function(response){
					alert("삭제되었습니다.");
					location.reload();
				},
				error: function(){
					console.log('ajax 통신 실패');		
				}
			});
		});
		
		// 회원 수정
		$(".modify_btn").click(function() {
			let user_id = $(this).parent().parent().attr("id");
			location.href = "MemberModify.jsp?user_id=" + user_id;
		})
	});
	</script>
</head>
<body>
	<div class="wrap">
		<div class="member_manage" style="width: 500px;">
			<div class="header">
				<h1>회원관리</h1>
				<button onclick="location.href='Login.jsp'" style="height: 24px;">로그인</button>
			</div>
			<div class="member_table_area" style="width: 500px;">
				<table>
					<thead>
						<tr>
							<th>ID</th>
							<th>PW</th>
							<th>Name</th>
							<th>Point</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
					<% for(MemberListDTO dto : listMember) { %>
						<tr id = "<%= dto.getId() %>">
							<td><%= dto.getId() %></td>
							<td><%= dto.getPw() %></td>
							<td><%= dto.getName() %></td>
							<td><%= dto.getPoint() %></td>
							<td>
								<button class="modify_btn">수정</button>
							</td>
							<td>
								<button class="delete_btn">삭제</button>
							</td>
						</tr>
					<% } %>
					</tbody>
				</table>
			</div>
		</div>
		<div class="schedule_area">
			<h1>스케줄러관리</h1>
			<button>스케줄러(20초마다 포인트 1 증가) 실행 시작</button>
			<button>스케줄러 실행 종료</button>
		</div>
	</div>
</body>
</html>