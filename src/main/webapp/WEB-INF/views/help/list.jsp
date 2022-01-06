<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>해주세요</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
#help-body-font {
	background-color: #ffe164;
	font-family: 'Jua', sans-serif;
	font-size: 25px;
	margin-top: 10px;
}

#list-font {
	font-family: 'IBM Plex Sans KR', sans-serif;
	background-color: #eef2f6;
}

.list-background-color {
	background-color: #eef2f6;
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

#postBody {
	width: 100%;
	border-radius: 10px;
	margin-top: 5px;
}

#tag {
	font-size: 1.0rem;
	text-align: center;
	justify-content: center;
	border-radius: 5px;
	width: 80%;
	border: solid;
	border-color: #f0615c;
	background-color: white;
}

#image {
	width: 80%;
	height: 200px;
	object-fit: cover;
}

/* 텍스트가 한줄 넘어가면 ...으로 끊는다.*/
#contentBox {
	display: inline-block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	width: 95%;
}

a {
	width: 100%;
	word-break: break-all;
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-decoration: none;
	color: inherit;
}

a#title {
	/* border-bottom: solid; */
	font-weight: bold;
}

#contentBox {
	border-top-color: #808080;
}

a:hover {
	text-decoration: none;
	color: inherit;
}

.제목아래보더 {
	border-bottom: solid;
	border-bottom-width: 3px;
}

#게시글-작성시간 {
	font-size: medium;
}

.댓글위의바 {
	border-top: solid;
	border-top-color: #cccccc;
}

.댓글창부분 {
	margin-top: 8px;
	margin-bottom: 8px;
}
</style>
</head>
<body>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<b:tagNavHelp></b:tagNavHelp>
			<b:cover></b:cover>
			<a href="${pageContext.request.contextPath }/help/register" id="help-body-font" class="btn">글쓰기</a>
			<!-- 검색결과 리스트 -->
			<!-- for 문 돌면서 list에 있는 요소(게시물)들 출력 -->
			<c:forEach items="${list}" var="board" varStatus="vs">
				<c:if test="${location eq board.location || location eq '' || empty location }">
					<div class="container-fluid my-4 border border-3 border-secondary list-background-color" id="list-font-${vs.index }" style="display : ${vs.index < 5 ? '' : 'none' }">
						<div class="row md mx-3 my-2 제목아래보더">
							<div class="col-md-2 my-auto px-auto">
								<div id="tag">${board.tag }</div>
							</div>
							<div class="col-md-5 my-auto h5">
								<div>
									<a href="/controller1/help/list/${board.id}" id="title">
										<c:out value="${board.title}" />
									</a>
								</div>
							</div>
							<div class="col-md-3 offset-md-2 my-auto h5">
								<div>${board.nickname }</div>
								<div id="게시글-작성시간">${board.inserted}</div>
							</div>
						</div>

						<div class="row md px-0 mx-0 my-2">
							<div class="col-md-12 ">
								<div id="line"></div>
							</div>
						</div>

						<!-- 여기가 컨텐츠 표현 부분입니다. a 태그로 내용을 표시합니다. -->
						<div id="contentBox" class="row md px-0 mx-3 h5">
							<a href="/controller1/help/list/${board.id}">
								<c:out value="${board.content}" />
							</a>
						</div>

						<!-- preview에 올릴 한장의 이미지, 썸네일 한장만 표시한다. -->
						<div class="row md px-0 mx-0 justify-content-center">
							<div class="col-md-8 my-auto mx-0 d-flex justify-content-center">
								<a id="thumbnail" href="/controller1/help/list/${board.id}">

									<!-- postVO가 가진 file List 중 썸네일로 지정된 이미지만 띄운다. -->
									<c:if test="${not empty board.fileList }">
										<c:forEach items="${board.fileList }" var="file" varStatus="vs">
											<c:if test="${file.isThumbnail eq 1 }">
												<img src="${file.url}" class="d-block w-100" alt="${file.url}">

											</c:if>
										</c:forEach>
									</c:if>

								</a>
							</div>
						</div>

						<div class="row my-2">
							<div class="col-md-12 게시물-아랫선" style="height: 2px; width: 100%">
								<div id="line"></div>
							</div>
						</div>


						<div class="row md mx-3 댓글위의바">
							<div class="col-md-2 댓글창부분">
								<c:if test="${board.upposession !=null}">
									<i class="fa fa-thumbs-up fa-fw fa-2x m-r-3"></i>
								</c:if>
								<c:if test="${empty board.upposession }">
									<i class="far fa-thumbs-up fa-fw fa-2x m-r-3"></i>
								</c:if>
								${board.up}
							</div>
							<div class="col-md-2 댓글창부분">
								<i class="fa fa-comments fa-fw fa-2x m-r-3"></i>
								${board.replyCount }
							</div>
							<div class="col-md-2 댓글창부분">
								<i class="fas fa-eye fa-fw fa-2x m-r-3"></i>
								${board.views }
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<b:copyright></b:copyright>
		</div>
	</div>
	<!-- 태그 -->




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

	<script>
		$(document).ready(
				function() {
					$("#help").attr("class", "btn btn-outline ml-1 active");
					var count = 5;
					$(window).scroll(
							function() {
								if ($(window).scrollTop() == $(document)
										.height()
										- $(window).height()) {
									for (i = 0; i < 5; i++) {
										$("#inner").find("#list-font-" + count)
												.removeAttr("style", "none");
										count++;
									}
									;
								}
							});
					/* 		var count = 0;
					 //스크롤 바닥 감지
					 window.onscroll = function(e) {
					 //추가되는 임시 콘텐츠
					 //window height + window scrollY 값이 document height보다 클 경우,
					 if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
					 //실행할 로직 (콘텐츠 추가)
					 count++;
					 var addContent = '<div class="block"><p>'+ count +'번째로 추가된 콘텐츠</p></div>';
					 //article에 추가되는 콘텐츠를 append
					 $('article').append(addContent);
					 }
					 }; */
				});
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>