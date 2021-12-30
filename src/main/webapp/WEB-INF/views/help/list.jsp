<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>해주세요</title>

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
    font-size: 1.0rem;
    text-align:center;
    justify-content: center;
    border: 3px solid yellowgreen;
    border-radius: 5px;
    width: 80%;
}

#line {
	height: 2px;
	background-color: yellowgreen;
	width: 100%;
}

#image {

    width: 80%;
    height: 200px;
    object-fit: cover;

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
			<!-- 검색결과 리스트 -->
			<!-- for 문 돌면서 list에 있는 요소(게시물)들 출력 -->
			<c:forEach items="${list}" var="board">
				<div class="container-fluid my-1 border border-3 border-secondary">
					<div class="row md mx-3 my-2">
						<div class="col-md-2 my-auto px-auto">
							<div id="tag">일반</div>
						</div>
						<div class="col-md-10 h4 my-auto ">
							<div>
								<a href="list/${board.id }">
									${board.title}
							 	</a>
							 </div>
						</div>
						<div class="col-md-2 offset-md-6 my-auto h5">
							<div>2days ago</div>
						</div>

						<div class="row md px-0 mx-0 my-2">
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
							<div class="col-md-2 my-auto h5">${board.nickname}</div>

						</div>
						<!-- preview에 올릴 한장의 이미지 -->
						<div class="row md px-0 mx-0 justify-content-center">
							<div class="col-md-8 my-auto mx-0 d-flex justify-content-center">
								<img src="http://blog.jinbo.net/attach/615/200937431.jpg"
									id="image" alt="..." />
							</div>
						</div>
						<div class="row md px-0 mx-0 my-2">
							<div class="col-md-12 ">
								<div id="line"></div>
							</div>
						</div>

						<div class="row md mx-4">
							<div class="col-md-2">
								<i class="fa fa-thumbs-up fa-fw fa-3x m-r-3"></i> ${board.up}
							</div>
							<div class="col-md-2">
								<i class="fa fa-comments fa-fw fa-2x m-r-3"></i> 15
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