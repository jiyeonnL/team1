<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 */


* {
	font-family: 'Jua', sans-serif;
}
body{
background-color: #ffe164;}

#loginText {
	color: #3e4041;
}

#loginForm {
	position: absolute;
	width: 400px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
	background-color: rgba(255, 255, 255, 0.5);
	border: 4px solid;
	border-color: #2f6091;
}

#inputEmail {
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	border: 3px solid;
	border-color: #2f6091;
}

#inputPw {
	background-color: rgba(255, 255, 255, 0.5);
	text-align: center;
	border: 3px solid;
	border-color: #2f6091;
}

#korean {
	color: 0c0d0d;
	position: relative;
	top: 5px;
}

#loginButton {
	position: relative;
	top: 14px;
	border: 3px solid;
	border-color: #2f6091;
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
	top: 35px;
	color: #f0615c;
}
</style>
<title>Login!</title>
</head>
<body>
	<b:header></b:header>
	<div class="container" id="login-back-ground">
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
					<a href="${pageContext.request.contextPath }/user/signup" id="goSignUp">회원가입</a>
					
					
				</form>
			</div>
		</div>
	</div>
	<c:if test="${not empty result }">
          <div class="alert alert-warning">${result }</div>
    </c:if> 			

</body>
</html>