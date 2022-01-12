<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>신고관리 게시판</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
.title {
	padding-top: 5px;
	padding-bottom: 10px;
	margin-bottom: 0px;
	border-bottom: solid;
	border-bottom-color: lightgray;
	letter-spacing: 2px;
}
</style>
</head>
<body>
	<b:header></b:header>
	<b:innerNav></b:innerNav>

	<h1 class="title">신고관리 게시판</h1>
	
	<div id="reportList"></div>

 	<table class="table">
		<thead>
			<tr>
				<th>id</th>
				<th>helpid</th>
				<th>게시판</th>
				<th>신고 게시글</th>
				<th>작성자</th>
				<th>신고 사유</th>
				<th>신고 접수시간</th>
				<th>신고내역 삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="board">
					<tr>
						<td>${board.id }</td>
						<td>${board.helpId }</td>
						<td>${board.boardName }</td>
						<td>
						<a href="${board.boardUrl }">${board.title }</a>
						</td>
						<td>${board.nickname }</td>
						<td>${board.reason }</td>
						<td>${board.inserted }</td>
						<td>
						<button id="removeButton${board.id }" data-href="${pageContext.request.contextPath }/report/delete/${board.id }" data-toggle="modal" data-target="#confirmModal1" class="btn btn-danger removeButton" ><i class="fas fa-trash"> 삭제</i></button>
						</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- Delete Confirm Modal -->
	<div class="modal fade" id="confirmModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="color:black;">삭제 확인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">삭제하시겠습니까?</div>
				<div class="modal-footer">
					<a id="deleteLink" href=""><button id="removeSubmitButton" type="submit" class="btn btn-danger">
						<i class="fas fa-trash"> 삭제</i>
					</button></a>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
			$(document).ready(function() {
				$(".removeButton").click(function(e) {
					var link = $(".removeButton" ).attr( 'data-href' );
					console.log(link);
					$("#deleteLink").attr("href", link)

				});
		});
	</script>
</body>
</html>