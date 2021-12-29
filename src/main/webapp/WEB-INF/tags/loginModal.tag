<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
*{
color:black;
}
#m_label {
	float: left;
	margin-top: -38px;
	background-color: #f5f5f5;
	padding: 7px 15px;
	height: 38px;
	border-bottom-left-radius: 4px;
	border-top-left-radius: 4px;
	border: 0px solid black;
	position: relative;
	z-index: 999;
	
}

#nickname {
	position: relative;
	padding-left: 52px !important;
}

#pw {
	position: relative;
	padding-left: 52px !important;
}


</style>
<!-- Modal HTML -->
<div id="myModal" class="modal fade " tabindex="-1">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Login</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>
			<div class="modal-body">
				<form method="post">
					<div class="mb-3">
						<label class="form-label">ID</label> <input type="text"
							class="form-control" id="nickname" name="id"
							placeholder="Username" /> <label id="m_label" for="Profile-pic">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</label>
					</div>
					<div class="mb-3">
						<label class="form-label">Password</label> <input type="password"
							class="form-control" id="pw" name="password"
							placeholder="Password" /> <label id="m_label" for="Profile-pic">
							<i class="fa fa-key" aria-hidden="true"></i>
						</label>
					</div>
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" id="rememberMe" />
						<label class="form-check-label" for="rememberMe">Remember
							me</label>
					</div>
					<div class="modal-footer d-block">
						<p class="float-start">
							Not yet account <a href="#">Sign Up</a>
						</p>
						<button type="submit" class="btn btn-warning float-end">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
