<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
body {
	background-color: #ffe164;
}

#body {
	height: auto;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	/* width: 900px; */
	text-align: center;
	height: auto;
	align-items: center;
	background-color: #FFFFFF;
	border-radius: 15px;
	background-color: rgba(255, 255, 255, 0.5);
	margin-top: 50px;
	left: 50%;
	border: 4px solid;
	border-color: #2f6091;
}

.container mt-5 {
	height: auto;
}

.row {
	border-radius: 15px;
}

#icon {
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 40px;
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
	border: 1px solid black;
	z-index: 999;
}

#submitButton1 {
	margin-top: 6px;
	margin-right: 2px;
	margin-left: 2px;
	border: 3px solid;
	border-color: #2f6091;
}

#alreadyHaveId {
	margin-top: 20px;
}

.input-group {
	width: 320px;
	margin: 0 auto;
}

.input-groupIdEmail {
	margin: 0 auto;
}

#input7, #input5, #input6, #input4, #Profile-pic {
	width: 320px;
	background-color: rgba(255, 255, 255, 0.5);
	margin: 0 auto;
	border: 3px solid;
	border-color: #2f6091;
}

#input1 {
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}

#input2 {
	display: inline;
	width: 230px;
	background-color: rgba(255, 255, 255, 0.5);
	border: 3px solid;
	border-color: #2f6091;
}

#input2-1 {
	width: 320px;
}

#input3 {
	background-color: rgba(255, 255, 255, 0.5);
	margin: 0 auto;
	border: 3px solid;
	border-color: #2f6091;
}

#nicknameCheckButton, #emailCheckButton {
	border: 3px solid;
	border-color: #2f6091;
}

.bg-secondary {
	background-color: #FFFFFF;
	background-color: rgba(255, 255, 255, 0.5);
}

.border-bottom-left-radius {
	border-bottom-left-radius: 15px;
}

.border-bottom-right-radius {
	border-bottom-right-radius: 15px;
}

