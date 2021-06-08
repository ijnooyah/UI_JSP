<%@page import="com.yj.db.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String sno = request.getParameter("sno");
	StudentDao dao = StudentDao.getInstance();
	System.out.println("sno="+ sno);
	boolean b = dao.deleteStudent(sno);
	String strResult = "삭제 실패";
	if (b == true) {
		strResult = "삭제 성공";
	}
%>
<title>학생 삭제 처리 결과</title>
</head>
<body>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2><%=strResult %></h2>
					<p>학생 목록으로 이동하시려면 아래의 목록 버튼을 클릭해 주세요.</p>
					<p>
						<a class="btn btn-primary btn-large" href="student_list.jsp">목록</a>
					</p>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>