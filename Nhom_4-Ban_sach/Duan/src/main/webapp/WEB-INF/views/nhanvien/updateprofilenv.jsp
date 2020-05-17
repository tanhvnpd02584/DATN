<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath}/">
<title>Thay đổi thông tin tài khoản</title>

<!-- Custom fonts for this template-->
<link href="nhanvien/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="nhanvien/css/sb-admin-2.min.css" rel="stylesheet">
<script type="text/javascript">
	function c() {
		if (document.form.ten.value === "") {
			alert("Vui lòng nhập tên");
			document.form.ten.focus();
			document.getElementById("ten").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("ten").style.borderColor = "green";
		}
		if (document.form.mk.value === "") {
			alert("Vui lòng nhập mật khẩu");
			document.form.mk.focus();
			document.getElementById("mk").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("mk").style.borderColor = "green";
		}
		if (document.form.cmnd.value === "") {
			alert("Vui lòng nhập số cmnd");
			document.form.cmnd.focus();
			document.getElementById("cmnd").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("cmnd").style.borderColor = "green";
		}
		if (document.form.sdt.value === "") {
			alert("Vui lòng nhập số điện thoại");
			document.form.cmnd.focus();
			document.getElementById("sdt").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("sdt").style.borderColor = "green";
		}
		if (document.form.dc.value === "") {
			alert("Vui lòng nhập địa chỉ nhà");
			document.form.cmnd.focus();
			document.getElementById("dc").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("dc").style.borderColor = "green";
		}
		var cmt = document.getElementById("cmnd").value;
		if (isNaN(cmt)) {
			alert("Hãy nhập số CMND");
			document.form.cmnd.focus();
			document.getElementById("cmnd").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("cmnd").style.borderColor = "green";
		}
		var numa = document.getElementById("sdt").value;
		if (isNaN(numa)) {
			alert("Hãy nhập số điện thoại");
			document.form.sdt.focus();
			document.getElementById("sdt").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("sdt").style.borderColor = "green";
		}
	}
</script>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="topbar.jsp"></jsp:include>
				<div class="container">

					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-7">
									<div class="p-5">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-4">Thay đổi thông tin tài
												khoản của bạn!</h1>
										</div>
										<c:forEach var="u" items="${user}">
											<form:form class="user" modelAttribute="forms"
												action="/nhanvien/updateprofilenv/update" method="POST"
												name="form" onclick="return c()">
												<div class="form-group">
													<label>ID tài khoản:</label>
													<form:input path="idnhanvien" readonly="true"
														class="form-control form-control-user"
														id="exampleInputEmail" />
												</div>
												<div class="form-group">
													<label>Họ và tên:</label>
													<form:input path="hoten"
														class="form-control form-control-user" id="ten" />
												</div>
												<div class="form-group">
													<label>Email đăng nhập:</label>
													<form:input type="email" path="email" readonly="true"
														class="form-control form-control-user"
														id="exampleInputEmail" />
												</div>
												<div class="form-group" style="display: none">
													<label>Mật khẩu:</label>
													<form:password path="matkhau"
														class="form-control form-control-user" id="mk"
														value="${u.matkhau}" />
												</div>
												<div class="form-group">
													<label>Số CMND:</label>
													<form:input path="cmnd"
														class="form-control form-control-user" id="cmnd"
														value="${u.cmnd}" />
												</div>
												<div class="form-group">
													<label>Số điện thoại:</label>
													<form:input type="number" path="sdt"
														class="form-control form-control-user" id="sdt" />
												</div>
												<div class="form-group">
													<label>Địa chỉ:</label>
													<form:input path="sonha"
														class="form-control form-control-user" id="dc" />
												</div>
												<button class="btn btn-primary btn-user btn-block">
													Sửa đổi thông tin tài khoản!</button>
											</form:form>
										</c:forEach>
										<div class="text-center">
											<a class="small" href="nhanvien/index">Quay lại trang
												chính</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<jsp:include page="modal.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript-->
	<script src="nhanvien/vendor/jquery/jquery.min.js"></script>
	<script src="nhanvien/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="nhanvien/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="nhanvien/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="nhanvien/vendor/chart.js/Chart.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="nhanvien/js/demo/chart-area-demo.js"></script>
	<script src="nhanvien/js/demo/chart-pie-demo.js"></script>
</body>

</html>
