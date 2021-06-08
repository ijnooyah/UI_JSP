<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<script>

$(function() {
	//학번체크 버튼 필수로 하게 하기
	var isOper = false;
	$("#frmStudent").submit(function() {
		if(isOper == false) {
			$("#spanSno").text("학번 중복 확인부터 해주세요");
			$("#sno").focus();
			return false;
		}

		if ($("#sname").val().trim() == "") {
			$("#spanSname").text("이름을 입력해주세요.");
			$("#sname").focus();
			return false;
		}
		if ($("#syear").val().trim() == "") {
			$("#spanSyear").text("학년을 입력해주세요.");
			$("#syear").focus();
			return false;
		}
		//라디오버튼 체크 안되어있으면
		if ( !$('input[name="gender"]:checked').val() ) {
	   		$("#spanGender").text("성별을 선택해주세요.");;
	    	$('input[name="gender"]').focus();
	   	    return false;
		}
		if ($("#major").val().trim() == "") {
			$("#spanMajor").text("전공을 입력해주세요.");
			$("#major").focus();
			return false;
		}
		
		if ($("#score").val().trim() == "") {
			$("#spanScore").text("점수를 입력해주세요.");
			$("#score").focus();
			return false;
		}
		
		
		// 제약조건해당하는거 없으면폼전송
// 		$(this).submit();
	});
	
	//학번존재여부 판단
	$("#btnCheckSno").click(function() {
		isOper = true;
		var sno = $("#sno").val().trim();
		if (sno == "" ) {
			$("#spanSno").text("학번을 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		
		var iSno = parseInt(sno);
		if(iSno<1) {
			$("#spanSno").text("1이상의 숫자를 입력해주세요.");
			$("#sno").focus();
			return false;
		}
		
		var that = $(this);
		var sno = $("#sno").val();
		var url = "/UI_JSP/checkSno";
		var sendData = {
				"sno" : sno
		};
		$.get(url, sendData, function(receivedData) {
			console.log("rData", receivedData);
			var message = "등록된 학번입니다."
			if (receivedData == "true") {
				message = "등록 가능한 학번입니다.";
			} 
			that.next().text(message);
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
				<form role="form" id="frmStudent" action="student_register_run.jsp" method="post">
					<div class="form-group">
						<label for="sno"> 학번 </label>
						<button type="button" class="btn btn-info" id="btnCheckSno">학번체크</button>
						<span></span>
						<br><span id="spanSno" style="color:red;">학번경고</span>
					    <input type="number"
							class="form-control" id="sno" name="sno" />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;">이름경고</span>
						 <input type="text"
							class="form-control" id="sname" name="sname" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label>
						<br><span id="spanSyear" style="color:red;">학년경고</span>
						 <input type="number"
							class="form-control" id="syear" name="syear" />
					</div>
					<div class="form-group">
						<label for="gender"> 성별 </label>
						<br><span id="spanGender" style="color:red;">성별경고</span>
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
						<br><span id="spanMajor" style="color:red;">전공경고</span>
						 <input type="text"
							class="form-control" id="major" name="major" />
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label>
						<br><span id="spanScore" style="color:red;">점수경고</span>
						 <input type="number"
							class="form-control" id="score" name="score" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnInsert">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>