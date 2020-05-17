<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<base href="${pageContext.servletContext.contextPath}/">
<title>Thống kê doanh thu</title>
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
<script type="text/javascript">
	
</script>
</head>
<body id="page-top">
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<jsp:include page="topbar.jsp"></jsp:include>
				<div class="container-fluid">
					<div style="display: inline;">
						<form action="admin/report/search">
							<label for="ca">Chọn năm thống kê:</label> <select name="year">
								<c:forEach var="c" items="${ya}">
									<option>${c}</option>
								</c:forEach>
							</select>
							<button>Tìm</button>
						</form>
					</div>
					<jsp:include page="chart-line.jsp" />
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Thống kê doanh thu trong năm</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Tháng</th>
											<th>Tổng doanh thu tháng</th>
											<th>Số đơn hàng</th>
											<th>Số lượng sách bán ra</th>
											<th>Chi tiết</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="a" items="${data}">
											<tr>
												<td>${a[0]}-${a[1]}</td>
												<td><f:formatNumber value="${a[2]}" pattern="#,###" />
													VNĐ</td>
												<td>${a[3]}</td>
												<td>${a[4]}</td>
												<td><a href="admin/report/revenu/${a[1]}-${a[0]}">Chi
														tiết tháng</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<jsp:include page="footer.jsp"></jsp:include>
			</div>
			<!-- End of Content Wrapper -->
		</div>
	</div>
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

	<!-- Page level plugins -->
	<script src="nhanvien/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="nhanvien/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="nhanvien/js/demo/datatables-demo.js"></script>
</body>
</html>