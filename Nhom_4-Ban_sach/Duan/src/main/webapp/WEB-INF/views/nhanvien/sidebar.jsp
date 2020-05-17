<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<base href="${pageContext.servletContext.contextPath}/">
<title>Side bar</title>
</head>
<body>
	<!-- Sidebar -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<!-- Sidebar - Brand -->
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="nhanvien/index">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-book"></i>
			</div>
			<div class="sidebar-brand-text mx-3">Nhân viên</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a class="nav-link"
			href="nhanvien/index"> <i class="fas fa-fw fa-tachometer-alt"></i>
				<span>Cập nhật dữ liệu!</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Quản lý tài khoản</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapseTwo" href="#"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-fw fa-cog"></i> <span>Tài khoản của bạn</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="nhanvien/profilenv">Xem thông
						tin</a> <a class="collapse-item" href="nhanvien/updateprofilenv">Sửa
						đổi thông tin</a>
				</div>
			</div></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fas fa-fw fa-wrench"></i> <span>Tài khoản khách hàng</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="nhanvien/dsprofilekh">Danh sách
						khách hàng</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Quản lý sách và đơn hàng</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span>Thống kê sách</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="nhanvien/showbooks">Xem thông
						tin sách</a> <a class="collapse-item" href="nhanvien/themsach">Thêm
						sách mới</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Thao tác khác:</h6>
					<a class="collapse-item" href="nhanvien/danhmucsach">Danh mục
						sách</a> <a class="collapse-item" href="nhanvien/themdanhmucsach">Thêm
						danh mục sách</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Thao tác khác:</h6>
					<a class="collapse-item" href="nhanvien/loaisach">Loại sách</a> <a
						class="collapse-item" href="nhanvien/themloaisach">Thêm loại
						sách</a>
				</div>
			</div></li>


		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapsePages2"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-tags"></i> <span>Quản lý khuyến mãi</span>
		</a>
			<div id="collapsePages2" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="nhanvien/khuyenmai">Danh sách
						khuyến mãi</a> <a class="collapse-item" href="nhanvien/themkhuyenmai">Thêm
						khuyến mãi mới</a>
				</div>
			</div></li>
		<!-- Nav Item - Charts -->
		<li class="nav-item"><a class="nav-link" href="nhanvien/donhang">
				<i class="fas fa-fw fa-chart-area"></i> <span>Đơn hàng đang
					giao</span>
		</a></li>

		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link"
			href="nhanvien/donhangdd"> <i class="fas fa-fw fa-table"></i> <span>Đơn
					hàng đã giao</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->
</body>
</html>