<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand-sm navbar-dark sticky-top"
	aria-label="Third navbar example" id="nav-color">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<!-- 나중엘 radio 버튼으로 교체 -->
				<li id="nav-all" class="nav-item">
					<button type="button" id="question_All"
						class="btn btn-outline-dark ml-1">전체보기</button>
				</li>

				<li id="nav-all" class="nav-item">
					<button type="button" id="question_question"
						class="btn btn-outline-dark ml-1">질문</button>
				</li>
				<li id="nav-news" class="nav-item">
					<button type="button" id="question_declaration"
						class="btn btn-outline-dark ml-1">신고합니다!</button>
				</li>
				<li id="nav-question" class="nav-item">
					<button type="button" id="question_tendinous"
						class="btn btn-outline-dark ml-1">건의사항</button>
				</li>

			</ul>
		</div>
	</div>
</nav>

<script>
	$("#question_All").click(function() {

		location.href = "/controller1/question/list?page=1" + getLocation();

	})

	$("#question_question").click(
			function() {
				window.location.href = "/controller1/question/list?page=1&tag=질문"
						+ getLocation();

			})

	$("#question_declaration").click(
			function() {

				window.location.href = "/controller1/question/list?page=1&tag=신고합니다!"
						+ getLocation();

			})

	$("#question_tendinous").click(
			function() {

				window.location.href = "/controller1/question/list?page=1&tag=건의사항"
						+ getLocation();

			})

	function getLocation() {

		var location = "${location}";

		if (location == "") {
			return "";
		} else {
			return "&location=" + location;
		}

		//현재의 위치
		/*
		const regex = /(location=.*)(?=&|$)/;
		const regex = /(location=.*)(?=&|\$)/;
		var location = link.match(regex);
		console.log(location);
		if (location == null) {
			return ""
		} else {
			console.log(location[0]);
			return "&location=" + location[0];
		}
		 */

	}
</script>