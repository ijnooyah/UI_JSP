<%@page import="java.util.List"%>
<%@page import="com.yj.db.StudentVo"%>
<%@page import="com.yj.db.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<%	
	StudentDao dao = StudentDao.getInstance();
	List<StudentVo> list = null;
	
	request.setCharacterEncoding("utf-8");
	String option = request.getParameter("option");
	String search = request.getParameter("search");
	
	// 맨첫화면 option: null, search: null
	String message = "";
	if(option != null) {
		if(option.equals("sname")) {
			list = dao.selectBySname(search);
		} else if(option.equals("major")) {
			list = dao.selectByMajor(search);
	 	} else {
	 		list = dao.selectAll();
	 	}
		if (list.size() == 0) {
			 message = "해당하는 학생이 없습니다";
		} 
	} else {
		message = "조회 방법선택하고 조회를 누르세요";
	}
	if(search != null) {
		if(search.trim().equals("")) {
			if(list != null){
				list.clear();	
			}
			message = "검색어를 입력해주세요";
		} 
	}
	
%>
<script>
$(function() {
	// 테이블만 보여주게하기
	<%if(list != null) {%>
	<%if(list.size() != 0) {%>
		$("#message").css("display", "none");
	<%}%>
	<%}%>
	//새로고침후 다시 돌아올때 전에 선택되었던거랑 검색어 유지하게하기
	<%if(option != null) {  %>
			$("#search").val("<%=search%>");
	<%	if(option.equals("sname")) {       %>
			$("#sname").attr("selected", true);
	<%	} else if(option.equals("major")) {%>
			$("#major").attr("selected", true);
	<%	} else {                           %>
			$("#all").attr("selected", true);
	<%	}                                
	  }                                    %>
	// 테이블 row 선택하면 상세정보 페이지로 넘어가기
	$(".content_row").click(function() {
		var sno = $(this).find("td:first").text().trim();
		console.log("sno", sno);
// 		$(location).attr("href","student_content.jsp");
		location.href = "student_content.jsp?sno=" + sno;
	});
	
	// 폼전송
	$("#btnSelect").click(function() {
		var option = $("#option").val();
		$("#frmStudent").submit();		
	});
	
	
	//첫화면에서만 막기 
	if($("option:selected").val() == "all") {
		$("#search").attr("readonly", true)
	}
	//셀렉트박스에서 전체 선택하면 입력창 막기
	$("#option").change(function() {
		console.log("확인", $("#option").val());
		if($("#option").val() == "all") {
			$("#search").val("");
			$("#search").attr("readonly", true)
		} else {
			$("#search").attr("readonly", false)
		}
		
	});
	
	//마우스오버시 커서모양 바꾸기 (선택대상인줄알게하기위해)
	$('.content_row').mouseenter(function() {
		$(this).css("cursor", "pointer");
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
			<form class="form-inline" id="frmStudent">
						<select class="form-control" name="option" id="option">
						  <option value="all" id="all" selected>전체</option>
						  <option value="sname" id="sname">이름</option>
						  <option value="major" id="major">전공</option>
						</select>
					  <input type="text" id="search" class="form-control" name="search"/>
					<button type="button" class="btn btn-success" id="btnSelect">조회</button>
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
				<%if(list != null) {%>
				<%for(StudentVo vo : list) { %>
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
				<%} %>
				</tbody>
			</table>
			<div class="row" id="message">
				<div class="col-md-12">
					<div class="jumbotron">
						<h2>
							<%=message %>
						</h2>
					</div>
				</div>
	
			</div>							
			
		</div>
	</div>
</div>
</body>
</html>