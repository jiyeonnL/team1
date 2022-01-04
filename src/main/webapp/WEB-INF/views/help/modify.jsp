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
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" referrerpolicy="no-referrer"></script>
<title>게시물 수정</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>게시물 수정</h1>

	<form id="modifyForm" method="post" enctype="multipart/form-data">
		  <input type="hidden" name="id" value="${board.id }">
        
          <div class="form-group">
            <label for="input1">제목</label>
            <input type="text" class="form-control" value="${board.title }" id="input1" name="title">
          </div>
          
          <div class="form-group">
            <label for="input2">내용</label>
            <textarea class="form-control" id="input2" name="content">${board.content }</textarea>
          </div>
          
          <div class="form-group">
            <label for="input3">태그</label>
            <select class="form-control" id="input3" name="tag">
            	<option value="사다주세요"  <c:if test="${board.tag eq '사다주세요'}">selected</c:if>>사다주세요</option>
            	<option value="맡아주세요" <c:if test="${board.tag  eq '맡아주세요'}">selected</c:if>>맡아주세요</option>
            	<option value="빌려주세요" <c:if test="${board.tag  eq '빌려주세요'}">selected</c:if>>빌려주세요</option>
            	<option value="옮겨주세요" <c:if test="${board.tag  eq '옮겨주세요'}">selected</c:if>>옮겨주세요</option>
            	<option value="기타" <c:if test="${board.tag  eq '기타'}">selected</c:if>>기타</option>
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
												<input class="check" type="checkbox" name="removeFile" value="${file.fileName }">
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
						<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" multiple>
					</div>
				</form>

				<button id="modifySubmitButton" class="btn btn-outline-primary" type="submit">수정</button>
				<button id="" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirmModal1">
					<i class="fas fa-trash"> 삭제</i>
				</button>
				<a href="${pageContext.request.contextPath }/help/list/${board.id }" class="btn btn-outline-secondary">취소</a>
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
		});
	</script>

</body>
</html>