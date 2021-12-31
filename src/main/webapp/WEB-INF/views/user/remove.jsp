<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<form action="user/remove" method="post" id="deleteForm" name="deleteForm">
                       <input type="hidden" id="email" name="email" value="${sessionScope.loginUser.email }">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">${sessionScope.loginUser.nickname }님 탈퇴하려면 비밀번호를 입력해주세요.</p>
                <div class="form-group">
                    <input type="password" id = "pw" required name="pw" class="form-control form-control-inline text-center" placeholder="비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" id="pwcheck"   class="form-control form-control-inline text-center" placeholder="비밀번호 확인" />
                </div>
                <button type="button" id="remove" name="remove" class="btn btn-primary">회원탈퇴</button> <a href="../user/profile" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script type="text/javascript">
		$(document).ready(function(){
			
			const appRoot = '${pageContext.request.contextPath}';
			
			$("#remove").on("click", function(){
				
				const pwValue = $("#pw").val().trim();
				const pwcheckValue = $("#pwcheck").val().trim();
				
				
				if(pwValue === ""){
					alert("비밀번호를 입력해주세요");
					$("#pw").focus();
					
					return false;
				}
				
				if(pwcheckValue === ""){
					alert("비밀번호 확인을 입력해주세요");
					$("#pwcheck").focus();
					
					return false;
				}
				
				if (pwValue != pwcheckValue) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#pw").focus();
					 
					return false;
					}
				
				$.ajax({
					url : appRoot + "/user/remove",
					
					data : 
						email = email,
					success: function(data){
						
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					});
				})
			});
	</script>

</body>
</html>