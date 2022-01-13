<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>


<style>

.container{
font-family: 'Jua', sans-serif;
}
#login, #signup{
background-color: #ffe164;
font-size: x-large;
}
.me-lg-auto{
margin-right:auto;
}

.header-size{
font-size: x-large;
}
#icon-header{
color:white;
}

#dropdown{
z-index:999;
}

#dropdownMenuButton1{
color:white;
}
#dropdown-item{
font-size:x-large;
}

/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 :#f0615c   */
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Jua&display=swap" rel="stylesheet">

<header class="p-3 text-white " style="background-color: #264d73;" id="head-all">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
			<a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none" id="header-jua"></a>

			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 header-size">

				<li><a href="${pageContext.request.contextPath }/all/list" class="nav-link px-2 text-white"> 
				<i class="fas fa-home" id="icon-header"></i> 홈 
				</a></li>
				<li><a href="/" class="nav-link px-2 text-white"> 
				<i class="far fa-file-alt" id="icon-header"></i> 미정   
				</a></li>
				<li><a href="/" class="nav-link px-2 text-white"> 
				<i class="fas fa-question-circle" id="icon-header"></i> 자주묻는 질문 </a></li>
				<li><a href="/" class="nav-link px-2 text-white"> 
				<i class="fas fa-user-edit" id="icon-header"></i> 제작자 </a></li>

			</ul>

			<div class="text-end dropdown">
				<!-- 로그인 하지 않은 상태인 경우 로그인, 회원가입 버튼을 띄운다 -->
				<c:if test="${empty sessionScope.loginUser }">
					<button type="button" id=login class="btn btn-outline-dark">로그인</button>
					<button type="button" id=signup class="btn btn-outline-dark">회원가입</button>
				</c:if>
				<!-- 로그인 한 상태인 경우 프로필을 띄운다. -->
				<c:if test="${not empty sessionScope.loginUser }">
					<span>
						<img src="${sessionScope.loginUser.profileurl }" width="50" height="50" class="rounded-circle me-3" alt="error" />
					</span>
					<span class="align-middle h3 dropdown-toggle" id="dropdownMenuButton1" data-toggle="dropdown" data-display="static" aria-expanded="false"> ${sessionScope.loginUser.nickname } </span>
					<ul id="dropdown" class="dropdown-menu dropdown-menu-lg-right" aria-labelledby="dropdownMenuButton1">

						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath }/user/profile/${sessionScope.loginUser.nickname}">프로필 수정</a>
						</li>
						<c:if test="${sessionScope.loginUser.adminQuali eq 1 }">
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath }/report/list">신고 관리</a>
						</li>
						</c:if>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath }/user/logout">로그아웃</a>
						</li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
	<b:loginModal></b:loginModal>
</header>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>

	$(document).ready(function(){
		const main = $(location).attr('href'); 
		
		if(main === 'http://localhost:8080/controller1/all/list'
				|| main === 'http://localhost:8080/controller1/user/signup' 
				|| main === 'http://localhost:8080/controller1/user/login'){
			
			$("#login").click(function() {
				location.href="/controller1/user/login"
			});
	
		}else{
			$("#login").click(function() {
				$('#myModal').modal('show');
			});
		};
		$("#signup").click(function() {
			location.href="/controller1/user/signup"
		});
	});

</script>