<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<title>학생 등록</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron">
					<h2>학생 등록 하기</h2>
					<p>학번은 수정이 불가능하니 신중하게 입력해주세요.</p>
				</div>
				<form role="form" action="student_register_run.jsp" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label> <input type="number"
							class="form-control" id="sno" name="sno" />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label> <input type="text"
							class="form-control" id="sname" name="sname" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label> <input type="number"
							class="form-control" id="syear" name="syear" />
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label><br>
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
						<label for="major"> 전공 </label> <input type="text"
							class="form-control" id="major" name="major" />
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label> <input type="number"
							class="form-control" id="score" name="score" />
					</div>
					<button type="submit" class="btn btn-primary">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>