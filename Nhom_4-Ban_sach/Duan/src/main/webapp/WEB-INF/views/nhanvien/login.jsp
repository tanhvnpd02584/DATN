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
<base href="${pageContext.servletContext.contextPath}" />
<title>Đăng nhập hệ thống quản lý sách</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">

							<div class="col-lg-12">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Hệ thống quản lý sách!</h1>
									</div>
									<form class="user" method="post" action="/nhanvien/login">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												name="tk" id="exampleInputEmail"
												aria-describedby="emailHelp"
												placeholder="Nhập địa chỉ email...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												name="mk" id="exampleInputPassword" placeholder="Mật khẩu">
										</div>
										${message}
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Nhớ
													tài khoản</label>
											</div>
										</div>
										<button type="submit"
											class="btn btn-primary btn-user btn-block">Đăng nhập
											ngay!</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="quenmatkhau">Quên mật khẩu?</a>
									</div>
									<div class="text-center">
										<a class="small" href="#" style="pointer-events: none;">Tạo
											một tài khoản!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>

</body>

</html>
