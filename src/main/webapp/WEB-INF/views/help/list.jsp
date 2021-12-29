<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>해주세요</title>
</head>
<body>
  <b:navBar></b:navBar>
  
<div class="container">
	<div class="row">
		<div class="col">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Nickname</th>
						<th>Location</th>
						<th>Up</th>
						<th>Views</th>
						<th>Tag</th>
						<th>Title</th>
						<th>Inserted</th>
						<th>Updated</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr>
							<td>${board.id }</td>
							<td>${board.nickname }</td>
							<td>${board.location }</td>
							<td>${board.up}</td>
							<td>${board.views}</td>
							<td>${board.tag}</td>
							<td>
							<a href="get?id=${board.id }">
							${board.title}
							</a>
							</td>
							<td>${board.inserted}</td>
							<td>${board.updated}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<c:if test="${not empty result }">
<div class="modal" tabindex="-1" id="modal1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">처리 결과</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>${result }</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
</c:if>

   <script>
      $(document).ready(function() {
        
        if (history.state == null) {
          $("#modal1").modal('show');
          history.replaceState({}, null);
        }
      });
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>