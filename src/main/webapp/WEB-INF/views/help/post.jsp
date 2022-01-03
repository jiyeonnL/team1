<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="EUC-KR">
<title>${post.title}- ${post.nickname}</title>

<!-- 게시물 상세보기 페이지 -->

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script>
  $(document).ready(function() {
    /* contextPath */
    const appRoot = '${pageContext.request.contextPath}';

    /* 현재 게시물의 댓글 목록 가져오는 함수 */
    const listReply = function() {
      $("#replyListContainer").empty();
      $.ajax({
        url : appRoot + "/helpreply/board/${post.id}",
        success : function(list) {
          	for (let i = 0; i < list.length; i++) {
				const replyId = list[i].id;
				const replyMediaObject = $(`
						
						<table class="table table-bordered">
							<thead>
								<tr>
									<th id="userprofile">
											<img	id = "reply-profile" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iBqF1VCpU79WLGw_qgx0jFSuMlmLRTO25mJkJKqJ7KArrxjWB-eu2KQAFrOdW2fFKso&usqp=CAU"class="img-thumbnail rounded-circle mx-auto d-block " alt="UserProfile Picture"/>
									</th>
									<th>
										<div id ="reply-nickname" class="h6"></div>
									</th>
									<th id="replymenu">
											<div class="reply-menu"></div>
									</th>
									<th id="replytime">
										<span id = "reply-time" class="h5 ms-3 mt-0 pt-0"></span>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
									<div id = "reply-text\${replyId}" class="col h6">
							</div>
									</div>
						
						<div class="input-group" id="input-group\${list[i].id}" style="display:none;">
						<textarea id="replyTextarea\${list[i].id}" class="form-control reply-modi"></textarea>
							<div class="input-group-append">
								<button class="btn btn-outline-danger cancel-button"><i class="fas fa-ban"></i></button>
								<button class="btn btn-outline-primary" id="sendReply\${list[i].id}">
									<i class="far fa-comment-dots fa-lg"></i>
								</button>
							</div>
									</td>
								</tr>
							</tbody>
						</table>
					`);
				
				replyMediaObject.find("#sendReply" + list[i].id).click(function() {
					const reply = replyMediaObject.find("#replyTextarea"+list[i].id).val();
					const data =  {
							reply : reply		
					};
					$.ajax({
						url : appRoot + "/helpreply/" + list[i].id,
						type : "put",
						contentType : "application/json",
						data : JSON.stringify(data),
						complete : function() {
							listReply();
						}
					});
				});
				replyMediaObject.find(".reply-nickName").append(list[i].nickName);
				replyMediaObject.find(".reply-body").text(list[i].reply);
				replyMediaObject.find(".form-control").text(list[i].reply);
				replyMediaObject.find(".cancel-button").click(function() {
					console.log(replyId);
					replyMediaObject.find("#reply-text"+replyId).show();
					$("#input-group" + replyId).hide();
					replyMediaObject.find("#replyModify").show();
					replyMediaObject.find("#replyDelete").show();
				});
				
				
				if (list[i].own) {
					// 본인이 작성한 것만 수정버튼 추가
					const modifyButton = $("<button id='replyModify' class='btn btn-outline-primary'><i class='fas fa-edit'></i></button>")
					modifyButton.click(function() {
						$(this).parent().parent().parent().parent().parent().find('#reply-text' + replyId).hide();// this는 클릭이벤트가 발생한 버튼
						$(this).parent().parent().parent().parent().parent().find(`#input-group\${list[i].id}`).show();
						$(this).parent().find('#replyModify').hide();
						$(this).parent().find('#replyDelete').hide();
					});
					replyMediaObject.find(".reply-menu").append(modifyButton);
					
					// 삭제버튼도 추가
					const removeButton = $("<button id='replyDelete' class='btn btn-outline-danger'><i class='far fa-trash-alt'></i></button>");
					const blank = $(" ");
					removeButton.click(function(){
						if (confirm("Sure you want to delete?")){
							$.ajax({
								url : appRoot +"/helpreply/"+list[i].id,
								type : "delete",
								complete : function(){
									listReply();
									listReplyCount();
								}
							})
						}
					})
					replyMediaObject.find(".reply-menu").append(removeButton);
				}
				
				$("#replyListContainer").append(replyMediaObject);
				
				replyMediaObject.find("#reply-nickname").text(list[i].nickname);
				replyMediaObject.find("#reply-text"+replyId).text(list[i].reply);
				replyMediaObject.find("#reply-time").text(list[i].inserted);
			}	
        }
      });
    }
    listReply(); // 페이지 로딩 후 댓글 리스트 가져오는 함수 한 번 실행
	//댓글 전송
	$("#sendReply").click(function() {
		const reply =$("#replyTextarea").val();
		const memberId = '${sessionScope.loginUser.id}';
		const boardId = '${post.id}';
		const nickname = '${sessionScope.loginUser.nickname}';
		const data = {
				reply : reply,
				uid : memberId,
				boardId : boardId,
				nickname : nickname
		};
		
		$.ajax({
			url : appRoot+ "/helpreply/write",
			type : "post",
			data : data,
			success : function() {
				// textarea reset
				$("#replyTextarea").val(""); 
			},
			error : function(){
				alert("Logged out! Please login again!");
			},
			complete : function() {
				// list refresh
				listReply();
				listReplyCount();
			}
		})
	})//댓글전송
	//댓글 갯수
	const listReplyCount = function() {
		const boardId = '${board.id}';
		$.ajax({
			url : appRoot+ "/helpreply/count/"+${post.id},
			type : "get",
			success : function(count) {
				const replyCountObject = $(`<p class="replyCount" style="margin-bottom:0px;"><i class="fa fa-comments"></i> </p>`);
				$(".replyCount").parents().find(".replyCount").replaceWith(replyCountObject);
				$(".replyCount").parents().find(".replyCount").append(count);
			}
		})
	}
	listReplyCount();
});
</script>
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

