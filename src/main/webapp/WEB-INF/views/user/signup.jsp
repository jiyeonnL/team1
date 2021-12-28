<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/user"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<style>
		
		#body{
			
			height: 150vh;
    /* height: calc(100vh-72px); */
    		width: 100%;
    		justify-content: center;
    		display: flex;
		
		}
		
		#inner{
    		border: 2px solid yellowgreen;
    		width: 900px;
    		height: 100%;		
		}
	</style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    
    <b:header></b:header>
      <div id="body">
        <div id="inner">
				<h1>회원 가입</h1>

				<form method="post">
					<div class="form-group">
						<label for="input1">아이디</label>

						<div class="input-group">
							<input type="text" class="form-control" id="input1" required name="nickname" value="${user.nickname }">
						</div>

			
					</div>
					<div class="form-group">
						<label for="input2">패스워드</label> 
						<div class="input-group">
							<input type="password" class="form-control" id="input2" required name="pw" value="${user.pw }">
						</div>
					</div>
					<div class="form-group">
						<label for="input3">자기소개</label>
						<div class="input-group">
							<input type="text" class="form-control" id="input3" required name="introduce" value="${user.introduce }">
						</div>
						<small class="form-text" id="nickNameCheckMessage"></small>
					</div>
					
					<div class="form-group">
						<label for="input4">이메일</label> 
						<div class="input-group">
						<input type="email" class="form-control" id="input4" required name="email" value="${user.email }">
						</div>
					</div>
					
					<div class="form-group">
						<label for="input5">주소</label> 
						<select class="form-control" id="input5" required name="location" value="${user.location }">
							<option>강남구</option>
							<option>마포구</option>
							<option>서초구</option>
							<option>성남</option>
							
						</select>
					</div>
					<div class="form-group">
						<label for="input6">회원 프로필 선택</label> 
						<input type="text" class="form-control" id="input6" required name="profileurl" value="${user.profileurl }">
					</div>
					<button class="btn btn-outline-primary" id="submitButton1">가입</button>
				</form>
			</div>
		</div>
	</div>
        </div>
      </div>

</body>
</html>