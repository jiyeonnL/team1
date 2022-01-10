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

.form-group{
font-family: 'IBM Plex Sans KR', sans-serif;
}

#input4{
height:150px;
}

#input6{
width: 20%;
}

</style>

<title>게시물 작성</title>
</head>
<body>
<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<div class="col">
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
          			
          			<c:if test="${sessionScope.loginUser.adminQuali eq 1 }">
						<br>
						<div>
							<input type="checkbox" name="notice" id="input8" value="1">
							Notice
							<hr>
						</div>
					</c:if>
					<div style="visibility: hidden">
						<input type="hidden" name="notice" id="input9" value="0">
					</div>
          			
         			 <div class="form-group">
           				 <label for="input4">내용</label>
          				 <textarea class="form-control" id="input4" name="content"></textarea>
          			</div>
          
  		 		    <div class="form-group">
           				 <label for="input6">태그</label>
           				 <select class="form-control" id="input5" name="tag">
           				 	<optgroup label="태그를 선택해주세요.">
          				  	<option value="질문" selected>질문</option>
          				  	<option value="건의사항">건의사항</option>
           				 	<option value="신고합니다!">신고합니다!</option>
           				 	<c:if test="${sessionScope.loginUser.adminQuali eq 1 }">
           				 		<option value="공지사항">공지사항</option>
           				 	</c:if>
           				 	</optgroup>
          				</select>
         			  </div>
					<div class="form-group">
						<label for="input7">Image</label> 						
					</div>
					<div class="form-group">
						<label for="input7">Image</label>
						<input type="file" class="form-control-file" id="input7" name="files" accept="image/*" onchange=setThumbnail(event) multiple>
				    	</div>
				    
				    <!-- 구분 선 -->
				    <div id="d-line"></div>
				    	
				    <!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>

					<button class="btn btn-outline-primary" type="submit">등록</button>
					<a href="${pageContext.request.contextPath }/question/list?page=1" class="btn btn-outline-danger">취소</a>
				</form>

			</div>
		</div>
	</div>

	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="	crossorigin="anonymous" referrerpolicy="no-referrer"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		$("#question").attr("class", "btn btn-outline ml-1 active");
	});
	
	var queue = [];

	function delRef(index) {

		$("#image_container").empty();

		var dt = new DataTransfer();
		var input = document.getElementById('input7');
		var {files} = input;	

		//큐 에서도 삭제
		queue.splice(index, 1);
		for (var i = 0; i < files.length; i++) {
			var file = files[i]
			if (index !== i) dt.items.add(file);
			input.files = dt.files
		}

		render(input.files);

	}
	
	function render(files) {

		var i = 0;
		for (const image of files) {
			
			const url = window.URL.createObjectURL(image); // blob:http://localhost:1234/28ff8746-94eb-4dbe-9d6c-2443b581dd30
			
				const replyMediaObject = $(`
            	<span id = "\${i}" style="height: 200px; width: 200px; position:relative;">
			
				<div 
					class = "closeButton"
					style = "position: absolute; z-index:101; top: 5px; right: 5px; width: 30px; height: 30px; cursor:pointer;" 
					onclick = "delRef(\${i})"
				>
					<i class="fas fa-times fa-2x"></i>
				</div>
					<img src= "\${url}" class="img-thumbnail d-block" style="height: 100%; width: 100%" atl="aaaa"/>	
				</span>
            	
            `);

				$("#image_container").append(replyMediaObject);

				i++;
			};
	}
	
	function setThumbnail(event) {

		//파일명 변경하기
			var newFiles = [];
			//파일명 변경하기
			for (file of event.target.files) {
				//var fileType = file.name.slice(file.name.indexOf("."));
				//console.log(fileType);

				var new_file = new File([file], Date.now() + file.name);
				console.log("new file", new_file);
				newFiles.push(new_file);
				// Object.defineProperty(file, 'name', {
				// 	writable: true,
				// 	value: Date.now() + file.name
				// });
				sleep(10);
			}

			queue.push(...newFiles);


		var dt = new DataTransfer();
		var input = document.getElementById('input7');

		for (var i = 0; i < queue.length; i++) {
			var file = queue[i]
			dt.items.add(file)
			input.files = dt.files

		}

		/* 현재 미리보기는 모두 지워야 한다. */
		$("#image_container").empty();
		$("#d-line").empty();

		const line = $(`<div id="line"></div>`)

		$("#d-line").append(line);

		render(input.files);

	}
	
	//딜레이 만드는 함수
	function sleep(ms) {
		const wakeUpTime = Date.now() + ms;
		while (Date.now() < wakeUpTime) {}
	}
	

	
</script>
</body>
</html>