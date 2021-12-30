<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style>
body {
	background:
		url(https://s20211227-dotori-team-project.s3.ap-northeast-2.amazonaws.com/board/background-g24f874160_1920.jpg);
	background-size: cover;
}

#loginText {
	color: #3e4041;
}

#loginForm {
	position: absolute;
	width: 300px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
	background-color: rgba(255, 255, 255, 0.5);
}

#inputEmail {
	background-color: rgba(255, 255, 255, 0.5);
}

#inputPw {
	background-color: rgba(255, 255, 255, 0.5);
}

#korean {
	color: 0c0d0d;
	position: relative;
	top: 5px;
}

#loginButton {
	position: relative;
	top: 14px;
}

.pw {
	position: relative;
	top: 6px;
}

p {
	position: relative;
	top: 50px;
}

#goSignUp {
	position: relative;
	top: 30px;
}
</style>
<title>Login!</title>
</head>
<body>
	<b:header></b:header>

	<div class="container">
		<div class="row" id="loginForm">
			<div class="col">
				<br>
				<h1 id="loginText">Login</h1>
				<form method="post">
					<div class="login-group">
						<br>
						<label for="input1" id="korean">아이디</label>
						<input id="inputEmail" type="email" class="form-control" name="email" required placeholder="childhood@naver.com">
					</div>
					<div class="login-group pw">
						<label for="input2" id="korean">패스워드</label>
						<input id="inputPw" type="password" class="form-control" name="pw" required>
					</div>
					<button class="btn btn-outline-dark" id="loginButton">로그인</button>
					<p>만약 계정이 없으시다면,</p>
					<a href="${pageContext.request.contextPath }/user/signup" id="goSignUp">sign up</a>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>