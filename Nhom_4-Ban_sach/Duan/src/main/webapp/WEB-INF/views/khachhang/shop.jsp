<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Trang sách</title>
<base href="${pageContext.servletContext.contextPath}/">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
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
<body class="shop">
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!-- header-area-start -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header-area-end -->
	<!-- shop-main-area-start -->
	<div class="shop-main-area mb-70">
		<div class="container">
			<div class="row">

				<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
					<c:if test="${am!=null}">
						<div class="shop-left">
							<div class="left-title mb-20">
								<h4>${am[0].danhmuc.tendanhmuc}</h4>
							</div>

							<div class="left-menu mb-30">
								<ul>
									<c:forEach var="tl" items="${am}">
										<li><a
											href="khachhang/last/${am[0].danhmuc.tendanhmuc}/${tl.tenloai}/${tl.idloai}">${tl.tenloai}</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="banner-area mb-30">
								<div class="banner-img-2">
									<a><img src="img/banner/31.jpg" alt="banner" /></a>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
					<div class="category-image mb-30">
						<a><img src="img/banner/32.jpg" alt="banner" /></a>
					</div>
					<div class="section-title-5 mb-30">
						<h2>Book</h2>
					</div>
					<!-- tab-area-start -->
					<div class="tab-content">
						<div class="tab-pane active" id="th">
							<c:if test="${kk!=null}">
								<div class="row">
									<c:forEach var="sp" items="${kk}">
										<div class="col-lg-3 col-md-4 col-sm-6">
											<!-- single-product-start -->
											<div class="product-wrapper mb-40">
												<div class="product-img">
													<img style="width: 200px; height: 250px;"
														src="/ne?image=${sp.anhsach}" alt="book" class="primary" />
													<div class="product-flag">
														<ul>
															<li><span class="sale">new</span></li>
															<c:forEach var="p" items="${sp.khuyenmai}">
																<c:if test="${p.trangthai == true }">
																	<li><span class="discount-percentage">${p.giamphantram}
																			%</span></li>
																	<li><span class="sale">Giá gốc: ${sp.gia}</span></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="product-details text-center">
													<h4>
														<a>${sp.tensach}</a>
													</h4>
													<div class="product-price">
														<c:if test="${sp.khuyenmai[0] != null}">
															<%
																int count = 0;
															%>
															<c:forEach var="p" items="${sp.khuyenmai}">
																<c:if test="${p.trangthai == true}">
																	<ul>
																		<%
																			count++;
																		%>
																		<li>${sp.gia-sp.gia*p.giamphantram/100}VND</li>
																	</ul>
																</c:if>
															</c:forEach>
															<%
																if (count == 0) {
															%>
															<ul>
																<li>${sp.gia}VNĐ</li>
															</ul>
															<%
																}
															%>
														</c:if>
														<c:if test="${sp.khuyenmai[0] == null}">
															<ul>
																<li>${sp.gia}VND</li>
															</ul>
														</c:if>
													</div>
												</div>
												<div class="product-link">
													<div class="product-button">
														<c:if test="${sp.soluong>0}">
															<a href="khachhang/cart/add/${sp.idsach}"
																title="Thêm vào giỏ hàng"><i
																class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
														</c:if>
														<c:if test="${sp.soluong==0}">
															<a title="Add to cart"><i class="fa fa-shopping-cart"></i>Hàng
																đã hết</a>
														</c:if>
													</div>
													<div class="add-to-link">
														<ul>
															<li><a
																href="khachhang/details/${sp.tensach}/${sp.idsach}"
																title="Details"><i class="fa fa-external-link"></i></a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:if>
							<c:if test="${kk==null}">
								<h1>Sách bạn tìm không tồn tại</h1>
							</c:if>
						</div>

					</div>
					<!-- tab-area-end -->
					<!-- pagination-area-start -->
					<c:if test="${am!=null}">
						<div class="pagination-area mt-50">
							<div class="list-page-2">
								<p>Items 1-9 of 11</p>
							</div>
							<div class="page-number">
								<c:if test="${kk[0].loaisach.idloai==am[0].idloai}">
									<ul>
										<li><a
											href="khachhang/shop/${am[0].danhmuc.iddanhmuc}/${am[0].tenloai}/${pageNo-1}">Trang
												trước</a></li>
										<li><a
											href="khachhang/shop/${am[0].danhmuc.iddanhmuc}/${am[0].tenloai}/${pageNo+1}">Trang
												sau</a></li>
									</ul>
								</c:if>
								<c:if test="${kk[0].loaisach.idloai != am[0].idloai}">
									<ul>
										<li><a
											href="khachhang/last/${am[0].danhmuc.tendanhmuc}/${kk[0].loaisach.tenloai}/${kk[0].loaisach.idloai}/${pageNo-1}">Trang
												trước</a></li>
										<li><a
											href="khachhang/last/${am[0].danhmuc.tendanhmuc}/${kk[0].loaisach.tenloai}/${kk[0].loaisach.idloai}/${pageNo+1}">Trang
												sau</a></li>
									</ul>
								</c:if>
							</div>
						</div>
					</c:if>
					<!-- pagination-area-end -->
				</div>
			</div>
		</div>
	</div>
	<!-- shop-main-area-end -->
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

