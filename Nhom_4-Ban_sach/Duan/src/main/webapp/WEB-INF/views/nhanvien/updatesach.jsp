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
	function clck() {
		if (document.form.ten.value === "") {
			alert("Vui lòng nhập tên sách");
			document.form.ten.focus();
			document.getElementById("ten").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("ten").style.borderColor = "green";
		}
		if (document.form.tg.value === "") {
			alert("Vui lòng nhập tên tác giả");
			document.form.tg.focus();
			document.getElementById("tg").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("tg").style.borderColor = "green";
		}
		if (document.form.nxb.value === "") {
			alert("Vui lòng nhập tên nhà xuất bản");
			document.form.nxb.focus();
			document.getElementById("nxb").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("nxb").style.borderColor = "green";
		}
		if (document.form.ngay.value === "") {
			alert("Vui lòng chọn ngày phát hành");
			document.form.ngay.focus();
			document.getElementById("ngay").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("ngay").style.borderColor = "green";
		}
		if (document.form.sl.value < 10) {
			alert("Số lượng phải lơn hơn 10");
			document.form.sl.focus();
			document.getElementById("sl").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("sl").style.borderColor = "green";
		}
		if (document.form.gia.value < 10000) {
			alert("Giá sách ít nhất 10000 trở lên");
			document.form.gia.focus();
			document.getElementById("gia").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("gia").style.borderColor = "green";
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
											<h1 class="h4 text-gray-900 mb-4">Cập nhật thông tin
												sách</h1>
										</div>
										<form:form class="user" modelAttribute="forms"
											enctype="multipart/form-data"
											action="/nhanvien/updatesach/update" method="POST"
											name="form" onclick="return clck()">
											<div class="form-group">
												<label>ID sách:</label>
												<form:input path="idsach" readonly="true"
													class="form-control form-control-user"
													id="exampleInputEmail" />
											</div>
											<div class="form-group">
												<label>Loại sách ban đầu ${forms.loaisach.tenloai}</label> <br>
												<label for="cars">Chọn tên loại sách:</label> <br>
												<form:select path="loaisach.idloai" id="cars">
													<c:forEach var="c" items="${ls}">
														<form:option value="${c.idloai}">${c.tenloai}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="form-group">
												<label>Tên sách:</label>
												<form:input path="tensach"
													class="form-control form-control-user" id="ten" />
											</div>
											<div class="form-group">
												<label>Tên tác giả:</label>
												<form:input path="tentacgia"
													class="form-control form-control-user" id="tg" />
											</div>
											<div class="form-group">
												<label>Nhà xuất bản:</label>
												<form:input path="nhaxuatban" readonly="true"
													class="form-control form-control-user"
													id="exampleInputEmail" />
											</div>
											<div class="form-group">
												<label>Ngày xuất bản:</label> <input type="date" name="ngay"
													class="form-control form-control-user" id="ngay"
													value="${forms.ngayph}" />
												<form:hidden path="ngayph" />
											</div>

											<div class="form-group">
												<label>Số lượng:</label>
												<c:if test="${forms.soluong < 10}">
													<br>
													<span>Số lượng sách dưới 10 vui lòng nhập thêm</span>
												</c:if>
												<form:input type="number" path="soluong"
													class="form-control form-control-user" id="sl" />
											</div>
											<div class="form-group">
												<label>Giá của sách:</label>
												<form:input type="number" path="gia"
													class="form-control form-control-user" id="gia" />
											</div>
											<div class="form-group">
												<label>Hình sách:</label> <input type="file" name="anh"
													id="exampleInputEmail" />
												<form:hidden path="anhsach" />
											</div>
											<button class="btn btn-primary btn-user btn-block">
												Cập nhật</button>
										</form:form>
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
