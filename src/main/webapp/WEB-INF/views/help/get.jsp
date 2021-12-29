<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resource/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

<title>해주세요 게시물</title>
</head>
<body>
  <b:navBar></b:navBar>

  <div class="container">
    <div class="row">
      <div class="col">
        <h1>게시물 조회</h1>
        <div class="board-view">
          <!-- .form-group*3>label[for=input$]+input.form-control#input$[readonly] -->
          
          <div class="form-group">
            <label for="input4">작성자</label>
            <input type="text" class="form-control" id="input4" readonly value="${nickname }">
          </div>
          
          <div class="form-group">
            <label for="input5">지역</label>
            <input type="text" class="form-control" id="input5" readonly value="${board.location }">
          </div>
          <div class="form-group">
            <label for="input1">제목</label>
            <input type="text" class="form-control" id="input1" readonly value="${board.title }">
          </div>
          <div class="form-group">
            <label for="input2">내용</label>
            <textarea class="form-control" id="input2" readonly>${board.content }</textarea>
          </div>
          
          <div class="form-group">
            <label for="input3">태그 </label>
            <input type="text" class="form-control" id="input3" readonly value="${board.tag }">
          </div>
          
          <div class="form-group">
            <label for="input6">좋아요 </label>
            <input type="text" class="form-control" id="input6" value="${board.up }">
          </div>
          
          <div class="form-group">
            <label for="input7">조회수 </label>
            <input type="text" class="form-control" id="input7" readonly value="${board.views }">
          </div>
           
          <a href="modify?id=${board.id }" class="btn btn-outline-secondary">
            수정/삭제
          </a>
        </div>
      </div>
    </div>
    <div class="container">
			<div class="row">
				<div class="col">
					<div id="replyListContainer"></div>
				</div>
			</div>
		</div>
  </div>


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>