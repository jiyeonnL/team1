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

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

#icon{
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
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-6 bg-secondary">여기에 로고나 장식용 그림같은거 넣기</div>
					<div class="col-md-6  border border-5">
						<form action="" class="Signup">
							<h3>Sign Up Now!!!</h3>
							<div class="form-group mt-3">
								<label for="name">NickName</label> <input type="text"
									class="form-control" placeholder="NickName" name="name"
									required />
							</div>
							<div class="form-group mt-3">
								<label for="email">Email</label> <input type="text"
									class="form-control" placeholder="Enter Email" name="email"
									required />
							</div>
							<div class="form-group mt-3">
								<label for="psw">Password</label> <input type="password"
									class="form-control" placeholder="Enter Password" name="psw"
									required />
							</div>
							<div class="form-group mt-3">
								<label for="psw-repeat">Repeat Password</label> <input
									type="password" class="form-control"
									placeholder="Repeat Password" name="psw-repeat" required />
							</div>

							<div class="form-group mt-3">
								<label for="country" class="form-label"> Region </label> <select
									class="form-select" id="country" required>
									<option value="">Choose...</option>
									<option>지역1</option>
									<option>지역2</option>
									<option>지역3</option>
								</select>
							</div>

							<div class="form-group mt-3">
								<label>Profile Photo</label> <input type="file" id="Profile-pic"
									name="channel-img" class="form-control" /> <label
									for="Profile-pic" id=icon> <i
									class="fa fa-camera" aria-hidden="true"></i>
								</label>
							</div>
							<div class="d-grid gap-2 mt-3">
								<button type="submit" class="btn btn-success">Signup</button>
							</div>
							<hr />
							<div class="form-group">
								<p class="not-yet">
									Already have an account? <a href="#">Login</a>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>