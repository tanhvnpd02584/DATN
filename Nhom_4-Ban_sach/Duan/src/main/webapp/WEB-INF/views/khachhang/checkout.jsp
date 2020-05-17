<!doctype html>
<%@page import="java.util.List"%>
<%@page import="com.poly.entity.sach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.poly.service.CartService"%>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Thanh toán</title>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<body class="checkout">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<div class="checkout-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="checkbox-form">
						<c:set var="user" value="${hoten}"></c:set>
						<c:forEach var="b" items="${user}">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
									<div class="checkout-form-list">
										<h2>
											Họ tên<span class="required">*</span>
										</h2>
										<br>
										<h3>${b.hoten}</h3>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="checkout-form-list">
										<h2>Số điện thoại</h2><br>
										<h3>${b.sdt}</h3>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="checkout-form-list">
										<h2>Địa chỉ nhận<span class="required">*</span></h2> <br>
										<h3>${b.diachi}</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="your-order">
						<h3>Your order</h3>

						<table border="1">
							<thead>
								<tr style="text-align: center; height: 50px; size: 30px">
									<th class="product-name">Sách</th>
									<th class="product-quality">Số lượng</th>
									<th class="product-total">Tổng tiền</th>
								</tr>
							</thead>
							<c:forEach var="p"
								items="${sessionScope['scopedTarget.cartService'].items}">
								<tbody style="text-align: center">
									<tr class="cart_item">
										<td class="product-name">${p.sach.tensach}</td>
										<td class="product-quantity"><strong>${p.soluong}</strong>
										</td>
										<td class="product-total"><span class="amount">${p.gia*p.soluong}</span>
										</td>
									</tr>

								</tbody>
							</c:forEach>
							<tfoot>
								<tr class="order-total" style="text-align: center;">
									<th>Tổng tiền</th>
									<td colspan="2"><strong><span class="amount">${sessionScope['scopedTarget.cartService'].amount}</span></strong></td>
								</tr>
							</tfoot>
						</table>
						<br> <a href="khachhang/thanhtoan">
							<button>Thanh toán</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- checkout-area-end -->
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

