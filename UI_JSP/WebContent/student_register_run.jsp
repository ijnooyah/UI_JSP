<%@page import="com.yj.db.StudentVo"%>
<%@page import="com.yj.db.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String sno = request.getParameter("sno");
	String sname = request.getParameter("sname");
	String strYear = request.getParameter("syear");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	String strScore = request.getParameter("score");
	
	int syear = Integer.parseInt(strYear);
	int score = Integer.parseInt(strScore);
	
	StudentVo vo = new StudentVo(sno, sname, syear, gender, major, score);
	System.out.println(vo);
	StudentDao dao = StudentDao.getInstance();
	boolean b = dao.insertStudent(vo);
	String strResult = "등록 실패";
	if (b == true) {
		strResult = "등록 성공";
	}
	
%>
<title>학생 등록 처리 결과</title>
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