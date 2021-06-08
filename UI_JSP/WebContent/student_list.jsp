<%@page import="com.yj.db.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="com.yj.db.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%
	StudentDao dao = StudentDao.getInstance();
	List<StudentVo> list = dao.selectAll();
	
%>
<script>
$(function() {
	// 상세정보 페이지
	$(".content_row").click(function() {
		var sno = $(this).find("td:first").text().trim();
		console.log("sno", sno);
// 		$(location).attr("href","student_content.jsp");
		location.href = "student_content.jsp?sno=" + sno;
	});
	
	$("#btnSelect").click(function() {
		$("option")
		return false;
	});
	
})
</script>
<title>학생 정보 관리</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron">
				<h2>
					학생 목록
				</h2>
				<p>
					학생 정보를 등록하려면 아래 버튼을 눌러주세요.
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="student_register_form.jsp">등록하기</a>
				</p>
			</div>
			<div class="col-md-12">
			<form class="form-inline">
<!-- 				<div class="col-md-3 col-sm-3 col-xs-3"> -->
<!-- 					<div class="container"> -->
						<select class="form-control" name="option">
						  <option value="all">전체</option>
						  <option value="sname">이름</option>
						  <option value="major">전공</option>
						</select>
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-7 col-sm-7  col-xs-7"> -->
<!-- 					<div class="form-outline"> -->
					  <input type="text" id="typeText" class="form-control" />
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-2 col-sm-2  col-xs-2"> -->
					<button type="submit" class="btn btn-success" id="btnSelect">조회</button>
<!-- 				</div> -->
			</form>	
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>
							학번
						</th>
						<th>
							이름
						</th>
						<th>
							학년
						</th>
						<th>
							성별
						</th>
						<th>
							전공
						</th>
						<th>
							점수
						</th>
					</tr>
				</thead>
				<tbody>
				<%for(StudentVo vo : list)  {%>
					<tr class="content_row">
						<td>
							<%=vo.getSno()%>
						</td>
						<td>
							<%=vo.getSname()%>
						</td>
						<td>
							<%=vo.getSyear()%>
						</td>
						<td>
							<%=vo.getGender()%>
						</td>
						<td>
							<%=vo.getMajor()%>
						</td>
						<td>
							<%=vo.getScore()%>
						</td>
					</tr>
				<%} %>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>