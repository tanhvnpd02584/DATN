<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>Danh sách khuyến mãi</title>

<!-- Custom fonts for this template-->
<link href="nhanvien/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="nhanvien/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="nhanvien/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="report/sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">
				<jsp:include page="report/topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Bảng thống kê
								các khuyến mãi hiện có</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID Khuyến mãi</th>
											<th>ID sách</th>
											<th>Tên chương trình</th>
											<th>Phần trăm giảm</th>
											<th>Trạng thái</th>
											<th>Xóa</th>
											<th>Thao tác:</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${km}">
											<tr>
												<td>${u.idkm}</td>
												<td>${u.sach.idsach}</td>
												<td>${u.tenchuongtrinh}</td>
												<td>${u.giamphantram}</td>
												<c:if test="${u.trangthai == true }">
													<td>Đang bật</td>
												</c:if>
												<c:if test="${u.trangthai == false }">
													<td>Đang Tắt</td>
												</c:if>
												<td><button class="btn btn-primary">
														<a style="color: white;"
															href="admin/khuyenmai/xoa/${u.idkm}">Xóa</a>
													</button></td>
												<c:if test="${u.trangthai == true }">
													<td><button class="btn btn-primary">
															<a style="color: white;" href="admin/khuyenmai/${u.idkm}">
																Tắt km</a>
														</button></td>
												</c:if>
												<c:if test="${u.trangthai == false }">
													<td><button class="btn btn-primary">
															<a style="color: white;" href="admin/khuyenmai/${u.idkm}">
																Bật km</a>
														</button></td>
												</c:if>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->

			<jsp:include page="report/footer.jsp"></jsp:include>
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<jsp:include page="report/modal.jsp"></jsp:include>

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

	<!-- Page level plugins -->
	<script src="nhanvien/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="nhanvien/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="nhanvien/js/demo/datatables-demo.js"></script>
</body>

</html>
