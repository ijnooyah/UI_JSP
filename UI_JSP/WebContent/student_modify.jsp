<%@page import="com.yj.db.StudentDao"%>
<%@page import="com.yj.db.StudentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String sno = request.getParameter("sno");
	StudentDao dao = StudentDao.getInstance();
	StudentVo vo = dao.getOneStudent(sno);
%>
<script>
$(function() {
	<%if (vo.getGender().equals("남")) {%>
		$("#rdoMale").attr("checked", true)
	<%} else {%>
		$("#rdoFemale").attr("checked", true)
	<%}%>
})
</script>
<title>학생 정보 수정하기</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 정보 수정하기</h2>
					<p>학번은 수정이 불가능합니다.</p>
				</div>
				<form role="form" action="student_modify_run.jsp" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label> <input type="number"
							class="form-control" id="sno" name="sno" value="<%= vo.getSno()%>" readonly />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label> <input type="text"
							class="form-control" id="sname" name="sname" value="<%= vo.getSname()%>" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label> <input type="number"
							class="form-control" id="syear" name="syear"  value="<%= vo.getSyear()%>" />
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoMale" value="남" > <label
								class="form-check-label" for="rdoMale"> 남 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoFemale" value="여" > <label
								class="form-check-label" for="rdoFemale"> 여 </label>
						</div>
					</div>
					<div class="form-group">
						<label for="major"> 전공 </label> <input type="text"
							class="form-control" id="major" name="major"  value="<%= vo.getMajor()%>"/>
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label> <input type="number"
							class="form-control" id="score" name="score" value="<%= vo.getScore()%>" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnModifyFinish">수정완료</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>