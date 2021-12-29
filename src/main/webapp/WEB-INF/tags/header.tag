<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags/"%>



<header class="p-3 bg-success text-white ">
	<div class="container">
		<div
			class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start"
		>
			<a href="/"
				class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"
			></a>

			<ul
				class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0"
			>
				<li><a href="/" class="nav-link px-2 text-secondary"> Home
				</a></li>
				<li><a href="/" class="nav-link px-2 text-white"> Features
				</a></li>
				<li><a href="/" class="nav-link px-2 text-white"> FAQs </a></li>
				<li><a href="/" class="nav-link px-2 text-white"> About </a></li>
			</ul>

			<div class="text-end dropdown">
				<!-- 로그인 하지 않은 상태인 경우 프로필을 띄운다 -->
				<c:if test="${empty sessionScope.loggedInMember }">
					<button type="button" id=login class="btn btn-info btn-outline-light me-2">
						Login</button>
					<button type="button" id=signup class="btn btn-warning">Sign-up</button>
				</c:if>
				<!-- 로그인 한 상태인 경우 프로필을 띄운다. -->
				<c:if test="${not empty sessionScope.loggedInMember }">
					<span> <img
						src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/fox.jpg"
						width="50" height="50" class="rounded-circle me-3" alt="error"
					/>
					</span>
					<span class="align-middle h3 dropdown-toggle"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false"
					> EasyMoneySniper </span>
					<ul class="dropdown-menu dropdown-menu-end"
						aria-labelledby="dropdownMenuButton1"
					>
						<li><a class="dropdown-item" href="#">Edit Profile</a></li>
						<li><a class="dropdown-item" href="#">Logout</a></li>
						<li><a class="dropdown-item" href="#">Something else here</a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
	<b:loginModal></b:loginModal>
</header>

<script>
	$("#login").click(function() {
		$("#myModal").modal("show");
	});
	
	$("#signup").click(function() {
		location.href="/controller/user/signup"
	});
</script>
