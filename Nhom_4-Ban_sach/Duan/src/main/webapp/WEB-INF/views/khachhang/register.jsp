<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng ký tài khoản</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<style>
span[id*=errors] {
	color: red;
	font-style: italic;
	background-repeat: no-repeat;
	padding-left: 25px;
}
</style>
<script type="text/javascript">
	function validate() {
		if (document.form.email.value === "") {
			alert("Chưa nhập email");
			document.form.email.focus();
			document.getElementById("email").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("email").style.borderColor = "green";
		}
		if (document.form.matkhau.value === "") {
			alert("Chưa nhập mật khẩu");
			document.form.matkhau.focus();
			document.getElementById("matkhau").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("matkhau").style.borderColor = "green";
		}
		if (document.form.hoten.value === "") {
			alert("Chưa nhập họ tên");
			document.form.hoten.focus();
			document.getElementById("hoten").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("hoten").style.borderColor = "green";
		}
		if (document.form.cmnd.value === "") {
			alert("Chưa nhập số cmnd");
			document.form.cmnd.focus();
			document.getElementById("cmnd").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("cmnd").style.borderColor = "green";
		}
		if (document.form.sdt.value === "") {
			alert("Chưa nhập số điện thoại");
			document.form.sdt.focus();
			document.getElementById("sdt").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("sdt").style.borderColor = "green";
		}
		if (document.form.diachi.value === "") {
			alert("Chưa nhập địa chỉ");
			document.form.diachi.focus();
			document.getElementById("diachi").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("diachi").style.borderColor = "green";
		}
		var cmt = document.getElementById("cmnd").value;
		if (isNaN(cmt)) {
			alert("Hãy nhập số CMND");
			document.form.cmnd.focus();
			document.getElementById("cmnd").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("cmnd").style.borderColor = "green";
		}
		var numa = document.getElementById("num").value;
		if (isNaN(numa)) {
			alert("Hãy nhập số điện thoại");
			document.form.num.focus();
			document.getElementById("num").style.borderColor = "red";
			return false;
		} else {
			document.getElementById("num").style.borderColor = "green";
		}
	}
</script>
</head>
<body class="register">
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
							<li><a href="#">Trang chủ </a></li>
							<li><a href="#" class="active">Đăng ký</a></li>
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
						<h2>Đăng ký</h2>
					</div>
				</div>
				${message}
				<form:form action="khachhang/dangky" method="post" name="form"
					enctype="multipart/form-data" modelAttribute="form"
					onclick="return validate()">
					<div
						class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
						<div class="billing-fields">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										<label>Email<span>*</span></label>
										<form:input path="email" type="email" id="email" />
										<form:errors path="email" />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										<label>Mật khẩu<span>*</span></label>
										<form:password path="matkhau" id="matkhau" />
										<form:errors path="matkhau" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										<label>Họ tên<span>*</span></label>
										<form:input path="hoten" id="hoten" />
										<form:errors path="hoten" />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										<label>Số CMND/CMT<span>*</span></label>
										<form:input path="cmnd" id="cmnd" />
										<form:errors path="cmnd" />
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<div class="single-register">
										<label>Số điện thoại<span>*</span></label>
										<form:input path="sdt" id="num" />
										<form:errors path="sdt" />
									</div>
								</div>

							</div>
							<div class="single-register">
								<label>Địa chỉ<span>*</span></label>
								<form:textarea rows="5" id="diachi" path="diachi"
									style="width: 400px"></form:textarea>
								<form:errors path="diachi" />
							</div>

							<div class="single-register">
								<button>Đăng ký</button>
							</div>
						</div>
					</div>
				</form:form>
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

