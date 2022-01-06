<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
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
#question-body-font{
background-color: #ffe164;
font-family: 'Jua', sans-serif;
font-size:25px;
}
table{
text-align: center;
}
#boardid{
text-align: left;
}
</style>
</head>
<body>


	<b:header></b:header>
	<div id="body">
		<div id="inner">
			<b:innerNav></b:innerNav>
			<b:cover></b:cover>		
			<!-- 태그 -->
	
	<div class="container">
    <div class="row">
      <div class="col">
        <h1>게시물 목록</h1>
        <!-- table.table>thead>tr>th*4^^tbody -->
        <table class="table">
          <thead>
            <tr>
              <th>
                <i class="fab fa-slack-hash"></i>
              </th>
              <th>tag</th>
              <th>제목</th>
              <th>
                <i class="fas fa-user"></i>
              </th>
              <th>작성일</th>
            
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${list }" var="board">
              <tr>
                <td>${board.id }</td>
                <td>${board.tag }</td>
                <td id="boardid">
                  <a href="get/${board.id }">
                	<c:if test="${not empty board.fileList }">
                    <c:out value="${board.title }"/><i class="bi bi-image"></i>
                	</c:if>
                	<c:if test="${empty board.fileList }">
                    <c:out value="${board.title }"/>
                	</c:if>
                  </a>
                </td>
                <td>
               	  <a href="../user/profile/${board.nickname }">
                	<c:out value="${board.nickname }" />
                  </a>
                </td>
                <td>${board.inserted }</td>
                
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
  <a href="${pageContext.request.contextPath }/question/register" id="question-body-font" class="btn">글쓰기</a>
		</div>
	</div>
	
	  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <c:if test="${pageInfo.hasPrevButton }">
        <c:url value="/question/list" var="pageLink">
          <c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
      </c:if>

      <c:forEach begin="${pageInfo.leftPageNumber}" end="${pageInfo.rightPageNumber }" var="pageNumber">
        <c:url value="/question/list" var="pageLink">
          <c:param name="page" value="${pageNumber }"></c:param>
          <c:param name="location" value="${location }"></c:param>
        </c:url>
        <li class="page-item ${pageInfo.currentPage == pageNumber ? 'active' : '' }">
          <a class="page-link" href="${pageLink }">${pageNumber }</a>
        </li>
      </c:forEach>

      <c:if test="${pageInfo.hasNextButton }">
        <c:url value="/question/list" var="pageLink">
          <c:param name="page" value="${pageInfo.rightPageNumber + 1 }"></c:param>
        </c:url>
        <li class="page-item">
          <a class="page-link" href="${pageLink }" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </c:if>
    </ul>
  </nav>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			$("#question").attr("class", "btn btn-outline ml-1 active");
		});
</script>
</body>
</html>