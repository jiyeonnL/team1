<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title> 

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style>
#body {
	height: 150vh;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	border: 2px solid yellowgreen;
	width: 900px;
	height: 100%;
}

#line {
	height: 2px;
	background-color: yellowgreen;
	width: 100%;
}
</style>
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous">
		
	</script>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div class="container-fluid my-1">
				<div class="row md mx-3 mt-4 mb-2">
					<div class="col-md-3 my-auto align-self-center ">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iBqF1VCpU79WLGw_qgx0jFSuMlmLRTO25mJkJKqJ7KArrxjWB-eu2KQAFrOdW2fFKso&usqp=CAU"
							class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
					</div>
					<div class="col-md-5 mx-3 my-auto align-self-center ">
						<div class="h1">${user.nickname }</div>
						<span class="h4 mt-3">${user.location }</span> <span
							class="h4 mt-3 ms-3">#${user.id }</span>
						<div class="h4 mt-3">${user.signupday }</div>
					</div>

					<c:if
						test="${not empty sessionScope.loginUser && sessionScope.loginUser.id eq user.id}">

						<div class="col-md-2 offset-md-2 mx-auto my-auto ">
							<button type="button" id="modify" class="btn btn-lg btn-primary">
								정보수정</button>
							<button type="button" id="remove" class="btn btn-lg btn-danger">
								회원탈퇴</button>
						</div>

					</c:if>
				</div>
				<div class="row md mx-3 mt-4 mb-2">
					<div class="col-md-12 ">
						<div class="h3 mt-1">${user.introduce }</div>
					</div>
				</div>
				<div class="row md mx-3 mt-4 mb-2 bg-info">
					<div class="col-md-12 ">
						<div id="line"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#modify").click(function() {
			location.href = "/controller1/user/infoModify"
		});

		$("#remove").click(function() {
			location.href = "/controller1/user/remove"
		});
	</script>

	<script>
		$("#modify").click(function() {
			location.href = "/controller1/user/infoModify"
		});

		$("#remove").click(function() {
			location.href = "/controller1/user/remove"
		});
	</script>
</body>
</html>