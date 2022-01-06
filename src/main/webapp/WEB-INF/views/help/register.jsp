<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<style>
/*노랑 배경색 : #ffe164
  파랑 배경색 : #264d73
  빨간 포인트색 : #f0615c
  하늘색 배경색 : #eef2f6 */
#body {
	/* height: calc(100vh-72px); */
	width: 100%;
	justify-content: center;
	display: flex;
}

#inner {
	width: 900px;
	height: 100%;
}
.패딩정리{
padding-right:0px;
padding-left:0px;}

.form-group {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#input4 {
	height: 150px;
}

#input6 {
	width: 20%;
}

.btn-register {
	color: #f0615c;
}

.btn-cancel {
	color: #264d73;
}
</style>

<title>게시물 작성</title>
</head>
<body>
<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<div class="col 패딩정리">
			<b:innerNav></b:innerNav>
				<h1>게시물 작성</h1>


			<form method="post" enctype="multipart/form-data">
				
				<input type="hidden" class="form-control" id="input1" name="memberId" value="${sessionScope.loginUser.id }">

					<div class="form-group">
						<label for="input2">닉네임</label>
						<input type="text" class="form-control" id="input2" name="nickname" value="${sessionScope.loginUser.nickname }" readonly>
					</div>

					<div class="form-group">
						<label for="input5">지역</label>
						<input type="text" class="form-control" name="location" value="${sessionScope.loginUser.location }" id="input5" readonly>
					</div>

          			<div class="form-group">
            			<label for="input3">제목</label>
           				<input type="text" class="form-control" id="input3" name="title">
          			</div>
          
         			 <div class="form-group">
           				 <label for="input4">내용</label>
          				 <textarea class="form-control" id="input4" name="content"></textarea>
          			</div>
          
  		 		    <div class="form-group">
           				 <label for="input6">태그</label>
           				 <select class="form-control" id="input6" name="tag">
          				  	<option value="기타" selected>태그 선택</option>
          				  	<option value="사다주세요">사다주세요</option>
           				 	<option value="맡아주세요">맡아주세요</option>
           				 	<option value="빌려주세요">빌려주세요</option>
           				 	<option value="옮겨주세요">옮겨주세요</option>
           				 	<option value="기타">기타</option>
          				</select>
         			  </div>

					<div class="form-group">
						<label for="input7">Image</label>
						<input type="file" class="form-control-file" id="input7" name="files" accept="image/*" onchange=setThumbnail(event) multiple>
				    	</div>
				    	
				    						<!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>

					<button class="btn-register" type="submit">등록</button>
					<a href="${pageContext.request.contextPath }/help/list?location=" class="btn-cancel">취소</a>
				</form>

			</div>
		</div>
	</div>

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		$("#help").attr("class", "btn btn-outline ml-1 active");
	});
	
	function setThumbnail(event) {
		console.log("set");
		/* 현재 미리보기는 모두 지워야 한다. */
		$("#image_container").empty();

		var i = 0;

		for (const image of event.target.files) {
			console.log(image.name);
			var reader = new FileReader();
			reader.readAsDataURL(image);
			reader.onload = function (event) {

				const replyMediaObject = $(`
                	<span id = "\${event.timeStamp}" style="height: 200px; width: 200px; position:relative;">
						<input 
							type="radio" 
							id="thumbNailChoice"
						 	name="thumbNail" 
							value="\${image.name}"
							style = "position: absolute; z-index:100; opacity:1; top: 10px; left: 10px;"
						>
						 
						<button 
							type="button" 
							class="close" 
							style = "position: absolute; z-index:100; opacity:1; top: 10px; right: 10px;" 
							aria-label="Close"
							onclick = "deletePicture(\${event.timeStamp})"
						>
								<span aria-hidden="true">&times;</span>
						</button>
						<img src= "\${event.target.result}" class="img-thumbnail d-block" style="height: 100%; width: 100%" atl="aaaa"/>	
					</span>
                	
                `);

				$("#image_container").append(replyMediaObject);
			};

			i++;
		}
	}
</script>
</body>
</html>