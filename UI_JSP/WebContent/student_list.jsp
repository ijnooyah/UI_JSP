<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<script>
$(function() {
	$("tr").click(function() {
		var el = $(this);
		console.log(el);
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
					<a class="btn btn-primary btn-large" href="#">등록하기</a>
				</p>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-3">
					<div class="container">
						<select class="form-control">
						  <option>전체</option>
						  <option>이름</option>
						  <option>전공</option>
						</select>
					</div>
				</div>
				<div class="col-md-7 col-sm-7  col-xs-7">
					<div class="form-outline">
					  <input type="text" id="typeText" class="form-control" />
					</div>
				</div>
				<div class="col-md-2 col-sm-2  col-xs-2">
					<button type="button" class="btn btn-success">조회</button>
				</div>
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
					<tr>
						<td>
							1001
						</td>
						<td>
							하윤지
						</td>
						<td>
							1
						</td>
						<td>
							여
						</td>
						<td>
							컴공
						</td>
						<td>
							100
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>