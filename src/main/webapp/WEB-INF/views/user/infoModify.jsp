<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
#body {
	height: auto;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	border: 2px solid yellowgreen;
	width: 900px;
	height: auto;
}

#icon {
	float: right;
	margin-top: -39px;
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 40px;
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
	border: 1px solid black;
	position: relative;
	z-index: 999;
}

#submitButton1 {
	margin-top: 6px;
	margin-right: 2px;
	margin-left: 2px;
}

#alreadyHaveId {
	margin-top: 20px;
}
.input-groupIdEmail{
width:260px;
}
#input2-1 , #input3, #input5, #input6, #input4, #input7, #Profile-pic{
width:320px;
}

.input2 {
   display: inline;
   width: 230px;
}
.input-group {
   width: 320px;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>
<body>
	<b:header></b:header>
	<div class="container">
		<div class="row">
			<div class="col">
				<form method="post">
					<h3>회원가입 정보</h3>
					<div class="form-group">
						<label for="input1">아이디 및 별명</label>
						<%-- <input type="text" class="form-control input2" id="input1" required name="nickname" value="${user.nickname }">
										<button class="btn btn-secondary" id="nicknameCheckButton" type="button">중복확인</button> --%>
						<div class="input-group">
							<input type="text" class="form-control" id="input1" required name="nickname" value="${sessionScope.loginUser.nickname }">
							<div class="input-group-append">
								<button class="btn btn-secondary" id="nicknameCheckButton" type="button">중복확인</button>
							</div>
						</div>
						<small class="form-text" id="nicknameCheckMessage"></small>

					<!--  email hidden -->
					<input type="email" name="email" value="${sessionScope.loginUser.email }">
					
					</div>
					<div class="form-group">
						<label for="input2">비밀번호</label>
						<div class="input-group" id="input2-1">
							<input type="password" class="form-control" id="input2" required name="pw" value="${sessionScope.loginUser.pw }">
						</div>
					</div>

					<div class="form-group">
						<label for="input7">비밀번호 확인</label> <br> <input type="password" class="form-control" id="input7" required>
					</div>


					<div class="form-group">
						<label for="input5">지역 선택</label> <br> <select class="form-control" id="input5" required name="location" value="${sessionScope.loginUser.location }">
							<optgroup label="소식을 전해듣고 싶은 지역을 선택해주세요.">
								<option>강남구</option>
								<option>서초구</option>
								<option>마포구</option>
							</optgroup>
						</select>
					</div>
					<div class="form-group">
						<label for="input6">Profile url </label> <br> <input type="url" class="form-control" id="input6" required name="profileurl" value="${sessionScope.loginUser.profileurl }">
						<div class="input-group-append">
							<button class="btn btn-outline-primary" onclick="myFunction()">기본 프로필로 설정</button>
						</div>
					</div>
					<div class="form-group mt-3">
						<label>프로필 사진</label> <br>
						<div class="position-relative">
							<input type="file" id="Profile-pic" name="channel-img" class="form-control" /> <label for="Profile-pic" class="position-absolute" id="icon" style="left: 272px;"> <i class="fa fa-camera" aria-hidden="true"></i>
							</label>
						</div>

						<!-- <div class="input-group">
									<input type="file" id="Profile-pic" name="channel-img" class="form-conrol">
									<div class="input-group-append"><label for="Profile-pic"><i class="fa fa-camera"></i></label></div>
								</div> -->
					</div>
					<!-- textarea로 바꿔서 여러줄로 나타낼 수 있음 -->
					<div class="form-group">
						<label for="exampleFormControlTextarea1">자기소개</label>
						<textarea class="form-control" required name="introduce" id="input4" cols="40" rows="5" placeholder="나만의 개성을 나타낼수 있는 자기소개를 적어보세요!(최대 500글자)"></textarea>
					</div>
					<button class="btn btn-outline-secondary" id="modifyButton">수정</button>
				</form>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(
			function() {
				
				
				const appRoot = '${pageContext.request.contextPath}';
				const modifyButton = $("#modifyButton");


							let nicknameAble = false;
							let pwCheck = false;
							
							
						
							// 패스워드 확인과 닉네임 중복확인이 완료되었을 때만 수정버튼 활성화
							
							const enableSubmit = function() {
								if (pwCheck && nicknameAble) {
									modifyButton.removeAttr("disabled");
								} else {
									modifyButton.attr("disabled", true);
								}
							}

							// nicknameCheckButton 클릭 시 -> user/nicknameCheck 이동 후 확인
							// 받은 결과에 따라 수정버튼 활성화 또는 비활성화 AND 적절한 메세지 출력
							$("#nicknameCheckButton").click(
									
											function() {
												$("#nicknameCheckButton").attr("disabled", true);

												const nickname = $("#input1").val().trim();

												if (nickname === "") {
													$("#nicknameCheckButton").removeAttr("disabled");
													return;
												}

												$.ajax({
															url : appRoot + "/user/nicknamecheck",
															
															data : {
																nickname : nickname
															},
															success : function(data) {
																switch (data) {
																case "able":
																	// 사용가능 할 때
																	$("#nicknameCheckMessage")
																			.text("사용 가능한 닉네임입니다.")
																			.removeClass("text-warning text-danger")
																			.addClass("text-primary");


																	nicknameAble = true;
																	break;

																case "unable":
																	// 사용 불가능 할 때
																	$("#nicknameCheckMessage")
																			.text("이미 있는 닉네임입니다.")
																			.removeClass("text-warning text-primary")
																			.addClass("text-danger");

																	nicknameAble = false;
																	
																	break;
																	
																case "same":
																	// 같을 때
																	$("#nicknameCheckMessage")
																			.text("기존 닉네임입니다.")
																			.removeClass("text-warning text-danger")
																			.addClass("text-primary");

																	nicknameAble = true;
																	
																	break;
																	
																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$("#nicknameCheckButton").removeAttr("disabled");
															}
														});
											});
							
							// 패스워드, 패스워드확인 인풋요소 값 일치할 때만 수정버튼 활성화
							
							const pwInput = $("#input2");
							const pwConfirmInput = $("#input7");
							
							const confirmFunction = function() {
								const pwValue = pwInput.val();
								const pwConfirmValue = pwConfirmInput.val();

								if (pwValue === pwConfirmValue) {
									
									pwCheck = true;
									
									modifyButton.removeAttr("disabled");
								} else {
									
									pwCheck = false;
									
									modifyButton.attr("disabled", true);
								}

								enableSubmit();
							}

							modifyButton.attr("disabled", true); // 수정 버튼 비활성화

							pwInput.keyup(confirmFunction);
							pwConfirmInput.keyup(confirmFunction);
						});
			
		
		</script>
		
		<script type="text/javascript">
		$(document).ready(function() {
			var result = "<c:out value= '${result}'/>";
			if(result != ''){
				alert(result);
			}
		})
		</script>
		
</body>
</html>