.place {
	margin-top: 8px;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<%-- <b:innerNav></b:innerNav> --%>
			<div class="container mt-5">
				<!-- 입력 박스  -->
				<div class="row">
					<!-- <div class="col-md-4 border-bottom-left-radius">여기에 로고나 장식용 그림같은거 넣기</div> -->
					<!-- <div class="col-md-8  border border-5 border-bottom-right-radius"> -->
					<form method="post">
						<h3>회원가입 정보</h3>
						<br>
						<div class="form-group">
							<label for="input1">아이디 및 별명</label>
							<%-- <input type="text" class="form-control input2" id="input1" required name="nickname" value="${user.nickname }">
										<button class="btn btn-secondary" id="nicknameCheckButton" type="button">중복확인</button> --%>
							<div class="input-group">
								<input type="text" class="form-control" id="input1" required name="nickname" value="${user.nickname }">
								<div class="input-group-append">
									<button class="btn btn-outline-dark" id="nicknameCheckButton" type="button">중복확인</button>
								</div>
							</div>
							<small class="form-text" id="nicknameCheckMessage"></small>

						</div>
						<div class="form-group place">
							<label for="input2">비밀번호</label>
							<div class="input-group" id="input2-1">
								<input type="password" class="form-control" id="input2" required name="pw" value="${user.pw }">
							</div>
						</div>

						<div class="form-group place">
							<label for="input7">비밀번호 확인</label>
							<br>
							<input type="password" class="form-control" id="input7" required>
						</div>

						<div class="form-group place">
							<label for="input3">이메일</label>
							<div class="input-groupIdEmail">
								<div class="input-group">
									<input type="email" class="form-control" id="input3" required name="email" value="${user.email }">
									<div class="input-group-append">
										<button class="btn btn-outline-dark" id="emailCheckButton" type="button">중복확인</button>
									</div>
								</div>
								<small class="form-text" id="emailCheckMessage"></small>
							</div>
						</div>

						<div class="form-group place">
							<label for="input5">지역 선택</label>
							<br>
							<select class="form-control" id="input5" required name="location" value="${user.location }">
								<optgroup label="소식을 전해듣고 싶은 지역을 선택해주세요.">
									<option>강남구</option>
									<option>서초구</option>
									<option>마포구</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group place">
							<label for="input6">Profile url </label>
							<br>
							<input type="url" class="form-control" id="input6" required name="profileurl" value="${user.profileurl }">
							<div class="input-group-append">
								<button class="btn btn-outline-dark" onclick="myFunction()">기본 프로필로 설정</button>
							</div>
						</div>
						<div class="form-group mt-3">
							<label>프로필 사진</label>
							<br>
							<div class="position-relative">
								<input type="file" id="Profile-pic" name="channel-img" class="form-control" />
								<!-- <label for="Profile-pic" id="icon" style="left: 10px;"> -->
								<!-- <i class="fa fa-camera" aria-hidden="true"></i> -->
								</label>
							</div>

							<!-- <div class="input-group">
									<input type="file" id="Profile-pic" name="channel-img" class="form-conrol">
									<div class="input-group-append"><label for="Profile-pic"><i class="fa fa-camera"></i></label></div>
								</div> -->
						</div>
						<!-- textarea로 바꿔서 여러줄로 나타낼 수 있음 -->
						<div class="form-group place">
							<label for="exampleFormControlTextarea1">자기소개</label>
							<textarea class="form-control" required name="introduce" id="input4" cols="40" rows="5" value="${user.introduce }" placeholder="나만의 개성을 나타낼수 있는 &#13;&#10;자기소개를 적어보세요! (최대 500글자)"></textarea>
						</div>
						<button class="btn btn-outline-dark btn-lg place" id="submitButton1">가입</button>
					</form>

					<br>
					<div class="form-group">
						<p class="not-yet" id="alreadyHaveId">
							이미 아이디를 가지고 계신가요?
							<a href="../user/login">로그인</a>
						</p>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {

							// 중복체크, 변수선언
							const pwInput = $("#input2");
							const pwConfirmInput = $("#input7");
							const submitButton = $("#submitButton1");

							let emailAble = false;
							let nicknameAble = false;
							let pwCheck = false;

							// 이메일, 닉네임이 중복 안될경우 & pw체크까지 한 경우 서브밋 버튼 활성화
							let enableSubmit = function() {
								if (emailAble && pwCheck && nicknameAble) {
									submitButton.removeAttr("disabled");
								} else {
									submitButton.attr("disabled", true);
								}
							}

							const appRoot = '${pageContext.request.contextPath}';

							// 닉네임 중복 확인 버튼
							$("#nicknameCheckButton")
									.click(
											function() {

												const nicknameValue = $("#input1").val().trim();
												// 닉네임을 안적었을 경우 닉네임 입력하라는 문구 출력
												if (nicknameValue === "") {
													$("#nicknameCheckMessage")
															.text(
																	"닉네임을 입력해주세요!!")
															.removeClass(
																	"text-primary text-danger")
															.addClass(
																	"text-warning");
													$("#nicknameCheckButton")
															.removeAttr(
																	"disabled");
													return;
												}

												// ajax 닉네임 중복 눌렀을경우 로직 (1. 사용 가능한 아이디  /  2. 중복되서 불가능한 아이디)

												$
														.ajax({
															url : appRoot
																	+ "/user/nicknamecheckForSignup",
															data : {
																nickname : nicknameValue
															},
															success : function(
																	data) {
																switch (data) {
																// 1. 사용 가능아이디
																case "able":

																	$(
																			"#nicknameCheckMessage")
																			.text(
																					"사용 가능한 닉네임 입니다.")
																			.removeClass(
																					"text-danger text-warning")
																			.addClass(
																					"text-primary");

																	$("#input1")
																			.attr(
																					"readonly",
																					true);

																	nicknameAble = true;
																	break;
																// 2. 중복일 경우
																case "unable":

																	$(
																			"#nicknameCheckMessage")
																			.text(
																					"이미 존재하는 닉네임 입니다.")
																			.removeClass(
																					"text-warning text-primary")
																			.addClass(
																					"text-danger");

																	nicknameAble = false;
																	break;

																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$(
																		"#nicknameButton")
																		.removeAttr(
																				"disabled");
															}
														});
											});
							$("#emailCheckButton")
									.click(
											function() {

												const emailValue = $("#input3")
														.val().trim();

												// 이메일을 안적었을 경우 이메일 입력하라는 문구 출력
												if (emailValue === "") {
													$("#emailCheckMessage")
															.text(
																	"email을 입력해주세요!!")
															.removeClass(
																	"text-primary text-danger")
															.addClass(
																	"text-warning");
													$("#emailCheckButton")
															.removeAttr(
																	"disabled");
													return;
												}

												// ajax 닉네임 중복 눌렀을경우 로직 (1. 사용 가능한 이메일  /  2. 중복되서 불가능한 이메일)

												$
														.ajax({
															url : appRoot
																	+ "/user/emailcheck",
															data : {
																email : emailValue
															},
															success : function(
																	data) {
																switch (data) {
																// 1. 사용 가능아이디
																case "able":

																	$(
																			"#emailCheckMessage")
																			.text(
																					"사용 가능한 이메일 입니다.")
																			.removeClass(
																					"text-danger text-warning")
																			.addClass(
																					"text-primary");

																	$("#input3")
																			.attr(
																					"readonly",
																					true);

																	emailAble = true;
																	break;
																// 2. 중복일 경우
																case "unable":

																	$(
																			"#emailCheckMessage")
																			.text(
																					"이미 존재하는 이메일 입니다.")
																			.removeClass(
																					"text-warning text-primary")
																			.addClass(
																					"text-danger");

																	emailAble = false;
																	break;

																default:
																	break;
																}
															},
															complete : function() {
																enableSubmit();
																$(
																		"#emailButton")
																		.removeAttr(
																				"disabled");
															}

														});
											});
							// 비밀번호 서로 일치하는지 확인 
							const confirmFunction = function() {

								const pwValue = pwInput.val();
								const pwConfirmValue = pwConfirmInput.val();

								if (pwValue === pwConfirmValue) {

									pwCheck = true;

								} else {

									pwCheck = false;
								}
								//일치 할 경우 서브밋 버튼 활성화
								enableSubmit();
							};

							submitButton.attr("disabled", true);
							pwInput.keyup(confirmFunction);
							pwConfirmInput.keyup(confirmFunction);

						});
		//버튼 누를시 임시(기본) URL 전송
		function myFunction() {
			document.getElementById("input6").defaultValue = "http://localhost:8080/userprofile/info";
		}
	</script>

</body>
</html>