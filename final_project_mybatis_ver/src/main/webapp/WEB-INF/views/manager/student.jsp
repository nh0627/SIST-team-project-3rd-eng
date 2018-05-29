<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="df" tagdir="/WEB-INF/tags"%>
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

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
<!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/scss/style.css">
<%-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/lib/vector-map/jqvmap.min.css"
	rel="stylesheet"> --%>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<script>
	$(document).ready(function() {

		// 수강생 삭제
		$("button.btnDeleteStudent").on("click", function() {
			if (confirm("Would you like to delete the selected data?")) {
				var student_id= $(this).val();
				location.assign("${pageContext.request.contextPath}/manager/student/studentDelete?student_id="+student_id);
			}
		});


		// 과정 등록(Ajax 요청을 통해 Modal에 수강생 정보 전달 후 수강생의 수강 이력 불러옴)
		$("button.btnCourseAdd").on("click", function(){
			// Header부분에 수강생id/이름/주민번호 불러오기
			var student_id=$(this).val();
			var name_=$(this).parents("tr").children("td").eq(1).find("span").text();
			var ssn = $(this).parents("tr").children("td").eq(2).text();
			$("div#student-course-register h6.modal-title").text("Select an offered course to register for  "+student_id+"("+name_+"/"+ssn+"))");

			// 수강생id를 hidden에 추가
			$("div#student-course-register input[type='hidden']").val(student_id);

			// 수강 이력 동적 생성 테이블
			$.get("${pageContext.request.contextPath}/manager/getCourseHistory?student_id="+student_id, function(data, status){	
				//data - 리턴값, status - 상태메시지
				var txt="<tr><th>Offered Course id</th><th>Title</th><th>Term</th><th>Classroom</th><th>Status</th><th>Course Due<br>(Dropout) Date</th></tr>";
				if(data.length>0){
					for(i in data){

						txt+="<tr>";
						txt+="<td>"+data[i].oc_id +"</td>";
						txt+="<td>"+data[i].oc_title+"</td>";
 						txt+="<td>"+data[i].oc_start_date.substr(0,10)+"<br>~"
								+""+data[i].oc_end_date.substr(0,10)+"</td>";
						txt+="<td>"+data[i].classroom_name+"</td>";
						txt+="<td>"+data[i].learning_status+"</td>";
						txt+="<td>"+data[i].course_end_date.substr(0,10)+"</td>";
						txt+="</tr>";
					}
				} else{
					txt+="<tr><td colspan=\"6\">There is no course history.</td></tr>";
				}
				$("div#student-course-register div#courseHistory table").html(txt);
			});
		});

		// 검색 및 페이징 처리
		// 검색
		var key = "${key}";
		var value = "${value}";
        $("select#key > option[value='"+key+"']").attr("selected","selected");
        $("input#value").val(value);

        // 페이징 처리
		if ("${key}" != "ALL") {
		 	$("button.btnPrevious").attr("disabled", "disabled");
			$("button.btnNext").attr("disabled", "disabled")
		}

		if('${previous}'==0){
		 	$("button.btnPrevious").attr("disabled", "disabled");
		}

		if('${next}' > Math.ceil('${totalCount}'/'${limit_count}')){
		    $("button.btnNext").attr("disabled", "disabled")
		}

		$("button.btnPrevious").on("click", function() {
		 	location.assign("${pageContext.request.contextPath}/manager/student?pageNum=${previous}#bottom");
		});

		$("button.btnNext").on("click", function() {
		  	location.assign("${pageContext.request.contextPath}/manager/student?pageNum=${next}#bottom");
		});


		$("button.btnStudentReg").on("click", function() {
			// 수강생 과정 등록의 옵션 선택 여부를 확인, 예외처리
			if ($("select[name='oc_id'] option:selected").val() == 0) {
				$("div#add-error").append("<div class=\"alert  alert-danger alert-dismissible fade show\" role=\"alert\"><span class=\"badge badge-pill badge-danger\">Fail</span> Any offered course is not selected yet.<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button></div>");
			} else {
				$("form#studentOcAdd").submit();
			}
		});

	});
