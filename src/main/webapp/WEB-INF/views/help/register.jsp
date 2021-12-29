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

<title>게시물 작성</title>
</head>
<body>
  <b:navBar></b:navBar>

  <div class="container">
    <div class="row">
      <div class="col">
        <h1>게시물 작성</h1>
        
        <form method="post">
        
          <div class="form-group">
            <label for="input4">memberId</label>
            <input type="text" class="form-control" id="input4" name="memberId">
          </div>
        
         <!--  <div class="form-group">
            <label for="input5">닉네임</label>
            <input type="text" class="form-control" id="input5" name="nickname">
          </div> -->
        
          <div class="form-group">
            <label for="input6">지역</label>
            <input type="text" class="form-control" id="input6" name="location">
          </div>
        
        
          <div class="form-group">
            <label for="input1">제목</label>
            <input type="text" class="form-control" id="input1" name="title">
          </div>
          
          <div class="form-group">
            <label for="input2">내용</label>
            <textarea class="form-control" id="input2" name="content"></textarea>
          </div>
          
          <div class="form-group">
            <label for="input3">태그</label>
            <input type="text" class="form-control" id="input3" name="tag">
          </div>

          <button class="btn btn-outline-primary" type="submit">등록</button>
        </form>
        
      </div>
    </div>
  </div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>