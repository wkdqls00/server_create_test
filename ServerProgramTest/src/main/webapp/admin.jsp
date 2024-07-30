<%@page import="java.util.HashSet"%>
<%@page import="org.quartz.impl.StdSchedulerFactory"%>
<%@page import="org.quartz.*"%>
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
		<%
		// Scheduler 사용을 위한 인스턴스화
				SchedulerFactory schedulerFactory = new StdSchedulerFactory();
				Scheduler scheduler = schedulerFactory.getScheduler();
				// JOB Data 객체
				JobDataMap jobDataMap = new JobDataMap();
				jobDataMap.put("jobSays", "Say Hello World!");
				jobDataMap.put("myFloatValue", 3.1415f);
				/**
				* JobDetail 은 Job이 스케줄러에 추가될 때 Quartz Client에 의해 작성 (작업 인스턴스 정의)
				*
				* 또한 Job에 대한 다양한 속성 설정과 JobDataMap을 포함할 수 있으며,
				* JobDataMap은 Job 클래스의 특정 인스턴스에 대한 상태 정보를 저장하는 데 사용
				* - 작업 인스턴스가 실행될 때 사용하고자 하는 데이터 개체를 원하는 만큼 보유
				* - Java Map interface를 구현한 것으로 원시 유형의 데이터를 저장하고 검색하기 위한 몇 가지 편의 방법이 추가
				*/
				JobDetail jobDetail = JobBuilder.newJob(TestJob.class)
				.withIdentity("myJob", "group1")
				.setJobData(jobDataMap)
				.build();
				/**
				* Job의 실행을 trigger
				*
				* 작업을 예약하려면 트리거를 인스턴스화하고 해당 속성을 조정하여 예약 요구 사항을 구성
				*
				* - 특정시간 또는 특정 횟수 반복: SimpleTrigger
				* - 주기적 반복: CronTrigger (초 분 시 일 월 요일 연도)
				*/
				// CronTrigger
				CronTrigger cronTrigger = (CronTrigger) TriggerBuilder.newTrigger()
				.withIdentity("trggerName", "cron_trigger_group")
				.withSchedule(CronScheduleBuilder.cronSchedule("*/2 * * * * ?")) // 매 2초마다 실행
				.forJob(jobDetail)
				.build();
				
				Set<Trigger> triggerSet = new HashSet<Trigger>();
				triggerSet.add(cronTrigger);

				scheduler.scheduleJob(jobDetail, triggerSet, false);
				scheduler.start();      // 스케줄러 시작.
				Thread.sleep(7000);
				scheduler.shutdown();	// 스케줄러 종료.
		%>
			<h1>스케줄러관리</h1>
			<button>스케줄러(20초마다 포인트 1 증가) 실행 시작</button>
			<button>스케줄러 실행 종료</button>
		</div>
	</div>
</body>
</html>