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
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div class="container mt-5">
				<div class="row">
					<div class="col-md-6 bg-secondary">여기에 로고나 장식용 그림같은거 넣기</div>
					<div class="col-md-6  border border-5">
						<form method="post">
							<h3>Sign Up Now!!!</h3>
							<div class="form-group">
								<label for="input1">NickName</label>

								<div class="input-group">
									<input type="text" class="form-control" id="input1" required name="nickname" value="${user.nickname }">
									<small class="form-text" id="nicknameCheckMessage"></small>
								</div>
				              	<div class="input-group-append">
              					  <button class="btn btn-secondary" id="nicknameCheckButton" type="button">중복확인</button>
             				 	</div>

							</div>
							<div class="form-group">
								<label for="input2">Password</label>
								<div class="input-group">
									<input type="password" class="form-control" id="input2" required name="pw" value="${user.pw }">
								</div>
							</div>
							<div class="form-group">
           						<label for="input6">Password Check</label>
           						<input type="password" class="form-control" id="input7" required>
         					</div>
							<div class="form-group">
								<label for="input3">Email</label>
								<div class="input-group">
									<input type="email" class="form-control" id="input3" required name="email" value="${user.email }">
								</div>
								
							</div>

							

							<div class="form-group">
								<label for="input5">Region</label> <select class="form-control" id="input5" required name="location" value="${user.location }">
									<option>Select your Region...</option>
									<option>마포구</option>
									<option>서초구</option>
									<option>강남구</option>

								</select>
							</div>
							<div class="form-group">
								<label for="input6">Profile url</label> <input type="url" class="form-control" id="input6" required name="profileurl" value="${user.profileurl }">
							</div>
							<button class="btn btn-outline-primary" onclick="myFunction()">기본 프로필로 설정</button>
							<div class="form-group mt-3">
								<label>Profile Photo</label> <input type="file" id="Profile-pic"
									name="channel-img" class="form-control" /> <label
									for="Profile-pic" id=icon> <i
									class="fa fa-camera" aria-hidden="true"></i>
								</label>
							</div>
							<div class="form-group">
								<label for="input4">introduce</label>
								<div class="input-group">
									<input type="text" class="form-control" id="input4" required name="introduce" value="${user.introduce }">
								</div>
							</div>
							<button class="btn btn-outline-primary" id="submitButton1">가입</button>
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
	
<script>

$(document).ready(
function() {
	
    const pwInput = $("#input2");
    const pwConfirmInput = $("#input7");
    const submitButton = $("#submitButton1");
    
	let nicknameAble = false;
	let pwCheck = false;
	
	let enableSubmit = function() {
        if (pwCheck && nicknameAble) {
          submitButton.removeAttr("disabled");
        } else {
          submitButton.attr("disabled", true);
        }
      }
	
	const appRoot = '${pageContext.request.contextPath}';
	
	$("#nicknameCheckButton").click(
            function() {
              $("#nicknameCheckButton").attr("disabled", true);

              const nicknameValue = $("#input1").val().trim();

              if (nicknameValue === "") {
                $("#nicknameCheckMessage").text("아이디를 입력해주세요!").removeClass(
                    "text-primary text-danger").addClass("text-warning");
                $("#nicknameCheckButton").removeAttr("disabled");
                return;
              }

              $.ajax({
                url : appRoot + "/user/nicknamecheck",
                data : {
                  nickname : nicknameValue
                },
                success : function(data) {
                  switch (data) {
                  case "able":
              
                    $("#nicknameCheckMessage").text("사용 가능한 아이디 입니다.")
                        .removeClass("text-danger text-warning").addClass(
                            "text-primary");
                    
                    $("#input1").attr("readonly", true);

                    nicknameAble = true;
                    break;
                  case "unable":
               
                    $("#nicknameCheckMessage").text("이미 있는 아이디 입니다.")
                        .removeClass("text-warning text-primary").addClass(
                            "text-danger");

          
                    nicknameAble = false;
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
   			
  			const confirmFunction = function() {
    
 		    const pwValue = pwInput.val();
  		    const pwConfirmValue = pwConfirmInput.val();

    		if (pwValue === pwConfirmValue) {
        
        		pwCheck = true;
        		
      		} else {
       
      				pwCheck = false;
      			}

    		  enableSubmit();
    		};

   			submitButton.attr("disabled", true);
   			pwInput.keyup(confirmFunction);
   			pwConfirmInput.keyup(confirmFunction);
   			
   			

	});
	function myFunction() {
			  document.getElementById("input6").defaultValue = "http://localhost:8080/userprofile/info";
			}
</script>
</body>
</html>