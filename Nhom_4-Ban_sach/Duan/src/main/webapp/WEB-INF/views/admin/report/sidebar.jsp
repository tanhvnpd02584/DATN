<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
			href="admin/index">
			<div class="sidebar-brand-icon rotate-n-15">
				<i class="fas fa-book"></i>
			</div>
			<div class="sidebar-brand-text mx-3">Admin</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Quản lý tài khoản</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapseTwo"
			aria-expanded="true" aria-controls="collapseTwo"> <i
				class="fas fa-fw fa-cog"></i> <span>Tài khoản của bạn</span>
		</a>
			<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
				data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="admin/profilenv">Xem thông tin</a> <a
						class="collapse-item" href="admin/updateprofilenv">Sửa đổi
						thông tin</a>
				</div>
			</div></li>

		<!-- Nav Item - Utilities Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fas fa-fw fa-wrench"></i> <span>Khách hàng & Nhân viên</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Khách hàng:</h6>
					<a class="collapse-item" href="admin/dsprofilekh">Danh sách
						khách hàng</a>
					<h6 class="collapse-header">Nhân viên:</h6>
					<a class="collapse-item" href="admin/danhsachnv">Danh sách nhân
						viên</a>
					<h6 class="collapse-header">Chức năng:</h6>
					<a class="collapse-item" href="admin/taonv">Thêm nhân viên</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Sách và đơn hàng</div>

		<!-- Nav Item - Pages Collapse Menu -->
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapsePages"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-fw fa-folder"></i> <span>Sách</span>
		</a>
			<div id="collapsePages" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="admin/showbooks">Xem thông tin
						sách</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Thao tác khác:</h6>
					<a class="collapse-item" href="admin/danhmucsach">Danh mục sách</a>
					<div class="collapse-divider"></div>
					<h6 class="collapse-header">Thao tác khác:</h6>
					<a class="collapse-item" href="admin/loaisach">Loại sách</a>
				</div>
			</div></li>


		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapsePages2"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-tags"></i> <span>Khuyến mãi</span>
		</a>
			<div id="collapsePages2" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Thao tác:</h6>
					<a class="collapse-item" href="admin/khuyenmai">Danh sách
						khuyến mãi</a>
				</div>
			</div></li>
		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href="admin/donhangdd">
				<i class="fas fa-fw fa-table"></i> <span>Đơn hàng đã giao</span>
		</a></li>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">Thống kê</div>
		<li class="nav-item"><a class="nav-link collapsed"
			data-toggle="collapse" data-target="#collapsePages3"
			aria-expanded="true" aria-controls="collapsePages"> <i
				class="fas fa-tags"></i> <span>Thống kê doanh thu</span>
		</a>
			<div id="collapsePages3" class="collapse"
				aria-labelledby="headingPages" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<a class="collapse-item" href="admin/report/revenu">Danh thu
						trong năm</a>
				</div>
			</div></li>
		<li class="nav-item"><a class="nav-link"
			href="admin/report/inventory"><i class="fas fa-tags"></i> <span>Thống
					kê theo danh mục sách và thể loại</span> </a></li>
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->
</body>
</html>