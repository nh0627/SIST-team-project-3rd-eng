<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="df" tagdir="/WEB-INF/tags" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SIST Education Center - Score Management System</title>
<meta name="description" content="Sufee Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom-style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-select.less"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<%-- <link href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet"> --%>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>



<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<style>

</style>
<body>


	<!-- Left Panel -->

	<aside id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-sm navbar-default">

			<div class="navbar-header">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#main-menu" aria-controls="main-menu"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/instructor/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-white.png" alt="Logo"></a> <a
					class="navbar-brand hidden" href="${pageContext.request.contextPath}/instructor/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-small.png" alt="Logo"></a>
			</div>

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="user-profile"><img src="${pageContext.request.contextPath}/resources/uploads/pictures/${sessionScope.instructorLoginInfo.profile_img}"
						alt="instructor.png">
						<h5 class="text-sm-center mt-2 mb-1 profile-font">Instructor</h5>
						<p class="text-sm-center mb-1 profile-font2">${sessionScope.instructorLoginInfo.name_}</p>
						<a href="${pageContext.request.contextPath}/logout">
						<button type="button" class="btn btn-success btn-sm btn-logout">Logout</button></a>
					</li>
					<li><p class="menu-title">Instructor Menu</p></li>
					<!-- /.menu-title -->
					<li class="active"><a href="${pageContext.request.contextPath}/instructor/main"> <i
							class="menu-icon fa fa-home"></i>Main
					</a></li>
					<li><a href="${pageContext.request.contextPath}/instructor/schedule"> <i
							class="menu-icon fa fa-table"></i>View Schedule
					</a></li>


					<li class="menu-item-has-children dropdown"><a href="${pageContext.request.contextPath}/instructor/test/scoreper"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-laptop"></i>Manage Exam
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-file"></i><a
								href="${pageContext.request.contextPath}/instructor/test/scoreper">Score Percentage</a></li>
							<li><i class="fa fa-file"></i><a href="${pageContext.request.contextPath}/instructor/test/info">
									Exam Date and File</a></li>
						</ul></li>
					<li><a href="${pageContext.request.contextPath}/instructor/score"> <i class="menu-icon fa fa-bar-chart-o"></i>Manage Score
					</a></li>

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</nav>
	</aside>
	<!-- /#left-panel -->

	<!-- Left Panel -->

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<!-- Header-->
		<header id="header" class="header">

			<div class="header-menu">

				<div class="col-sm-7">
					<a id="menuToggle" class="menutoggle pull-left"><i
						class="fa fa fa-tasks"></i></a>
					<div class="header-left"></div>
				</div>


				<!-- Body-->
				<div class="col-sm-5">
					<div class="user-area dropdown float-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <img
							class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/uploads/pictures/${sessionScope.instructorLoginInfo.profile_img}"
							alt="User Avatar">
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="${pageContext.request.contextPath}/instructor/main"><i class="fa fa- user"></i>Main</a>
							<a class="nav-link" href="${pageContext.request.contextPath}/logout"><i class="fa fa-power -off"></i>Logout</a>
						</div>
					</div>

					<div class="language-select dropdown" id="language-select">
						<a class="dropdown-toggle" href="#" data-toggle="dropdown"
							id="language" aria-haspopup="true" aria-expanded="true"> <i
							class="flag-icon flag-icon-kr"></i>
						</a>
						<div class="dropdown-menu" aria-labelledby="language">
							<div class="dropdown-item">
								<span class="flag-icon flag-icon-us"></span>
							</div>
						</div>
					</div>

				</div>
			</div>

		</header>
		<!-- /header -->
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="col-sm-4">
				<div class="page-header float-left">
					<div class="page-title">
						<h1>Main</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">Main</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-lg-5 col-md-6">
						<div class="card">
							<div class="card-header">
								<strong class="card-title mb-3">Instructor Info</strong>
							</div>
							<div class="card-body">
								<div class="mx-auto d-block">
									<img class="rounded-circle mx-auto d-block"
										src="${pageContext.request.contextPath}/resources/uploads/pictures/${sessionScope.instructorLoginInfo.profile_img}" alt="Card image cap">
									<h5 class="text-sm-center mt-2 mb-1">${sessionScope.instructorLoginInfo.name_}</h5>
									<div class="location text-sm-center">
										<i class="fa fa-map-marker"></i> Gangnam Center
									</div>
								</div>
								<hr>
								<div class="card-text text-sm-center">
									<button type="button"
										class="btn btn-info btn-sm btn-pass-change"
										data-toggle="modal" data-target="#change-password">Change Password</button>

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-7">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Instructor Info</strong>
							</div>
							<div class="card-body">
								<table class="table table-striped table-bordered">
									<tbody>
										<tr>
											<th>Name</th>
											<td>${name_}</td>
										</tr>
										<tr>
											<th>Phone</th>
											<td>${phone}</td>
										</tr>
										<tr>
											<th>Initial Reg. Date</th>
											<td><df:dateForm date="${initial_reg_date}"/></td>
										</tr>
										<tr>
											<th>Available Subjects</th>
											<td>${available_subjects}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->


		<!-- Modal -->
		<div class="modal fade" id="change-password" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Change Password</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<form id="pwChange" action="${pageContext.request.contextPath}/pwchange" method="POST">
					<div class="modal-body">
						<div class="form-group"><label for="current_pw" class=" form-control-label">Current password</label>
						<input type="password" id="current_pw" name="current_pw" placeholder="Please type your current password" class="form-control"></div>
						<div class="form-group"><label for="new_pw" class=" form-control-label">New password</label>
						<input type="password" id="new_pw" name="new_pw" placeholder="Please type your new password" class="form-control" onkeyup="validatePassword()" required></div>
						<div class="form-group"><label for="new_pw2" class=" form-control-label">Check New password</label>
						<input type="password" id="new_pw2" name="new_pw2" placeholder="Please type your new password again" class="form-control" onkeyup="samePassword()" required></div>
						<input type="hidden" id="login_id" name="login_id" value="${studentLoginInfo.login_id}">
						<div id="pwCheck"></div>
						<div id="pwCheck2"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="btnSubmit">OK</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script>

	var validate = false;
	var same = false;

	function validatePassword () {
		var new_pw = document.getElementById("new_pw").value;
		var result = "";
		 // default options (allows any password)
		 /*var o = {
		  lower:    0,
		  upper:    0,
		  alpha:    0, // lower + upper
		  numeric:  0,
		  special:  1,
		  length:   [3, 12]
		 };*/

		 /*var re = {
		   lower:   /[a-z]/g,
		   upper:   /[A-Z]/g,
		   alpha:   /[A-Z]/gi,
		   numeric: /[0-9]/g,
		   special: /([a-z])|([A-Z])|([0-9])/g
		  },
		  rule, i;
		 */

		 // Password length
		 var length = [3, 12];
		 // No blank
		 var blank_pattern = /[\s]/g;
		 // No special symbol
		 var special_pattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

		 // Enforce min/max length
		 if (new_pw.length < length[0] || new_pw.length > length[1]){
			 result = "<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> A length of password should be between 3 to 12. <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
			 document.getElementById("pwCheck").innerHTML = result;
			 validate=false;
			 return;
		 }

		 // Enforce lower/upper/alpha/numeric/special rules
		 if (new_pw.match(special_pattern) || new_pw.match(blank_pattern)){
			result = "<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> A password must contains only alphabets or numbers. <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
			document.getElementById("pwCheck").innerHTML = result;
			validate=false;
			return;
		  }

		 // great success!
		 result = "<div class=\"alert  alert-success alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-success\">OK</span> Valid password format.<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
		 document.getElementById("pwCheck").innerHTML = result;
		 validate=true;

		 this.samePassword();
		}

	function samePassword () {
		var new_pw = document.getElementById("new_pw").value;
		var new_pw2 = document.getElementById("new_pw2").value;

		var result = "";

		 // check new password again
		 if(new_pw != new_pw2){
			 result = result = "<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> The new passwords you've entered are not the same.<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
			 document.getElementById("pwCheck2").innerHTML = result;
			 same=false;
			 return;
		 }

		 if(validate && new_pw == new_pw2){
			 // Great success!
			 result = "<div class=\"alert  alert-success alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-success\">OK</span> The new passwords you've entered are the same!<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>";
			 document.getElementById("pwCheck2").innerHTML = result;
			 same=true;
		}


	}

		// Submit a new password, if it is in the right form or two password input are the same.
		$("button#btnSubmit").on("click", function(){
			 if(validate==true&& same==true){
				 $("form#pwChange").submit();
			 }
		});

		// If a password reset is succeed or not.
		if("${success}"!="" && "${success}"==1){
			window.alert("Your password has successfully reset.");
		} else if("${success}"!="" && "${success}"==0){
			window.alert("Please check that you've entered and confirmed your password!");
		}


	</script>
</body>
</html>
