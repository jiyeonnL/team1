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

#postBody {
	width: 100%;
	border: 2px solid yellowgreen;
	border-radius: 10px;
	margin-top: 5px;
}

#tag {
	font-size: 1.5rem;
	text-align: center;
	justify-content: center;
	border: 3px solid yellowgreen;
	border-radius: 5px;
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
			<b:cover></b:cover>
			<!-- for 문 돌면서 list에 있는 요소(게시물)들 출력 -->
			<c:forEach items="${list}" var="board">
				<div id = "postBody">
					<div class="container-fluid my-1">
						<!-- 헤ㅓ -->
						<div class="row md ms-4 px-2 align-middle">
							<div class="col-md-1 px-1 py-0 my-0">
								<img
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iBqF1VCpU79WLGw_qgx0jFSuMlmLRTO25mJkJKqJ7KArrxjWB-eu2KQAFrOdW2fFKso&usqp=CAU"
									class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
							</div>
							<div class="col-md-3 bg-warning my-auto h2 align-middle">${board.nickname}</div>
							<div class="col-md-2 bg-info my-auto h5 offset-md-6 px-2">
								${board.inserted}</div>
						</div>

						<!-- 헤더랑 body 구분 선 -->
						<div class="row md mx-3 my-2">
							<div class="col-md-12 ">
								<div id="line"></div>
							</div>
						</div>

						<!-- body -->
						<div class="row md ms-4 my-2 align-middle">
							<!-- tag -->
							<div class="col-md-2 my-auto px-auto">
								<div id="tag">일반</div>
							</div>
							<!-- 텍스트 -->
							<div class="col-md-10 h4 my-auto ">${board.content}</div>
						</div>
						<!-- 이미지 파트 -->
						<div class="row md mx-3 mt-4 mb-2 justify-content-center">
							<div class="col-md-8 my-auto align-self-center">
								<img src="http://blog.jinbo.net/attach/615/200937431.jpg"
									class="img-fluid" alt="..." />
							</div>
						</div>

						<!-- body랑 footer 구분 선 -->
						<div class="row md mx-3 my-2">
							<div class="col-md-12 ">
								<div id="line"></div>
							</div>
						</div>

						<!-- footer -->
						<div class="row md mx-4">
							<div class="col-md-2">
								<i class="fa fa-thumbs-up fa-fw fa-3x m-r-3"></i> 15
							</div>
							<div class="col-md-2">
								<i class="fa fa-comments fa-fw fa-3x m-r-3"></i> 15
							</div>
						</div>

						<!-- footer 와 댓글창 구분 선-->
						<div class="row md mx-3 my-2">
							<div class="col-md-12 ">
								<div id="line"></div>
							</div>
						</div>

						<!-- 댓글 창 -->>

						<div class="row md mx-4 my-3">
							<div class="col-md-10 mx-0">
								<textarea class="form-control px-0" placeholder="댓글을 남겨보세요!"
									id="exampleFormControlTextarea1"></textarea>
							</div>
							<div class="col-md-2 px-0">
								<button
									class="btn btn-block btn-primary d-flex align-items-stretch">
									Button</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 태그 -->

		</div>
	</div>



</body>
</html>