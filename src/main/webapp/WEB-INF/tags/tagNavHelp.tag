<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<nav class="navbar navbar-expand-sm navbar-dark sticky-top"
	aria-label="Third navbar example" id="nav-color">
	<div class="container-fluid">
		<div class="collapse navbar-collapse" id="navbarsExample03">
			<ul class="navbar-nav me-auto mb-2 mb-sm-0">
				<!-- 나중엘 radio 버튼으로 교체 -->
				<li id="nav-all" class="nav-item" >
					<button type="button" id="all" class="btn btn-outline-dark ml-1">사다주세요</button>
				</li>
				<li id="nav-news" class="nav-item">
					<button type="button" id="news" class="btn btn-outline-dark ml-1">맡아주세요</button>
				</li>
				<li id="nav-question" class="nav-item">
					<button type="button" id="question"	class="btn btn-outline-dark ml-1">옮겨주세요</button>
				</li>
				<li id="nav-life" class="nav-item">
					<button type="button" id="life" class="btn btn-outline-dark ml-1">일상생활</button>
				</li>
				<li id="nav-help" class="nav-item">
					<button type="button" id="help" class="btn btn-outline-dark ml-1">해주세요</button>
				</li>
			</ul>

		</div>
	</div>
</nav>