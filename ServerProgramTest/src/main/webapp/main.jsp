<%@page import="dto.MemberInfoDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("loginId");
	MemberDAO mDao = new MemberDAO();
	MemberInfoDTO mDto = mDao.selectMemberInfoDTO(id);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		header {
			display: flex;
    		justify-content: space-between;
		}
		.member_info_area {
			display: flex;
    		align-items: center;
		}
		.member_info {
			margin-right: 15px;
		}
		.logout {
			display: block;
    		height: 25px;
		}
		.wrap {
			padding: 10px;
		}
		.contents_area {
			display: flex;
		    justify-content: space-evenly;
		    align-items: center;
		}
		.contents_area p {
			text-align: center;
		}
		.ad_area {
			float: right;
			margin-top: 50px;	
			text-align: right;	
		}
		.ad_tag {
			margin: 0;
			text-align: left;
		}
	</style>
	<script>
		$(function() {
			
			// 상품 구매
			$(".contents").click(function() {
				let subject = $(this).attr("id");
				let id = $(".member_info").attr("id");
				let point = parseInt($(this).find(".price_tag").attr("id"));
				let user_point = parseInt(<%= mDto.getPoint() %>);
				
				if (user_point >= point) {
					$.ajax({
						url: '${pageContext.request.contextPath}/AjaxContentsPay',
						data: {subject : subject, id : id, point: point},
						type: 'get',
						success: function(response){
							alert("컨텐츠(" + subject + ")를 구입하였습니다.");
							location.reload();
						},
						error: function(){
							console.log('ajax 통신 실패');		
						}
					});
				} else {
					alert("포인트가 부족합니다. 광고를 클릭하세요.");
				}
			})
		})
	</script>
</head>
<body>
	<div class="wrap">
		<header>
			<h1>메인 페이지</h1>
			<div class="member_info_area">
				<div class="member_info" id="<%= id %>">
					<p style="font-weight: bold;"><%= mDto.getName() %>&#40;<%= id %>&#41;님 안녕하세요.<br>포인트 : <%= mDto.getPoint() %>점</p>
				</div>
				<button class="logout" onclick="location.href='Logout.jsp'">로그아웃</button>
			</div>
		</header>
		<main>
			<h3>구입할 컨텐츠를 선택하세요.</h3>
			<div class="contents_area">
				<div class="contents" id="intro">
					<img src="img/Intro_350_408.png">
					<p class="price_tag" id="100000">100,000포인트</p>
				</div>
				<div class="contents" id="java">
					<img src="img/Java_350_408.png">
					<p class="price_tag" id="500000">500,000포인트</p>
				</div>
				<div class="contents" id="c++">
					<img src="img/Cpp_350_408.png">
					<p class="price_tag" id="300000">300,000포인트</p>
				</div>
			</div>
			<div class="ad_area">
				<p class="ad_tag">&lt;광고&gt;</p>
				<a href="PointPlus.jsp">
					<img src="img/korea_it.png">
				</a>
			</div>
		</main>
	</div>
</body>
</html>