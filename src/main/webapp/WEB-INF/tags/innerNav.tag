<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#location, #all, #news, #question, #life, #help, #keyword, #icon {
	border: 3px solid;
	border-color: #2f6091;
	border-radius: 4px;
	font-size: large;
}

#nav-color {
	background-color: #ffe164;
	border-radius: 6px;
	margin-top: 20px;
	margin-bottom: 20px;
	border: 3px solid;
	border-color: #2f6091;
	z-index: 980;
	font-family: 'Jua', sans-serif;
}

#icon {
	float: right;
	margin-top: -41px;
	background-color: #f5f5f5;
	padding: 10px 12px;
	height: 41px;
	position: relative;
	z-index: 990;
	border-color: #2f6091;
	border-radius: 4px;
	margin-bottom: 0px;
	diplay: felx;
	align-item: center;
}

a.goTop {
	position: fixed;
	right: 50px;
	bottom: 30px;
	color:#264d73;
	z-index:999;
	width:8.5%;
}

.active {
	background-color: #264d73;
	color: white;
}
</style>

<nav class="navbar navbar-expand-sm navbar-dark sticky-top"
	aria-label="Third navbar example" id="nav-color">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<li class="nav-item">
					<form method="get">
						<select class="custom-select" id="location" style="height: 100%"
							name="location" onchange="locationChange()">
							<option value=""
								<c:if test="${location eq '' || empty location}">selected</c:if>>Region</option>
							<option <c:if test="${location eq '강남구'}">selected</c:if>>강남구</option>
							<option <c:if test="${location eq '마포구'}">selected</c:if>>마포구</option>
							<option <c:if test="${location eq '서초구'}">selected</c:if>>서초구</option>
						</select>
					</form>
				</li>

				<!-- 나중엘 radio 버튼으로 교체 -->
				<li id="nav-all" class="nav-item">
					<button type="button" id="all" class="btn btn-outline-dark ml-1">전체보기</button>
				</li>
				<li id="nav-news" class="nav-item">
					<button type="button" id="news" class="btn btn-outline-dark ml-1">동네소식</button>
				</li>
				<li id="nav-question" class="nav-item">
					<button type="button" id="question"
						class="btn btn-outline-dark ml-1">동네질문</button>
				</li>
				<li id="nav-life" class="nav-item">
					<button type="button" id="life" class="btn btn-outline-dark ml-1">일상생활</button>
				</li>
				<li id="nav-help" class="nav-item">
					<button type="button" id="help" class="btn btn-outline-dark ml-1">해주세요</button>
				</li>
			</ul>

			<form class="ml-auto" method="get" onsubmit="return false;">
				<input class="form-control" type="text" placeholder="검색어를 입력하세요"
					id="keyword" aria-label="Search" /> <label id=icon> <i
					class="fa fa-search" aria-hidden="true"></i>
				</label>
			</form>
		</div>
	</div>
</nav>


<script>
function locationChange() {
	
	var location = $("#location option:selected").val();
	var link = window.location.href;
	const regex = /(location=.*)(?=&|$)/i;
	//빈 문자열이면 현재의 위치를 없애버린다.
	if(location == "") {
		const regex = /(location=.*)(?=&|$)/i;
		window.location.href = link.replace(regex , "");
		return
	} else {
	//아닐 경우 현재의 위치를 대체하거나 추가
		if(link.includes('?')) {
				
			if(link.includes("location")) {
				
				window.location.href = link.replace(regex , "location="+location);
			} else {
				window.location.href = link + "&location=" + location;
			}
			
			
		} else {
			
			window.location.href = link + "?location=" + location;
		}
		

		
	}

}

	$(document).ready(function() {
		//현재의 tag 값과 region 값을 가져온다.
		var loc = "${location}";
		var tag    = "${tag}";
		//console.log(region);
		
		//현재 model의 값으로 select 박스의 값 세팅 (나중에 )
		//$("#region").val(region).attr("selected", "selected");
		
		//검색 아이콘 누르면 call되는 함수 (현재 입력창에 있는 값을 받아서 넘긴다. 현재 select 상태와 버튼 눌려진 상태를 포함한다.) 
		$("#icon")	.click(function() {
			var query = $("#keyword").val();
			
			//빈 문자열이면 return 시켜 실행되지 않게 한다.
			if(query== "") {
				return 
			}
			
			//&이 포함되면 안된다...
			if(query.includes('&')) {
				alert('&은 검색 문자열에 포함할 수 없습니다!')
				return 
			}
			
			var link = window.location.href;
			
			
			if(link.includes('query')) {
				const regex = /(query=.*)(?=&|$)/i;
				console.log(link.replace(regex, "query=" + query))
				location.href = link.replace(regex , "query=" + query)
				
			} else {
				
				if(link.includes('?')) {
					location.href = link + "&query="+query;

				} else {
					location.href = link + "?query="+query;
				}
				
			}
		})
		
		

		//model attribute에서 현재 어느 태그인지 검사하고 select의 현재 상태 변경시기키 (model 값을 스크립트 내부에서 사용해야 한다.)
		$("#all").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/all/list";
		});
		
		//탭에 있는 버튼들 누르면 해당 링크로 이동한다. 현재 select 상태를 함께 포함해 컨트롤러에 get 요청 날린다.
		$("#news").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/news/list";
		});

		$("#question").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/question/list";
		});

		$("#life").click(function() {
			var loc = $("#location option:selected").val();
			location.href = "/controller1/life/list";
		});

		$("#help")	.click(function() {
			var loc = $("#location option:selected").val();
			var url = window.location.href;
			
					
			//location이 없으면 (""이면)
			console.log(loc === "");
			
			if(loc === "") {
				location.href = "/controller1/help/list"
			} else {
				location.href = "/controller1/help/list?location="+loc;
			}
			
		});

	})
</script>

<a class="goTop" href="#top">
<i class="fas fa-arrow-up a-fw fa-3x m-r-3 go-to-the-top"></i></a>