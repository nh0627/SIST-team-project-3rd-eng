<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<!-- 커스텀 CSS 파일 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/custom-style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/cs-skin-elastic.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lib/datatable/dataTables.bootstrap.min.css"> --%>
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-select.less"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<%-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css"
	rel="stylesheet"> --%>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>


<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
<script>
	$(document).ready(function() {
		$("button.btnDeleteClassroom").on("click", function() {
			if (confirm("Would you like to delete the selected data?")) {
				var classroom_id = $(this).val();
				location.assign("${pageContext.request.contextPath}/manager/basicinfo/class/delete?classroom_id=" + classroom_id);
			}
		});
	});
</script>
</head>

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
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/manager/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-white.png"
					alt="Logo"></a> <a class="navbar-brand hidden"
					href="${pageContext.request.contextPath}/manager/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-small.png"
					alt="Logo"></a>
			</div>

			<div id="main-menu" class="main-menu collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="user-profile"><img src="${pageContext.request.contextPath}/resources/uploads/pictures/${sessionScope.managerLoginInfo.profile_img}"
						alt="manager.jpg">
						<h5 class="text-sm-center mt-2 mb-1 profile-font">Manager</h5>
						<p class="text-sm-center mb-1 profile-font2">${sessionScope.managerLoginInfo.name_}</p>
						<button type="button" class="btn btn-success btn-sm btn-logout" onclick="location.href='${pageContext.request.contextPath}/logout'">Logout</button>
					</li>
					<li><p class="menu-title">Manager Menu</p></li>
					<!-- /.menu-title -->
					<li><a href="${pageContext.request.contextPath}/manager/main">
							<i class="menu-icon fa fa-home"></i>Main
					</a></li>
					<li class="menu-item-has-children dropdown show active"><a
						href="#" class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-View-square-o"></i>Manage Basic Info
					</a>
						<ul class="sub-menu children dropdown-menu show">
							<li><i class="fa fa-table"></i><a
								href="${pageContext.request.contextPath}/manager/basicinfo/course">Basic Course</a></li>
							<li><i class="fa fa-table"></i><a
								href="${pageContext.request.contextPath}/manager/basicinfo/subject">Basic Subject</a></li>
							<li class="active"><i class="fa fa-table"></i><a
								href="${pageContext.request.contextPath}/manager/basicinfo/class">Classroom</a></li>
							<li><i class="fa fa-table"></i><a
								href="${pageContext.request.contextPath}/manager/basicinfo/book">Textbook</a></li>
						</ul></li>
					<li><a
						href="${pageContext.request.contextPath}/manager/instructor">
							<i class="menu-icon fa fa-users"></i>Manage Instructor Account
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/manager/course"> <i
							class="menu-icon fa fa-book"></i>Manage Offered Course and Subject
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/manager/student"> <i
							class="menu-icon fa fa-meh-o"></i>Manage Student
					</a></li>
					<li class="menu-item-has-children dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <i
							class="menu-icon fa fa-bar-chart-o"></i>View Score
					</a>
						<ul class="sub-menu children dropdown-menu">
							<li><i class="fa fa-folder"></i><a
								href="${pageContext.request.contextPath}/manager/score/bycourse">Score by Course</a></li>
							<li><i class="fa fa-folder"></i><a
								href="${pageContext.request.contextPath}/manager/score/bystudent">Score by Student</a></li>
						</ul></li>

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
							class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/uploads/pictures/${sessionScope.managerLoginInfo.profile_img}"
							alt="User Avatar">
						</a>

						<div class="user-menu dropdown-menu">
							<a class="nav-link" href="${pageContext.request.contextPath}/manager/main"><i class="fa fa- user"></i>Main</a>

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
						<h1>Classroom</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="#">Manage Basic Info</a></li>
							<li class="active">Classroom</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Registerred Classroom List</strong>
								<button type="button"
									class="btn btn-info btn-sm btn-margin-left" data-toggle="modal"
									data-target="#addClass">Add New</button>
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info">
									<thead>
									<thead>
										<tr>
											<th>Classroom ID</th>
											<th>Name</th>
											<th>Quota</th>
											<th>Manager</th>
											<th>Manage classroom</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="c" items="${classroomList_ds}">
											<tr>
												<td>${c.classroom_id}</td>
												<td>${c.classroom_name}</td>
												<td>${c.maximum}</td>
												<td>${c.manager_id}</td>
												<td><button type="button" class="btn btn-info btn-sm btnDeleteClassroom" value="${c.classroom_id}" ${(c.delete_status=='Y')?"":"disabled"}>Delete</button></td>
											</tr>
										</c:forEach>
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
	</div>
		<!-- Modal -->

		<div class="modal fade" id="addClass" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
				<form id="new insert" action="${pageContext.request.contextPath}/manager/basicinfo/class/insert" method="POST" >
					<div class="modal-header">
						<h4 class="modal-title">Add New Classroom</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="classroom_name" class=" form-control-label">Name</label> <input
								id="classroom_name" name="classroom_name" placeholder="Enter a classroom name" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="maximum" class=" form-control-label">Quota</label> <input
								id="maximum" name="maximum" placeholder="Enter Quota(limit of student)" class="form-control" required>
						</div>
						<div class="form-group">
							<input type="hidden" class="basicinfo-class" name="manager_id" id="manager_id" value="${managerLoginInfo.login_id}"/>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default">OK</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
					</form>
				</div>

			</div>
		</div>


	<!-- .animated -->


	<!-- /#right-panel -->

	<!-- Right Panel -->

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<!--
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/chart-js/Chart.bundle.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/widgets.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
	-->

</body>
</html>