</script>
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
					<li><a
						href="${pageContext.request.contextPath}/manager/main"> <i
							class="menu-icon fa fa-home"></i>Main
					</a></li>
										<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-check-square-o"></i>Manage Basic Info</a>
                        <ul class="sub-menu children dropdown-menu">
													<li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/manager/basicinfo/course">Basic Course</a></li>
													<li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/manager/basicinfo/subject">Basic Subject</a></li>
													<li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/manager/basicinfo/class">Classroom</a></li>
													<li><i class="fa fa-table"></i><a href="${pageContext.request.contextPath}/manager/basicinfo/book">Textbook</a></li>
                        </ul>
                    </li>
					<li><a
						href="${pageContext.request.contextPath}/manager/instructor">
							<i class="menu-icon fa fa-users"></i>Manage Instructor Account
					</a></li>
					<li><a
						href="${pageContext.request.contextPath}/manager/course"> <i
							class="menu-icon fa fa-book"></i>Manage Offered Course and Subject
					</a></li>
					<li class="active"><a
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
						<h1>Student List</h1>
					</div>
				</div>
			</div>
			<div class="col-sm-8">
				<div class="page-header float-right">
					<div class="page-title">
						<ol class="breadcrumb text-right">
							<li class="active">Manage Student</li>
						</ol>
					</div>
				</div>
			</div>
		</div>

		<div class="content mt-3">
			<div class="animated fadeIn">
				<div class="row">


					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">Student List</strong>
								<button type="button"
									class="btn btn-info btn-sm btn-margin-left" data-toggle="modal"
									data-target="#student-register">Add New</button>
							</div>
							<div class="card-body">

								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info">
									<thead>
										<tr>
											<th>Student ID</th>
											<th>Student<br>Name
											</th>
											<th>SSN	
											</th>
											<th>Phone</th>
											<th>Initial<br>Reg. Date
											</th>
											<th>Num of<br>Reg. Courses
											</th>
											<th>Delete
											</th>
											<th>Registration</th>
											<th>Dropout
											</th>
											<th>Cancellation</th>
											<th>View More
											</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${studentCount>0}">
											<c:forEach var="s" items="${studentList}">
												<tr>
													<td>${s.student_id}</td>
													<td><p class="tt student-profile">
															${s.name_}<span class="tt-text"><img
																src="${pageContext.request.contextPath}/resources/uploads/pictures/${s.profile_img}"
																alt="student-profile">${s.name_}
															</span>
														</p></td>
													<td>${s.ssn}</td>
													<td>${s.phone}</td>
													<td>
														<c:set var="initial_reg_date" value="${s.initial_reg_date}" />
														<c:if test="${initial_reg_date!=null}">
															<df:dateForm date="${initial_reg_date}" />
														</c:if>
													</td>
													<th>${s.registration_count}</th>
													<th><button type="button"
																class="btn btn-info btn-sm btnDeleteStudent"
																value="${s.student_id}" ${(s.registration_count==0)?"":"disabled"}>Delete</button></th>
													<th><button type="button"
															class="btn btn-info btn-sm btnCourseAdd"
															data-toggle="modal"
															data-target="#student-course-register"
															value="${s.student_id}">Register</button></th>
													<th><a
														href="${pageContext.request.contextPath}/manager/student/dropout?student_id=${s.student_id}"><button
																type="button" class="btn btn-info btn-sm"
																value="${s.student_id}" ${(s.dropout_status=='Y')?"":"disabled"}>Dropout</button></a></th>
													<th><a
														href="${pageContext.request.contextPath}/manager/student/coursecancel?student_id=${s.student_id}"><button
																type="button" class="btn btn-info btn-sm"
																value="${s.student_id}" ${(s.cancel_status=='Y')?"":"disabled"}>Cancel</button></a></th>
													<th><a
														href="${pageContext.request.contextPath}/manager/student/detail?student_id=${s.student_id}"><button
																type="button" class="btn btn-info btn-sm">
																<i class="fa fa-search"></i>
															</button></a></th>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${studentCount==0}">
											<tr>
												<td colspan="11">There is no student data.</td>
											</tr>
										</c:if>
									</tbody>
								</table>

								<div class="center-parent btn-data-table">
									<div class="center-child">

										<button type="button" class="btn btn-secondary btn-sm">
											TotalCount <span class="badge badge-dark">${totalCount}</span>
										</button>
										<button type="button" class="btn btn-secondary btn-sm">
											Count <span class="badge badge-dark">${resultSize}</span>
										</button>
										<button type="button" class="btn btn-secondary btn-sm btnPrevious">Previous</button>
										<button type="button" class="btn btn-secondary btn-sm btnNext">Next</button>
										<div id="search-box">
											<form class="form-inline" method="post">
												<label>
												<select name="key" id="key" name="bootstrap-data-table_length" aria-controls="bootstrap-data-table"
													class="form-control form-control-sm">
													<option	value="student_id">Student ID</option>
													<option value="name_">Name</option>
													<option value="ssn">SSN</option>
													<option value="phone">Phone</option>
												</select>
												</label>
												<label>
													<input type="text"	class="form-control form-control-sm" placeholder="Search" id="value" name="value"
														aria-controls="bootstrap-data-table">
												</label>
												<button type="submit" class="btn btn-secondary btn-sm">
													<span class="ti-search"></span>
												</button>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .content -->

			<!-- Modal -->
			<div class="modal fade" id="student-register" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Add New Student</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<form id="studentInsert"
						action="${pageContext.request.contextPath}/manager/student/studentInsert"
						method="POST" enctype="multipart/form-data" >
						<div class="modal-body">

							<div class="form-group">
								<label for="name_" class=" form-control-label">Student Name</label>
								<input type="text" id="name_" name="name_"
									placeholder="Enter his/her name" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="ssn" class=" form-control-label">SSN
									</label> <input type="text" id="ssn" name="ssn"
									placeholder="Enter his/her SSN number" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="phone" class=" form-control-label">Phone</label> <input
									type="text" id="phone" name="phone" placeholder="Enter his/her phone number"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label for="initial_reg_date">Initial Registered Date</label> <input type="date"
									class="form-control" id="initial_reg_date" name="initial_reg_date" required>
							</div>
							<div class="form-group">
								<label for="profile_img">Student Photo</label> <input type="file"
									class="form-control" id="file" name="file">
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

			<!-- Modal -->
			<div class="modal fade" id="student-course-register" role="dialog">
				<div class="modal-dialog modal-lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<h6 class="modal-title">Select an offered course to register for S000(name_/ssn)</h6>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<form id="studentOcAdd" action="${pageContext.request.contextPath}/manager/student/studentOcAdd" method="POST" >
						<div class="modal-body">
							<div class="form-group">
								<select id="oc_id" name="oc_id" class="form-control">
									<option value="0">Select a course to register</option>
									<c:if test="${ocAddibleListCount>0}">
									<c:forEach var="a" items="${ocAddibleList}">
										<option value="${a.oc_id}">
												${a.oc_id} / ${a.oc_title} /
												<c:set var="oc_start_date" value="${a.oc_start_date}" />
												<c:if test="${oc_start_date!=null}">
													<df:dateForm date="${oc_start_date}" />
												</c:if>~
												<c:set var="oc_end_date" value="${a.oc_end_date}" />
												<c:if test="${oc_end_date!=null}">
													<df:dateForm date="${oc_end_date}" />
												</c:if>
												/ ${a.classroom_name} / Offered Subject ${a.subject_offered_number} / Num of Reg. ${a.registerred_number}
										</option>
									</c:forEach>
									</c:if>
									<c:if test="${ocAddibleListCount==0}">
									<option value="0">There is no available course to register.</option>
									</c:if>
								</select>
							</div>
							<div class="form-group">
								<input type="hidden" id="student_id" name="student_id" value=""/>
							</div>
							<div class="form-group" id="courseHistory">
								<table class="table table-striped table-bordered dataTable no-footer">

								</table>
							</div>
							<div id="add-error"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btnStudentReg">OK</button>
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
		
		// 마우스 오버시 툴팁 보이게
		$("p.tt.student-profile").on("mouseover", function() {
			$(this).find("span.tt-text").css("visibility", "visible");
		}).on("mouseout", function() {
			$(this).find("span.tt-text").css("visibility", "hidden");
		});

		// 파일 업로드 실패시 경고창
		var fail = "${fail}";
		if (fail == 1) {
			alert("Fail to upload the file(available formats: .jpg, .jpeg, .bmp, .png, .gif).");
		}

		</script>
	</div>
</body>
</html>
