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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>

<style>
.form-group{
font-family: 'IBM Plex Sans KR', sans-serif;
}
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
#input2{
height:150px;
}
#input3{
width: 20%;
}
</style>

<title>게시물 수정</title>
</head>
<body>
	<b:header></b:header>
	<div class="container" id="body">
		<div class="row" id="inner">
			<div class="col">
				<b:innerNav></b:innerNav>
				<h1>게시물 수정</h1>

				<form id="modifyForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${board.id }">

					<div class="form-group">
						<label for="input1">제목</label>
						<input type="text" class="form-control" value="${board.title }" id="input1" name="title">
					</div>
					
					<c:choose>
							<c:when test="${board.notice eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input8" value="1" checked="checked">Notice
							</c:when>
							<c:when test="${sessionScope.loginUser.adminQuali eq 1 }">
								<br>
								<input type="checkbox" name="notice" id="input5" value="1">
								Notice <hr>
							</c:when>
						</c:choose>
						<div style="visibility: hidden">
							<input type="hidden" name="notice" id="input6" value="0">
						</div>

					<div class="form-group">
						<label for="input2">내용</label>
						<textarea class="form-control" id="input2" name="content">${board.content }</textarea>
					</div>

					<div class="form-group">
						<label for="input3">태그</label>
						<select class="form-control" id="input3" name="tag">
							<option value="질문" <c:if test="${board.tag eq '질문'}">selected</c:if>>질문</option>
							<option value="건의사항" <c:if test="${board.tag  eq '건의사항'}">selected</c:if>>건의사항</option>
							<option value="신고합니다!" <c:if test="${board.tag  eq '신고합니다!'}">selected</c:if>>신고합니다!</option>
							<c:if test="${sessionScope.loginUser.adminQuali eq 1 }">
           				 		<option value="공지사항" <c:if test="${board.tag  eq '공지사항'}">selected</c:if>>공지사항</option>
           				 	</c:if>

						</select>
					</div>

					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>삭제할 파일 선택</th>
								<th>이미지</th>
							</tr>
						</thead>
						<c:if test="${not empty board.fileList }">
							<c:forEach items="${ board.fileList }" var="file">
								<tbody>
									<tr>
										<td>
											<div class="col d-flex justify-content-center align-items-center">
												<input class="check" type="checkbox" name="removeFile" value="${file.url}">
											</div>
										</td>
										<td>
											<div class="col">
												<img class="img-fluid" src="${file.url}" alt="${file.url }">
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>

					<div class="form-group">
						<label for="input4">Image</label>
						<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" onchange=setThumbnail(event) multiple>
					</div>
					
					<!-- 구분 선 -->
				    <div id="d-line"></div>
				    	
				    <!-- 이미지들 미리보기 컨테이너 -->
					<div id="image_container" class="d-flex"></div>
				</form>

				<button id="modifySubmitButton" class="btn btn-outline-primary" type="submit">수정</button>
				<button id="" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirmModal1"><i class="fas fa-trash"> 삭제</i></button>
				<a href="${pageContext.request.contextPath }/question/list/${board.id }" class="btn btn-outline-secondary">취소</a>
			</div>
		</div>
	</div>

	<!-- Delete Confirm Modal -->
	<div class="modal fade" id="confirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">게시물을 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button id="removeSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-trash"> 삭제</i>
					</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Result Modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Process Result</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	
	var queue = [];

	function delRef(index) {

		$("#image_container").empty();

		var dt = new DataTransfer();
		var input = document.getElementById('input4');
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
		var input = document.getElementById('input4');

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
	
		$(document).ready(function() {
			$("#removeSubmitButton").click(function(e) {
				e.preventDefault(); // 기본동작을 진행하지 않도록 함
				$("#modifyForm").attr("action", "remove").submit();
			});
			$("#modifySubmitButton").click(function(e) {
				e.preventDefault();
				$("#modifyForm").attr("action", "modify").submit();
			});
			if (history.state == null) {
				$("#modal1").modal('show');
				history.replaceState({}, null);
			}
			$(document).ready(function(){
				$("#question").attr("class", "btn btn-outline ml-1 active");
			});
		});
	</script>

</body>
</html>