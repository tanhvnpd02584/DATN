<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Quên mật khẩu?</title>
<meta name="description" content="">
<base href="${pageContext.servletContext.contextPath}/">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id"
	content="807193501186-nu3g82r6f25c3a1eudqii2etmruucfo3.apps.googleusercontent.com">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- owl.carousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- font-awesome css -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- flexslider.css-->
<link rel="stylesheet" href="css/flexslider.css">
<!-- chosen.min.css-->
<link rel="stylesheet" href="css/chosen.min.css">
<!-- style css -->
<link rel="stylesheet" href="style.css">
<!-- responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr css -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body class="login">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header-area-end -->
	<!-- breadcrumbs-area-start -->
	<div class="breadcrumbs-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumbs-menu">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#" class="active">login</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumbs-area-end -->
	<!-- user-login-area-start -->
	<div class="user-login-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="login-title text-center mb-30">
						<h2>Lấy lại mật khẩu</h2>
					</div>
				</div>
				<div
					class="col-lg-offset-3 col-lg-6 col-md-offset-3 col-md-6 col-sm-12 col-xs-12">
					<div class="login-form">
						<form method="post" action="/khachhang/forget">
							<div class="single-login">
								<label>Email<span>*</span></label> <input type="email"
									name="taikhoan" />
							</div>
							${tb}
							<div class="single-login single-login-2">
								<button>Gửi mật khẩu</button>
							</div>
						</form>
						<a href="khachhang/login">Đăng nhập</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- user-login-area-end -->
	<!-- footer-area-start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer-area-end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- owl.carousel js -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- meanmenu js -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="js/wow.min.js"></script>
	<!-- jquery.parallax-1.1.3.js -->
	<script src="js/jquery.parallax-1.1.3.js"></script>
	<!-- jquery.countdown.min.js -->
	<script src="js/jquery.countdown.min.js"></script>
	<!-- jquery.flexslider.js -->
	<script src="js/jquery.flexslider.js"></script>
	<!-- chosen.jquery.min.js -->
	<script src="js/chosen.jquery.min.js"></script>
	<!-- jquery.counterup.min.js -->
	<script src="js/jquery.counterup.min.js"></script>
	<!-- waypoints.min.js -->
	<script src="js/waypoints.min.js"></script>
	<!-- plugins js -->
	<script src="js/plugins.js"></script>
	<!-- main js -->
	<script src="js/main.js"></script>
</body>
</html>

