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
					<button type="button" id="hlepAll"
						class="btn btn-outline-dark ml-1">전체보기</button>
				</li>

				<li id="nav-all" class="nav-item">
					<button type="button" id="buy" class="btn btn-outline-dark ml-1">사다주세요</button>
				</li>
				<li id="nav-news" class="nav-item">
					<button type="button" id="care" class="btn btn-outline-dark ml-1">맡아주세요</button>
				</li>
				<li id="nav-question" class="nav-item">
					<button type="button" id="move" class="btn btn-outline-dark ml-1">옮겨주세요</button>
				</li>
				<li id="nav-life" class="nav-item">
					<button type="button" id="other" class="btn btn-outline-dark ml-1">기타</button>
				</li>
			</ul>



		</div>
	</div>
</nav>

<script>
	$("#hlepAll").click(function() {

		location.href = "/controller1/help/list?" + getLocation();

	})

	$("#buy").click(function() {

		location.href = "/controller1/help/list?tag=사다주세요" + getLocation();

	})

	$("#buy").click(function() {

		location.href = "/controller1/help/list?tag=사다주세요" + getLocation();

	})

	$("#care").click(function() {

		location.href = "/controller1/help/list?tag=맡아주세요" + getLocation();

	})

	$("#move").click(function() {

		location.href = "/controller1/help/list?tag=옮겨주세요" + getLocation();

	})

	$("#other").click(function() {

		location.href = "/controller1/help/list?tag=기타" + getLocation();

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
		var location = link.match(regex);
		console.log(location);
		if(location == null && location[0] == "") {
			return ""
		} else {
			return "&"+location[0];
		}
		 */
	}
</script>