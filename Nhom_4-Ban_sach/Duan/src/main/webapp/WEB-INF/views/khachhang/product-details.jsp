<!doctype html>
<html class="no-js" lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Chi tiết sách</title>
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
<body class="product-details">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- product-main-area-start -->
	<div class="product-main-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<!-- product-main-area-start -->
					<div class="product-main-area">
						<div class="row">
							<div class="col-lg-5 col-md-5 col-sm-6 col-xs-12">
								<div class="flexslider">
									<ul class="slides">
										<li data-thumb="/ne?image=${kk.anhsach}"><img
											src="/ne?image=${kk.anhsach}" alt="woman" /></li>
									</ul>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-6 col-xs-12">
								<div class="product-info-main">
									<div class="page-title">
										<h1>${kk.tensach}</h1>
									</div>
									<div class="product-info-stock-sku">
										<span>In stock</span>
										<div class="product-attribute">
											<span>${kk.nhaxuatban}</span>
										</div>
									</div>
									<div class="product-reviews-summary">
										<div class="reviews-actions">
											<a>Tác giả: ${kk.tentacgia}</a> <a class="view"> Ngày
												phát hành: ${kk.ngayph} </a>
										</div>
									</div>
									<div class="product-info-price">
										<div class="price-final">
											<span class="old-price">${kk.gia}</span> <br> <span>${kk.gia=kk.gia-kk.gia*kk.khuyenmai[0].giamphantram/100}
												VND</span>
										</div>
									</div>
									<div class="product-add-form">
										<form action="#">
											<a href="khachhang/cart/add/${kk.idsach}">Thêm vào giỏ
												hàng</a>
										</form>
									</div>
									<div class="product-social-links">
										<div class="product-addto-links">
											<a><i class="fa fa-heart"></i></a> <a><i
												class="fa fa-pie-chart"></i></a> <a><i
												class="fa fa-envelope-o"></i></a>
										</div>
										<div class="product-addto-links-text">
											<p>Powerwalking to the gym or strolling to the local
												coffeehouse, the Savvy Shoulder Tote lets you stash your
												essentials in sporty style! A top-loading compartment
												provides quick and easy access to larger items, while
												zippered pockets on the front and side hold cash, credit
												cards and phone.</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- product-main-area-end -->
					<!-- product-info-area-start -->
					<div class="product-info-area mt-80">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="active"><a href="#Details" data-toggle="tab">Details</a></li>
							<li><a href="#Reviews" data-toggle="tab">Reviews 3</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="Details">
								<div class="valu">
									<p>The sporty Joust Duffle Bag can't be beat - not in the
										gym, not on the luggage carousel, not anywhere. Big enough to
										haul a basketball or soccer ball and some sneakers with plenty
										of room to spare, it's ideal for athletes with places to go.</p>
									<ul>
										<li><i class="fa fa-circle"></i>Dual top handles.</li>
										<li><i class="fa fa-circle"></i>Adjustable shoulder
											strap.</li>
										<li><i class="fa fa-circle"></i>Full-length zipper.</li>
										<li><i class="fa fa-circle"></i>L 29" x W 13" x H 11".</li>
									</ul>
								</div>
							</div>
							<div class="tab-pane" id="Reviews">
								<div class="valu valu-2">
									<div class="section-title mb-60 mt-60">
										<h2>Customer Reviews</h2>
									</div>
									<ul>
										<li>
											<div class="review-title">
												<h3>themes</h3>
											</div>
											<div class="review-left">
												<div class="review-rating">
													<span>Price</span>
													<div class="rating-result">
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a>
													</div>
												</div>
												<div class="review-rating">
													<span>Value</span>
													<div class="rating-result">
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a>
													</div>
												</div>
												<div class="review-rating">
													<span>Quality</span>
													<div class="rating-result">
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
														<a><i class="fa fa-star"></i></a> <a><i
															class="fa fa-star"></i></a>
													</div>
												</div>
											</div>
											<div class="review-right">
												<div class="review-content">
													<h4>themes</h4>
												</div>
												<div class="review-details">
													<p class="review-author">
														Review by<a>plaza</a>
													</p>
													<p class="review-date">
														Posted on <span>12/9/16</span>
													</p>
												</div>
											</div>
										</li>
									</ul>
									<div class="review-add">
										<h3>You're reviewing:</h3>
										<h4>Joust Duffle Bag</h4>
									</div>
									<div class="review-field-ratings">
										<span>Your Rating <sup>*</sup></span>
										<div class="control">
											<div class="single-control">
												<span>Value</span>
												<div class="review-control-vote">
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a>
												</div>
											</div>
											<div class="single-control">
												<span>Quality</span>
												<div class="review-control-vote">
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a>
												</div>
											</div>
											<div class="single-control">
												<span>Price</span>
												<div class="review-control-vote">
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a> <a><i class="fa fa-star"></i></a>
													<a><i class="fa fa-star"></i></a> <a><i
														class="fa fa-star"></i></a>
												</div>
											</div>
										</div>
									</div>
									<div class="review-form">
										<div class="single-form">
											<label>Nickname <sup>*</sup></label>
											<form action="#">
												<input type="text" />
											</form>
										</div>
										<div class="single-form single-form-2">
											<label>Summary <sup>*</sup></label>
											<form action="#">
												<input type="text" />
											</form>
										</div>
										<div class="single-form">
											<label>Review <sup>*</sup></label>
											<form action="#">
												<textarea name="massage" cols="10" rows="4"></textarea>
											</form>
										</div>
									</div>
									<div class="review-form-button">
										<a>Submit Review</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- product-info-area-end -->
					<!-- new-book-area-start -->
					<div class="new-book-area mt-60">
						<div class="section-title text-center mb-30">
							<h3>upsell products</h3>
						</div>
						<div class="tab-active-2 owl-carousel">
							<c:forEach var="k" items="${khuyen}">
								<!-- single-product-start -->
								<div class="product-wrapper">
									<div class="product-img">
										<a> <img style="height: 250px" src="/ne?image=${k.sach.anhsach}" alt="book"
											class="primary" />
										</a>
										<div class="quick-view">
											<a class="action-view" data-target="#productModal"
												data-toggle="modal" title="Quick View"> <i
												class="fa fa-search-plus"></i>
											</a>
										</div>
										<div class="product-flag">
											<ul>
												<li><span class="sale">new</span></li>
												<li><span class="discount-percentage">-${k.giamphantram}</span></li>
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
											<a>${k.sach.tensach}</a>
										</h4>
										<div class="product-price">
											<ul>
												<li class="old-price">${k.sach.gia}</li>
												<li>${k.sach.gia = k.sach.gia - k.sach.gia*k.giamphantram/100}
												</li>
											</ul>
										</div>
									</div>
									<div class="product-link">
										<div class="product-button">
											<c:if test="${k.sach.soluong>0}">
												<a href="khachhang/cart/add/${k.sach.idsach}"
													title="Thêm vào giỏ hàng"><i
													class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
											</c:if>
											<c:if test="${k.sach.soluong==0}">
												<a title="Add to cart"><i class="fa fa-shopping-cart"></i>Hàng
													đã hết</a>
											</c:if>
										</div>
										<div class="add-to-link">
											<ul>
												<li><a
													href="khachhang/details/${k.sach.tensach}/${k.sach.idsach}"
													title="Details"><i class="fa fa-external-link"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-end -->
							</c:forEach>
						</div>

					</div>
					<!-- new-book-area-start -->
				</div>

			</div>
		</div>
	</div>
	<!-- product-main-area-end -->
	<!-- footer-area-start -->
	<jsp:include page="footer.jsp"></jsp:include>
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

