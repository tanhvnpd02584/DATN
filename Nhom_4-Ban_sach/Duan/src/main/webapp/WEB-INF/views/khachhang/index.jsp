<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
<meta charset="utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<base href="${pageContext.servletContext.contextPath}/">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.png">

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
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="banner-area banner-res-large ptb-35">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<div class="single-banner">
						<div class="banner-img">
							<a><img src="img/banner/1.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Miễn phí vận chuyển</h4>
							<p>Áp dụng với hóa đơn trên 200k</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<div class="single-banner">
						<div class="banner-img">
							<a><img src="img/banner/2.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Đổi trả</h4>
							<p>Đảm bảo hoàn 100% tiền</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 hidden-sm col-xs-12">
					<div class="single-banner">
						<div class="banner-img">
							<a><img src="img/banner/3.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Thanh toán</h4>
							<p>Thanh toán khi giao hàng</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<div class="single-banner mrg-none-xs">
						<div class="banner-img">
							<a><img src="img/banner/4.png" alt="banner" /></a>
						</div>
						<div class="banner-text">
							<h4>Hỗ trợ</h4>
							<p>Gọi tới: + 0123.4567.89</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner-area-end -->
	<!-- slider-area-start -->
	<div class="slider-area">
		<div class="slider-active owl-carousel">
			<div class="single-slider pt-125 pb-130 bg-img"
				style="background-image: url(img/slider/1.jpg);">
				<div class="container">
					<div class="row">
						<div class="col-md-5">
							<div class="slider-content slider-animated-1 text-center">
								<a>Shop now</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="single-slider slider-h1-2 pt-215 pb-100 bg-img"
				style="background-image: url(img/slider/2.jpg);">
				<div class="container">
					<div class="slider-content slider-content-2 slider-animated-1">
						<a>Contact Us Today!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider-area-end -->
	<!-- product-area-start -->
	<div class="product-area pt-95 xs-mb">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title text-center mb-50">
						<h2>Được quan tâm</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<!-- tab-menu-start -->
					<div class="tab-menu mb-40 text-center">
						<ul>
							<li><a href="#books" data-toggle="tab">Giảm giá</a></li>
						</ul>
					</div>
					<!-- tab-menu-end -->
				</div>
			</div>
			<!-- tab-area-start -->
			<div class="tab-content">
				<div class="tab-pane active" id="Audiobooks">
					<div class="tab-active owl-carousel">
						<!-- single-product-start -->
						<c:forEach var="c" items="${km}">
							<div class="product-wrapper">
								<div class="product-img">
									<a> <img style="width: 270px; height: 300px"
										src="/ne?image=${c.sach.anhsach}" alt="book" class="primary" />
									</a>
									<div class="product-flag">
										<ul>
											<li><span class="sale">Mới</span></li>
											<li><span class="discount-percentage">${c.giamphantram}</span></li>
										</ul>
									</div>
								</div>
								<div class="product-details text-center">
									<div class="product-rating">
										<ul>
											<li><a><i class="fa fa-star"></i></a></li>
											<li><a><i class="fa fa-star"></i></a></li>
											<li><a><i class="fa fa-star"></i></a></li>
											<li><a><i class="fa fa-star"></i></a></li>
											<li><a><i class="fa fa-star"></i></a></li>
										</ul>
									</div>
									<h4>
										<a>${c.sach.tensach}</a>
									</h4>
									<div class="product-price">
										<ul>
											<li class="old-price">${c.sach.gia}</li>
											<li>${c.sach.gia-c.sach.gia*c.giamphantram/100}</li>

										</ul>
									</div>
								</div>
								<div class="product-link">
									<c:if test="${c.sach.soluong == 0}">
										<div class="product-button">
											<a title="Thêm vào giỏ hàng"><i
												class="fa fa-shopping-cart"></i>Hết hàng</a>
										</div>
									</c:if>
									<c:if test="${c.sach.soluong > 0}">
										<div class="product-button">
											<a href="khachhang/cart/add/${c.sach.idsach}"
												title="Thêm vào giỏ hàng"><i class="fa fa-shopping-cart"></i>Thêm
												vào giỏ hàng</a>
										</div>
									</c:if>
									<div class="add-to-link">
										<ul>
											<li><a
												href="khachhang/details/${c.sach.tensach}/${c.sach.idsach}"
												title="Details"><i class="fa fa-external-link"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- single-product-end -->
					</div>
				</div>
			</div>
			<!-- tab-area-end -->
		</div>
	</div>
	<!-- product-area-end -->
	<!-- banner-area-start -->
	<div class="banner-area-5 mtb-95">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="banner-img-2">
						<a><img src="img/banner/5.jpg" alt="banner" /></a>
						<div class="banner-text">
							<h3>G. Meyer Books & Spiritual Traveler Press</h3>
							<h2>Sale up to 30% off</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- banner-area-end -->
	<!-- bestseller-area-start -->
	<!-- bestseller-area-end -->
	<!-- Mới-book-area-start -->
	<!-- Mới-book-area-start -->
	<!-- banner-static-area-start -->
	<!-- banner-static-area-end -->
	<!-- most-product-area-start -->

	<!-- most-product-area-end -->
	<!-- testimonial-area-start -->
	<!-- testimonial-area-end -->
	<!-- recent-post-area-start -->

	<!-- recent-post-area-end -->
	<!-- social-group-area-start -->
	<div class="social-group-area ptb-60">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="section-title-3">
						<h3>Stay Connected</h3>
					</div>
					<div class="link-follow">
						<ul>
							<li><a><i class="fa fa-twitter"></i></a></li>
							<li><a><i class="fa fa-google-plus"></i></a></li>
							<li><a><i class="fa fa-facebook"></i></a></li>
							<li><a><i class="fa fa-youtube"></i></a></li>
							<li><a><i class="fa fa-flickr"></i></a></li>
							<li class="hidden-sm"><a><i class="fa fa-vimeo"></i></a></li>
							<li class="hidden-sm"><a><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- social-group-area-end -->
	<!-- footer-area-start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer-area-end -->
	<!-- Modal -->

	<!-- Modal end -->
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
