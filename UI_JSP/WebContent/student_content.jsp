<%@page import="com.yj.db.StudentVo"%>
<%@page import="com.yj.db.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String sno = request.getParameter("sno");
	StudentDao dao = StudentDao.getInstance();
	StudentVo vo = dao.getOneStudent(sno);
// 	System.out.println("sno=" + sno);
%>
<script>
$(function() {
	$(".readonly").attr("readonly", true);
	<%if (vo.getGender().equals("남")) {%>
		$("#rdoMale").attr("checked", true)
	<%} else {%>
		$("#rdoFemale").attr("checked", true)
	<%}%>
	
	//삭제버튼 작업
	$("#btnDelete").click(function() {
		var val = prompt("삭제하려는 학번이 " + <%=vo.getSno()%> + "가 맞습니까?\n맞으면 "+ <%=vo.getSno()%> + " 입력후 확인버튼을 눌러주세요.");
// 		console.log("val", val);
		if(val == null) {
			
		} else if (val.trim().length == 0) {
			alert("제대로 입력해주세요");
		} else {
			//val이 학번이랑 같으면 삭제하게하고 아니면 못하게하기
			if(val == <%=vo.getSno()%>){
				//삭제하기
				location.href = "student_delete_run.jsp?sno=<%=vo.getSno()%>";
			} else {
				alert("학번이 틀렸습니다.");
			}
		}
		
	});
})

</script>
<title>학생 상세 정보</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 상세 정보 보기</h2>
					<p>조회하려면 목록버튼, 수정하려면 수정버튼, 삭제하려면 삭제버튼을 눌러주세요.</p>
				</div>
				<form role="form" method="post" action="student_modify.jsp">
					<div class="form-group">
						<label for="sno"> 학번 </label> <input type="number"
							class="form-control readonly" id="sno" name="sno" value="<%= vo.getSno()%>"  />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label> <input type="text"
							class="form-control readonly" id="sname" name="name" value="<%= vo.getSname()%>" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label> <input type="number"
							class="form-control readonly" id="syear" name="syear" value="<%= vo.getSyear()%>" />
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label><br>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoMale" value="male" onclick="return(false);"> <label
								class="form-check-label" for="rdoMale"> 남 </label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="rdoFemale" value="female" onclick="return(false);"> <label
								class="form-check-label" for="rdoFemale"> 여 </label>
						</div>
					</div>
					<div class="form-group">
						<label for="major"> 전공 </label> <input type="text"
							class="form-control readonly" id="major" name="major" value="<%= vo.getMajor()%>" />
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label> <input type="number"
							class="form-control readonly" id="score" name="score"  value="<%= vo.getScore()%>"/>
					</div>
					<a class="btn btn-primary" href="student_list.jsp">목록</a>
					<button type="submit" class="btn btn-success" id="btnModify">수정</button>
					<button type="button" class="btn btn-warning" id="btnDelete">삭제</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>