#userprofile {
	height: 60px;
	width: 60px;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
		
	</script>

	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<div id="postBody">
				<div class="container-fluid my-1">
					<!-- 헤더 -->
					<div class="row md ms-4 px-2 align-middle">
						<div class="col-md-1 px-1 py-0 my-0">
							<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-iBqF1VCpU79WLGw_qgx0jFSuMlmLRTO25mJkJKqJ7KArrxjWB-eu2KQAFrOdW2fFKso&usqp=CAU" class="img-thumbnail rounded-circle mx-auto d-block " alt="..." />
						</div>
						<div class="col-md-3 bg-warning my-auto h2 align-middle">${post.nickname}</div>
						<div class="col-md-2 bg-info my-auto h5 offset-md-6 px-2">${post.inserted}<c:if test="${post.inserted ne post.updated}">(수정됨)</c:if></div>
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
							<div id="tag">${post.tag }</div>
						</div>
						<!-- 제목  -->
						<div class="col-md-10 h4 my-auto "><c:out value="${post.title}"/></div>
						<div class="row md mx-3 my-2">
							<div id="line"></div>
						</div>
						<!-- 내용  -->
						<div class="col-md-10 h4 my-auto "><c:out value="${post.content}"/></div>
						
					</div>
					</div>
					<!-- 이미지 파트 -->
					<div class="row md mx-3 mt-4 mb-2 justify-content-center">
						<div class="col-md-8 my-auto align-self-center">
						</div>
					</div>

					<!-- body랑 footer 구분 선 -->
					<div class="row md mx-3 my-2">
						<div class="col-md-12 ">
							<div id="line"></div>
						</div>
					</div>

					<!-- footer -->
					<div class="row md mx-4 ">
						<div class="col-md-2">
							<i class="fa fa-thumbs-up fa-fw fa-3x m-r-3"></i>
							${post.up}
						</div>

						<div class="col-md-2">
							<i class="fas fa-eye fa-fw fa-3x m-r-3"></i>
							${post.views }
						</div>
					</div>
					<div class="row md mx-4 d-flex justify-content-between">
						<div class="col-md-2 my-auto px-auto ">
							<c:if test="${sessionScope.loginUser.id eq post.memberId }">
								<a href="${pageContext.request.contextPath }/help/modify?id=${post.id }" class="btn btn-outline-secondary"> 수정/삭제 </a>
							</c:if>
						</div>
						<div class="col-md-2 my-auto px-auto">
							<a href="${pageContext.request.contextPath }/help/list?location=" class="btn btn-outline-secondary ">
								<i class="fas fa-list"> 뒤로</i>
							</a>
						</div>
					</div>

					<!-- <input type="text" class="form-control" id="input2" readonly=""> -->
					<table class="table table-hover table-bordered">
						<thead class="thead-dark">
							<tr>
								<th>Uploaded Images</th>
							</tr>
						</thead>
						<c:if test="${not empty fileNames }">
							<c:forEach items="${fileNames }" var="fileName">
								<tbody>
									<tr>
										<td>
											<img class="img-fluid" src="${staticUrl }help-board/${post.id }/${fileName }" alt="${fileName }">
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:if>
					</table>

					<!-- footer 와 댓글창 구분 선-->
					<div class="row md mx-3 my-2">
						<div class="col-md-12 ">
							<div id="line"></div>
						</div>
					</div>

					<!-- 댓글 창 -->
					<!-- 로그인 한 사용자에게만 보여야 한다. -->

					<div class="row md mx-4 my-3">
						<p style="margin-bottom: 0px;" class="replyCount">
							<i class="far fa-comment-dots fa-lg cnt"></i>
						</p>
						<hr>
						<c:if test="${not empty sessionScope.loginUser }">
							<div class="col-md-10 mx-0">
								<textarea id="replyTextarea" class="form-control px-0" placeholder="댓글을 남겨보세요!" id="exampleFormControlTextarea1"></textarea>
							</div>
							<div class="col-md-2 px-0">
								<button id="sendReply" class="btn btn-block btn-primary d-flex align-items-stretch">
									<i class="far fa-comment-dots fa-lg" style="color: white"></i>
								</button>
							</div>
						</c:if>

						<br>
						<hr>
					</div>
					<div id="replyListContainer"></div>
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
		</div>
	</div>
</body>
</html>