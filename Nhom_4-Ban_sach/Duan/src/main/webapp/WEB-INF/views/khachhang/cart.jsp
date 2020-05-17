<!doctype html>
<%@page import="com.poly.entity.sach"%>
<%@page import="java.util.List"%>
<%@page import="com.poly.service.CartService"%>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<title>Giỏ hàng</title>
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
</head>
<body class="cart">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header-area-end -->
	<!-- entry-header-area-start -->
	<div class="entry-header-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<br>
					<div class="entry-header-title">
						<h2>Giỏ hàng</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- entry-header-area-end -->
	<!-- cart-main-area-start -->
	<div class="cart-main-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<form action="/khachhang/cart/update" method="post">
						<div class="table-content table-responsive">
						${thong}
							<table>
								<thead>
									<tr>
										<th class="product-thumbnail">Ảnh</th>
										<th class="product-name">Tên sách</th>
										<th class="product-price">Giá gốc</th>
										<th class="product-price">Giá sau khuyến mãi</th>
										<th class="product-quantity">Số lượng</th>
										<th class="product-subtotal">Tổng tiền</th>
										<th class="product-remove">Xóa</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p"
										items="${sessionScope['scopedTarget.cartService'].items}">
										<tr>
											<td class="product-thumbnail"><a href="#"><img
													src="/ne?image=${p.sach.anhsach}" alt="man" /></a></td>
											<td class="product-name"><a
												href="khachhang/details/${p.sach.tensach}/${p.sach.idsach}">${p.sach.tensach}</a></td>
											<td class="product-price"><span class="amount">${p.sach.gia}</span></td>
											<td class="product-price"><span class="amount">${p.gia}
													VND</span></td>
											<td><input name="${p.sach.idsach}" value="${p.soluong}"
												type="number" min="1"></td>
											<td class="product-subtotal">${p.gia*p.soluong} VND</td>
											<td class="product-remove"><a
												href="khachhang/cart/remove/${p.sach.idsach}"><i
													class="fa fa-times"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="buttons-cart mb-30">
							<button class="product-update">Cập nhật giỏ hàng</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12"></div>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
					<div class="cart_totals">
						<table>
							<tbody>
								<tr class="order-total">
									<th>Total</th>
									<td><strong> <span class="amount">${sessionScope['scopedTarget.cartService'].amount}</span>
									</strong></td>
									<div class="wc-proceed-to-checkout">
										<a href="khachhang/checkout">Đặt hàng</a>
									</div>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- cart-main-area-end -->
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

