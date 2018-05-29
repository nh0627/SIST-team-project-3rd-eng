<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="df" tagdir="/WEB-INF/tags"%>
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

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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

		// Delete
		$(".btn-delete").on("click", function() {
			if (confirm("Would you like to delete the selected data?")) {
				var os_id = $(this).val();
				var file_name = $(this).parents("tr").children().eq(7).text();
				location.assign("${pageContext.request.contextPath}/instructor/infoDelete?os_id=" + os_id + "&file_name=" + file_name);
			}
		});

		// Upload exam date and file
		$("button.btn-upload").click(function() {
		 	var os_id = $(this).val();
		 	$("form#file-upload-form > div.modal-body > input[type='hidden']").val(os_id);

		 	// Modal Header
		 	var oc_title = $(this).parents("tr").children().eq(2).text();
		 	var oc_date = $(this).parents("tr").children().eq(3).text();
			var os_name = $(this).parents("tr").children().eq(0).text();
		 	$("h6#score-percentage-setting-title").html("Update " + oc_title+"("+oc_date+") / "+ "<br>" + os_name + " Test Info");

		});

	});
</script>
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
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/instructor/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-white.png"
					alt="Logo"></a> <a class="navbar-brand hidden"
					href="${pageContext.request.contextPath}/instructor/main"><img
					src="${pageContext.request.contextPath}/resources/images/logo-small.png"
					alt="Logo"></a>
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
					<li><a
						href="${pageContext.request.contextPath}/instructor/main"> <i
							class="menu-icon fa fa-home"></i>Main
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/instructor/schedule">
							<i class="menu-icon fa fa-table"></i>View Schedule
					</a></li>


					<li class="menu-item-has-children dropdown show active"><a
						href="${pageContext.request.contextPath}/instructor/test/scoreper"
						class="dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="true"> <i
							class="menu-icon fa fa-laptop"></i>Manage Exam
					</a>
						<ul class="sub-menu children dropdown-menu show">
							<li><i class="fa fa-file"></i><a
								href="${pageContext.request.contextPath}/instructor/test/scoreper">Score Percentage</a></li>
							<li><i class="fa fa-file"></i><a
								href="${pageContext.request.contextPath}/instructor/test/info">Exam Date and File</a></li>
						</ul></li>

					<li><a
						href="${pageContext.request.contextPath}/instructor/score"> <i
							class="menu-icon fa fa-bar-chart-o"></i>Manage Score
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
						<h1>Exam Date and File</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="#">Manage Exam</a></li>
							<li class="active">Exam Date and File</li>
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
								<strong class="card-title">Offered Subject List</strong>
							</div>
							<div class="card-body">
								<table id="" class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Subject Name
											</th>
											<th>Term
											</th>
											<th>Course Title
											</th>
											<th>Term
											</th>
											<th>Classroom</th>
											<th>Textbook</th>
											<th>Exam Date</th>
											<th>Exam File</th>
											<th>Manage Exam</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${exam_osList_count>0}">
										<c:forEach var="l" items="${exam_osList}">
											<tr>
												<td>${l.os_name}</td>
												<td><df:dateForm date="${l.os_start_date}" />~<br>
												<df:dateForm date="${l.os_end_date}" /></td>
												<td>${l.oc_title}</td>
												<td><df:dateForm date="${l.oc_start_date}" />~<br>
												<df:dateForm date="${l.oc_end_date}" /></td>
												<td>${l.classroom_name}</td>
												<td><p class="tt interpark-book"> ${l.textbook_title}
														<span class="tt-text">
															<img alt="${l.isbn}">${l.textbook_title}<br>${l.publisher}<br>ISBN: ${l.isbn}
														</span>
													</p>
												</td>
												<td><c:set var="exam_date" value="${l.exam_date}" />
													<c:if test="${exam_date!=null}">
														<df:dateForm date="${l.exam_date}" />
													</c:if></td>
												<td><a href="${pageContext.request.contextPath}/resources/uploads/files/${l.exam_file}">${l.exam_file} </a></td>
												<td><button type="button" class="btn btn-info btn-sm btn-upload" data-toggle="modal" data-target="#score-percentage-setting" value="${l.os_id}" ${(l.exam_date==null&&l.exam_file==null)?"":"disabled"}>+</button>
													<button type="button" class="btn btn-info btn-sm btn-delete" value="${l.os_id}" ${(l.delete_status=='Y'&&l.exam_date!=null)?"":"disabled"}>-</button></td>
											</tr>
										</c:forEach>
										</c:if>
										<c:if test="${exam_osList_count==0}">
											<tr><td colspan="9">There is no available subject to be managed.</td></tr>
										</c:if>
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
		<div class="modal fade" id="score-percentage-setting" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">

					<div class="modal-header">
						<h6 class="modal-title" id="score-percentage-setting-title"></h6>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

						<form id="file-upload-form"
						action="${pageContext.request.contextPath}/instructor/fileUpload"
						method="POST" enctype="multipart/form-data" class="">

						<div class="modal-body">
							<input type="hidden" class="test-info" name="os_id" id="os_id" value=""/>
							<div class="form-group">
								<label for="exam_date">Exam Date</label> <input type="date"
									class="form-control" id="exam_date" name="exam_date" required>
							</div>
							<div class="form-group">
								<label for="testfile">Exam File</label> <input type="file"
									class="form-control" id="file" name="file" required>
							</div>

						</div>

						<div class="modal-footer">

							<button type="submit" class="btn btn-default test-info" form="file-upload-form">OK</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>

						</div>

					</form>
				</div>

			</div>
		</div>
	</div>
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

	<script>
		$( document ).ready(function() {

			var coverurl;
			var totalResults;

			$("p.tt.interpark-book").on("mouseover", function(){

				// alt에 걸린 ISBN 찾기
				var alt = $(this).find("img").attr("alt");

				// interparkAPI를 AJAX로 호출
				var url_ = "${pageContext.request.contextPath}/instructor/interparkapi";
		        $.ajax({
		        	url: url_,
		        	data: { isbn : alt },
		        	async : false,
		        	success:function(responseData){
		        		coverurl = $(responseData).find("coverSmallUrl").text();
		        		totalResults = $(responseData).find("totalResults").text();
		        		console.log(coverurl);
		        	}
		        });

		        if (totalResults == 1) {
		        	$(this).find("img").attr("src", coverurl);
		        } else {
		        	$(this).find("img").attr("src", "${pageContext.request.contextPath}/resources/images/no_result.png");
		        }
		        $(this).find("span.tt-text").css("visibility", "visible");

			}).on("mouseout", function(){
				$(this).find("span.tt-text").css("visibility", "hidden");
			});

			// 마우스 오버시 툴팁 보이게
			$("p.tt.instructor-profile").on("mouseover", function(){
				$(this).find("span.tt-text").css("visibility", "visible");
			}).on("mouseout", function(){
				$(this).find("span.tt-text").css("visibility", "hidden");
			});

			var fail = "${fail}";
			if (fail == 1) {
				alert("The file upload has failed.(You can upload only .zip file.)");
			}

		});
	</script>

</body>
</html>
