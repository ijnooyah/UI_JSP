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
	//학년정보 가져오기
	<%if (vo.getSyear() == 1) {       %>
		$("#1").attr("selected", true)
	<%} else if (vo.getSyear() == 2) {%>
		$("#2").attr("selected", true)
	<%} else if (vo.getSyear() == 3) {%>
		$("#3").attr("selected", true)
	<%} else if (vo.getSyear() == 4) {%>
		$("#4").attr("selected", true)
	<%}                               %>
	
	//성별정보 가져오기
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
					<h2>학생 상세 정보</h2>
					<p>수정하려면 수정버튼을 삭제하려면 삭제버튼을 눌러주세요.</p>
				</div>
				<form role="form" id="frmStudent" action="student_register_run.jsp" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label>
						<br><span id="spanSno" style="color:red;"></span>
					    <input type="number"
							class="form-control input" id="sno" name="sno" value="<%= vo.getSno()%>" readonly />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;"></span>
						 <input type="text"
							class="form-control input" id="sname" name="sname" value="<%= vo.getSname()%>" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label>
						<br><span id="spanSyear" style="color:red;"></span>
						 <select class="form-control" name="syear" id="syear">
							  <option value="1" id="1">1</option>
							  <option value="2" id="2">2</option>
							  <option value="3" id="3">3</option>
							  <option value="4" id="4">4</option>
						</select>
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label>
						<span id="spanGender" style="color:red;"></span>
						<br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoMale" value="남"> <label
								class="form-check-label" for="rdoMale"> 남 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoFemale" value="여"> <label
								class="form-check-label" for="rdoFemale"> 여 </label>
						</div>
					</div>
					<div class="form-group">
						<label for="major"> 전공 </label>
						<br><span id="spanMajor" style="color:red;"></span>
						 <input type="text"
							class="form-control input" id="major" name="major" value="<%= vo.getMajor()%>" />
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label>
						<br><span id="spanScore" style="color:red;"></span>
						 <input type="number"
							class="form-control input" id="score" name="score" value="<%= vo.getScore()%>" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnInsert">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>