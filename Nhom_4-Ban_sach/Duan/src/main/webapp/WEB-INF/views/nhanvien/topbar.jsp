<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="ISO-8859-1">
<title>Top bar</title>
</head>
<body>
	<!-- Topbar -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>
		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
			<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow"><a
				class="nav-link dropdown-toggle" href="#" id="userDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span
					class="mr-2 d-none d-lg-inline text-gray-600 small"><c:forEach
							var="u" items="${user}">${u.hoten}</c:forEach></span>
			</a> <!-- Dropdown - User Information -->
				<div
					class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="userDropdown">
					<a class="dropdown-item" href="nhanvien/profilenv"> <i
						class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Thông tin
						tài khoản
					</a> <a class="dropdown-item" href="nhanvien/updateprofilenv"> <i
						class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Sửa đổi
						thông tin
					</a> <a class="dropdown-item" href="nhanvien/quenmatkhau"> <i
						class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Thay đổi
						mật khẩu
					</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="nhanvien/logout" > <i
						class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						Đăng xuất
					</a>
				</div></li>

		</ul>

	</nav>
	<!-- End of Topbar -->
</body>
</html>