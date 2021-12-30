<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#icon {
	float: right;
	margin-top: -38px;
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 38px;
	border-bottom-right-radius: 4px;
	border-top-right-radius: 4px;
	border: 1px solid black;
	position: relative;
	z-index: 999;
}
</style>

<nav class="navbar navbar-expand-sm navbar-dark bg-primary sticky-top"
	aria-label="Third navbar example"
>
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<li class="nav-item">
					<select class="form-select" id="location">
						<option value="" <c:if test="${location eq '' || empty location}">selected</c:if>>Region</option>
						<option <c:if test="${location eq '강남'}">selected</c:if>>강남</option>
						<option <c:if test="${location eq '마포'}">selected</c:if>>마포</option>
						<option <c:if test="${location eq '서초'}">selected</c:if>>서초</option>
					</select>
				</li>

				<!-- 나중엘 radio 버튼으로 교체 -->
				<li class="nav-item">
					<button type="button" id="all" class="btn btn-info ms-1">전체보기</button>
				</li>
				<li class="nav-item">
					<button type="button" id="news" class="btn btn-info ms-1">동네소식</button>
				</li>
				<li class="nav-item">
					<button type="button" id="question" class="btn btn-info ms-1">동네질문</button>
				</li>
				<li class="nav-item">
					<button type="button" id="life" class="btn btn-info ms-1">일상생활</button>
				</li>
				<li class="nav-item">
					<button type="button" id="help" class="btn btn-info ms-1">해주세요</button>
				</li>
			</ul>
			<form method="get" onsubmit="return false;">
				<input class="form-control" type="text" placeholder="Search" id="keyword"
					aria-label="Search"
				/>
				<label id=icon> <i
					class="fa fa-search" aria-hidden="true"
				></i>
				</label>
			</form>
		</div>
	</div>
</nav>


<script>
	$(document)
			.ready(
					function() {
						
						//현재의 tag 값과 region 값을 가져온다.
						var loc = "${location}";
						var tag    = "${tag}";
						//console.log(region);
						
						//현재 model의 값으로 select 박스의 값 세팅 (나중에 )
						//$("#region").val(region).attr("selected", "selected");
						
						//검색 아이콘 누르면 call되는 함수 (현재 입력창에 있는 값을 받아서 넘긴다. 현재 select 상태와 버튼 눌려진 상태를 포함한다.) 
						$("#icon")
						.click(function() {
							var query = $("#keyword").val();
							
							//빈 문자열이면 return 시켜 실행되지 않게 한다.
							if(query== "") {
								return 
							}
							
							location.href = "/controller1/"+tag+"/list?location="
								+ loc +"&query="+query;
						})

						//model attribute에서 현재 어느 태그인지 검사하고 select의 현재 상태 변경시기키 (model 값을 스크립트 내부에서 사용해야 한다.)
						$("#all")
						.click(
								function() {
									var loc = $(
											"#location option:selected")
											.val();

									location.href = "/controller1/all/list?location="
											+ loc;

								});
						
						//탭에 있는 버튼들 누르면 해당 링크로 이동한다. 현재 select 상태를 함께 포함해 컨트롤러에 get 요청 날린다.
						$("#news")
								.click(
										function() {
											var loc = $(
													"#location option:selected")
													.val();

											location.href = "/controller1/news/list?location="
													+ loc;

										});

						$("#question")
								.click(
										function() {
											var loc = $(
													"#location option:selected")
													.val();
											location.href = "/controller1/question/list?location="
													+ loc;

										});

						$("#life")
								.click(
										function() {
											var loc = $(
													"#location option:selected")
													.val();
											location.href = "/controller1/life/list?location="
													+ loc;

										});

						$("#help")
								.click(
										function() {
											var loc = $(
													"#location option:selected")
													.val();
											location.href = "/controller1/help/list?location="
													+ loc;
										});

					})
</script>