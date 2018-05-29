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
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-select.less"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<%--
<link href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">
 --%><link
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
					<li><p class="menu-title">Insturctor Menu</p></li>
					<!-- /.menu-title -->
					<li><a href="${pageContext.request.contextPath}/instructor/main"> <i
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
							<li><i class="fa fa-file"></i><a href="${pageContext.request.contextPath}/instructor/test/info">Exam Date and File</a></li>
						</ul></li>
					<li class="active"><a href="${pageContext.request.contextPath}/instructor/score"> <i class="menu-icon fa fa-bar-chart-o"></i>Manage Score
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
						<h1>View Student Score</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li><a href="${pageContext.request.contextPath}/instructor/score">Manage Score</a></li>
							<li class="active">View Student Score</li>
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
								<strong class="card-title">${ocosInfo.oc_title} / ${ocosInfo.os_name} (<c:set var="os_start_date" value="${ocosInfo.os_start_date}"/><c:if test="${os_start_date!=null}"><df:dateForm date="${ocosInfo.os_start_date}"/></c:if> ~ <c:set var="os_end_date" value="${ocosInfo.os_end_date}"/><c:if test="${os_end_date!=null}"><df:dateForm date="${ocosInfo.os_end_date}"/></c:if>) Student List</strong>
							</div>
							<div class="card-body">
								<table id=""
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Student Name</th>
											<th>Phone</th>
											<th>Status</th>
											<th>Course Due<br>(Dropout) Date</th>
											<th>Attendance<br>Score</th>
											<th>Writing<br>Score</th>
											<th>Practice<br>Score</th>
											<th>Total<br>Score</th>
											<th>Manage<br>Score</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${scoreSearchCount>0}">
										<c:forEach var ="l" items="${scoreSearch}">
										<tr>
											<td>${l.name_}</td>
											<td>${l.phone}</td>
											<td>${l.learning_status}</td>
											<td><df:dateForm date="${l.course_end_date}"/></td>
											<td>${l.attendance_score} / <b>${score_percentage.attendance_percentage}</b></td>
											<td>${l.writing_score} / <b> ${score_percentage.writing_percentage}</b></td>
											<td>${l.practice_score} / <b> ${score_percentage.practice_percentage}</b></td>
											<td>${l.total_score}</td>
											<td>
											<button type="button" class="btn btn-info btn-sm btn-score-insert" data-toggle="modal" data-target="#score-input" value="${l.student_id}" ${(l.delete_status=='N' || l.learning_status=='중도탈락')?"disabled":""}>+</button>
											<button type="button" class="btn btn-info btn-sm btn-score-delete" value="${l.student_id}" ${(l.delete_status=='Y')?"disabled":""}>-</button></td>
										</tr>
										</c:forEach>
										</c:if>
										<c:if test="${scoreSearchCount==0}">
										<tr>
											<td colspan="9">There is no student.</td>
										</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<!-- Chart -->
					<!-- <div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">수강생 총점</strong>
							</div>
							<div class="card-body  offset-md-4" style="width: 33.3%">
								<canvas id="instructorScoreChart"></canvas>
							</div>
						</div>
					</div>  -->

				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->

		<!-- Modal -->
		<div class="modal fade" id="score-input" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Score Update</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">

						<div class="form-group"><label for="attendance-input" class=" form-control-label">Attendance Score</label>
						<input type="number" id="attendance-input" name="attendance-input" placeholder="Enter attendance score(max ${score_percentage.attendance_percentage})" class="form-control" required></div>
						<div class="form-group"><label for="writing-input" class=" form-control-label">Writing Score</label>
						<input type="number" id="writing-input" name="writing-input" placeholder="Enter writing score(max ${score_percentage.writing_percentage})" class="form-control" required></div>
						<div class="form-group"><label for="practice-input" class=" form-control-label">Practice Score</label>
						<input type="number" id="practice-input" name="practice-input" placeholder="Enter practice score(max ${score_percentage.practice_percentage})" class="form-control" required></div>

						<div id="not-100percent"></div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-default btn-total-score">OK</button>
					</div>
				</div>

			</div>
		</div>

		<!-- 점수 입력 Form -->
		<form id="score-upload-form"
						action="${pageContext.request.contextPath}/instructor/score/studentlist/scoreInsert" method="POST">
			<input type="hidden" name="attendance_score" id="attendance_score" required />
			<input type="hidden" name="writing_score" id="writing_score" required />
			<input type="hidden" name="practice_score" id="practice_score" required />
			<input type="hidden" name="os_id" id="os_id" required />
			<input type="hidden" name="student_id" id="student_id" required />
		</form>
	</div>

	<!-- /#right-panel -->

	<!-- Right Panel -->

	<script src="${pageContext.request.contextPath}/resources/assets/js/vendor/jquery-2.1.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<!--
	<script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/chart-js/Chart.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/lib/chart-js/chartjs-init.js"></script>

	<script src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/widgets.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
	-->

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<!-- <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>-->
	<!--
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>
	-->

	<script type="text/javascript">
		$(document).ready(function() {

			var os_id = "${os_id}";

			$("button.btn-score-insert").click(function(){

				var student_id = $(this).val();

				var student_name = $(this).parent().siblings().eq("0").text();
				console.log(student_name);
				$("div#score-input").find("h4.modal-title").text("Update Student(" + student_name + ") Score");

	          // Check if the entered score is appropriate to its percentage limit.
	          $("button.btn-total-score").click(function(){

	        	  	var ap = ${score_percentage.attendance_percentage};
	        	  	var wp = ${score_percentage.writing_percentage};
	        	  	var pp = ${score_percentage.practice_percentage};

	        	  	if (($("input#attendance-input").val() == "") || ($("input#writing-input").val() == "") || ($("input#practice-input").val() == "")) {

	        	  		$("div#not-100percent").append("<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span>All scores should be filled in.<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");

	        	  	} else {
		        	    var apv = parseInt($("input#attendance-input").val(), 10);
		  	        	var wpv = parseInt($("input#writing-input").val(), 10);
		  	        	var ppv = parseInt($("input#practice-input").val(), 10);

		        	   	var tot = parseInt(ap) + parseInt(wp) + parseInt(pp);

		        	    if (ap < apv ) {
			        	   	$("div#not-100percent").append("<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> The attendance score should be below "+ ap + ".<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
		        	    } else if (wp < wpv ) {
			        	   	$("div#not-100percent").append("<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> The writing score should be below "+ wp +".<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
		        	    } else if (pp < ppv ) {
			        	   	$("div#not-100percent").append("<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> The practice socre should be below "+ pp +".<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
		        	    } else {

		        	    	$("input#attendance_score").val(apv);
		        	    	$("input#writing_score").val(wpv);
		        	    	$("input#practice_score").val(ppv);
		        	    	$("input#os_id").val(os_id);
		        	    	$("input#student_id").val(student_id);

		        	    	$("form#score-upload-form").submit();

		        	   	}

	        	  	}

	        	});

			});

			$("button.btn-score-delete").click(function(){

				if (confirm("Would you like to delete the selected data?")) {
					location.assign("${pageContext.request.contextPath}/instructor/score/studentlist/scoreDelete?student_id="+$(this).val()+"&os_id="+os_id);
				}

			});

		});
	</script>

</body>
</html>
