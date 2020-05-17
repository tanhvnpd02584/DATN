<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Cập nhập thể loại sách</title>

<!-- Custom fonts for this template-->
<link href="nhanvien/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="nhanvien/css/sb-admin-2.min.css" rel="stylesheet">

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
											<h1 class="h4 text-gray-900 mb-4">Cập nhật loại sách!</h1>
										</div>
										<form:form class="user" modelAttribute="form"
											action="nhanvien/updateloai" method="POST">
											<form:input path="idloai" readonly="true"
												class="form-control form-control-user"
												id="exampleInputEmail" />
											<div class="form-group">
												<label>Tên loại:</label>
												<form:input path="tenloai"
													class="form-control form-control-user"
													id="exampleInputEmail" />
											</div>
											<div class="form-group">
												<label>Danh mục ban đầu: ${form.danhmuc.tendanhmuc}</label> <br>
												<label for="cars">Chọn danh mục:</label> <br>
												<form:select path="danhmuc.iddanhmuc" id="cars">
													<c:forEach var="c" items="${h}">
														<form:option value="${c.iddanhmuc}">${c.tendanhmuc}</form:option>
													</c:forEach>
												</form:select>
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
