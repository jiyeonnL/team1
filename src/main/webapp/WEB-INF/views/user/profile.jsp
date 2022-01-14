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
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style>
a {
	text-decoration: none;
	color: inherit;
}

a:hover {
	text-decoration: none;
	color: inherit;
}
#body {
	height: 150vh;
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	width: 900px;
	height: 100%;
}


#profile-modify{
background-color:#264d73;
color:white;
font-size:large;

}
#profile-remove{
background-color:#f0615c;
color:white;
font-size:large;
margin-top:5px;
}

</style>
</head>
<body>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div class="container-fluid my-1">
				<div class="row md mx-3 mt-4 mb-2">
					<div class="col-md-3 my-auto align-self-center ">
						<img src = "${user.url}"
							class ="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
					</div>
					<div class="col-md-5 mx-3 my-auto align-self-center ">
						<div class="h1">${user.nickname }</div>
						<span class="h4 mt-3">${user.location }</span> <span
							class="h4 mt-3 ms-3">#${user.id }</span>
						<div class="h4 mt-3">${user.signupday }</div>
					</div>

					<c:if
						test="${not empty sessionScope.loginUser && sessionScope.loginUser.id eq user.id}">

						<div class="col-md-3 offset-md-2 mx-auto my-auto ">
							<button type="button" id="profile-modify" class="btn btn-lg">
								정보수정</button>
							<button type="button" id="profile-remove" class="btn btn-lg ">
								회원탈퇴</button>
						</div>

					</c:if>
				</div>
				<div class="row md mx-3 mt-4 mb-2">
					<div class="col-md-12 ">
						<div class="h3 mt-1">
						<h5>인사글: </h5>
						<pre>${user.introduce }</pre></div>
					</div>
				</div>
				<div class="row md mx-3 mt-4 mb-2 bg-info">
					<div class="col-md-12 ">
						<div id="line"></div>
					</div>
				</div>
		 		<div class="container">
   					<div class="row">
      					<div class="col">
       						<h3>내가 쓴 글 </h3>
       						<table class="table">
          					<thead>
            				<tr>
            					<th>게시판</th>
              					<th>Tag(태그)</th>
              					<th>제목</th>
              					<th>작성 일자</th>
            				</tr>
          					</thead>
          					<tbody>
            					<c:forEach items="${list }" var="list">
              					<tr>
              					<td>
                  					${list.boardType }
                				</td>
                				<td>
                  					${list.tag }
                				</td>
                				<td>
                					<a href = "/controller1/${list.link}/list/${list.postId}">
                						${list.title }
                					</a>
                  					
                				</td>
               					<td>
                  					${list.inserted }
                				</td>
              
            					</c:forEach>
          					</tbody>
        				</table>
     				 </div>
    			</div>
  				</div>
			</div>
		</div>
	</div>
	<script>
		$("#profile-modify").click(function() {
			location.href = "/controller1/user/infoModify"
		});

		$("#profile-remove").click(function() {
			location.href = "/controller1/user/remove"
		});
		
	</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>

</body>
</html>