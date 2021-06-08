<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<script>
$(function() {
	$("#btnCheckSno").click(function() {
		console.log("클릭됨");
		var that = $(this);
		var sno = $("#sno").val();
		var url = "/UI_JSP/checkSno";
		var sendData = {
				"sno" : sno
		};
		$.get(url, sendData, function(receivedData) {
			console.log("rData", receivedData);
			var message = "등록된 학번입니다."
			// 받아온 값이 true라면 중복되지 않은 학번임
			if (receivedData == "true") {
				message = "등록 가능한 학번입니다.";
				// 여기선 this를 쓰면 안됨 그러면 get의 this가 됨
			} 
			that.next().next().text(message);
		});
	});
})
</script>
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
						<label for="sno"> 학번 </label>
						<button type="button" class="btn btn-info" id="btnCheckSno">학번체크</button>
						<br><span></span>
					    <input type="number"
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