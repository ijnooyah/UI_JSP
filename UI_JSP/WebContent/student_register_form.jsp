<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<script>
	function getTextByte(str) {
		var len = 0;
		for (var i = 0; i < str.length; i++) {
			if (escape(str.charAt(i)).length == 6) { // 한글일때
				len += 3;
			} else {
				len++;
			}
		}
		return len;
	}
$(function() {
	
	var inputs = $(".input");
	inputs.each(function() {
		$(this).keydown(function(i) {
			$(this).prev().text("");
			console.log("입력됨");
		})
	})
// 	//숫자입력하면 안되는거 처리 ->!!!!!불완전함
// 	var textInputs = $("input[type=text]");
// 	textInputs.each(function() {
// 		$(this).keydown(function() {
// 			if(!isNaN($(this).val())){
// 				$(this).prev().text("숫자 입력 불가합니다.")
// 			} 
// 		})
// 	})
	
	var isOper = false; //학번체크 버튼 필수로 하게 하기위해 학번체크 버튼 동작여부 변수설정
	
	$("#frmStudent").submit(function() {
		if(isOper == false) {
			$("#spanSno").text("학번 중복 확인부터 해주세요");
			$("#sno").focus();
			return false;
		} 
		
		var sno = $("#sno").val().trim();
		var sname = $("#sname").val().trim();
		var syear = $("#syear").val().trim();
		var major = $("#major").val().trim();
		var score = $("#score").val().trim();
		
		//학번 처리 (학번은 1이상의 숫자만 가능하게 하기)
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
		if(getTextByte(sno) > 8) {
			$("#spanSno").text("학번은 8자리까지만 가능합니다.");
			$("#sno").focus();
			return false;
		}
		
		//이름 처리
		if (sname == "") {
			$("#spanSname").text("이름을 입력해주세요.");
			$("#sname").focus();
			return false;
		}
		if (!isNaN(sname)) {
			$("#spanSname").text("이름에 숫자 입력할 수 없습니다.");
			$("#sname").focus();
			return false;
		}
		if(getTextByte(sname) > 10) {
			$("#spanSname").text("최소글자수를 넘으셨습니다.");
			$("#sname").focus();
			return false;
		}
		
		// 학년 처리 (셀렉트 박스로 완료)
		//성별 처리
		if ( $('input[name="gender"]:checked').length == 0 ) {
	   		$("#spanGender").text("성별을 선택해주세요.");
	    	$('input[name="gender"]').focus();
	   	    return false;
		}
		
		//전공 처리
		if (major == "") {
			$("#spanMajor").text("전공을 입력해주세요.");
			$("#major").focus();
			return false;
		}
		if(getTextByte(major) > 10) {
			$("#spanMajor").text("최소글자수를 넘으셨습니다.");
			$("#major").focus();
			return false;
		}
		if (!isNaN(major)) {
			$("#spanMajor").text("전공에 숫자 입력할 수 없습니다.");
			$("#major").focus();
			return false;
		}
		
		if (score == "") {
			$("#spanScore").text("점수를 입력해주세요.");
			$("#score").focus();
			return false;
		}
		if (score < 0 && score > 100) {
			$("#spanScore").text("0~100사이의 숫자를 입력해주세요.");
			$("#score").focus();
			return false;
		}
		
		
		// 제약조건해당하는거 없으면폼전송
		$(this).submit();
	});
	
	//학번존재여부 판단
	$("#btnCheckSno").click(function() {
		isOper = true;
		$("#spanSno").text("");
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
			$("#sno").focus();
			if (receivedData == "true") {
				message = "등록 가능한 학번입니다.";
				$("#sname").focus();
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
						<br><span id="spanSno" style="color:red;"></span>
					    <input type="number"
							class="form-control input" id="sno" name="sno" />
					</div>
					<div class="form-group">
						<label for="sname"> 이름 </label>
						<br><span id="spanSname" style="color:red;"></span>
						 <input type="text"
							class="form-control input" id="sname" name="sname" />
					</div>
					<div class="form-group">
						<label for="syear"> 학년 </label>
						<br><span id="spanSyear" style="color:red;"></span>
						 <select class="form-control" name="syear" id="syear">
							  <option value="1" id="1" selected>1</option>
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
							class="form-control input" id="major" name="major" />
					</div>
					<div class="form-group">
						<label for="score"> 점수 </label>
						<br><span id="spanScore" style="color:red;"></span>
						 <input type="number"
							class="form-control input" id="score" name="score" />
					</div>
					<button type="submit" class="btn btn-primary" id="btnInsert">등록하기</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>