<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Thống kê sách</title>

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
								sách hiện có</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID sách</th>
											<th>ID loại</th>
											<th>Giá</th>
											<th>Nhà xuất bản</th>
											<th>Ngày phát hành</th>
											<th>Ảnh sách</th>
											<th>Số lượng</th>
											<th>Tên sách</th>
											<th>Tên tác giả</th>
											<th>Thao tác:</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="u" items="${sa}">
											<tr>
												<td>${u.idsach}</td>
												<td>${u.loaisach.idloai}</td>
												<td>${u.gia}</td>
												<td>${u.nhaxuatban}</td>
												<td><fmt:formatDate value="${u.ngayph}" /></td>
												<td><img style="width: 100px; height: 100px" alt=""
													src="/ne?image=${u.anhsach}" /></td>
												<c:if test="${u.soluong>0 }">
													<td>${u.soluong}</td>
												</c:if>
												<c:if test="${u.soluong ==0 }">
													<td style="color: red"><strong>Hết hàng</strong></td>
												</c:if>
												<td>${u.tensach}</td>
												<td>${u.tentacgia}</td>
												<td><button class="btn btn-primary">
														<a style="color: white;"
															href="admin/updatesach/${u.idsach}">Sửa đổi</a>
													</button></td>
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
