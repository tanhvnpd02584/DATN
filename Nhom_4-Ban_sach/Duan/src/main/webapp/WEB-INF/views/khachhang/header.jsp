<%@page import="com.poly.entity.danhmuc"%>
<%@page import="com.poly.entity.loaisach"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
	<header>
		<!-- header-top-area-start -->
		<div class="header-top-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"></div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="account-area text-right">
							<ul>
								<c:set var="user" value="${hoten}"></c:set>
								<c:if test="${user==null}">
									<li><a href="khachhang/login"><button>Đăng
												nhập</button></a></li>
									<li><a href="khachhang/register">
											<button>Đăng ký</button>
									</a></li>
								</c:if>
								<c:if test="${user!=null}">
									<c:forEach var="b" items="${user}">
										<a href="khachhang/profile"><button> ${b.hoten} </button></a> |
											<a href="khachhang/logout"><button>Đăng xuất</button></a>
									</c:forEach>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- header-top-area-end -->
		<!-- header-mid-area-start -->
		<div class="header-mid-area ptb-40">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-5 col-xs-12">
						<div class="header-search">
							<form action="khachhang/search" method="post">
								<input type="text" placeholder="Tìm kiếm theo tên sách..."
									name="ten" /> <a> <i class="fa fa-search"></i>
								</a>
							</form>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
						<div class="logo-area text-center logo-xs-mrg"></div>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="my-cart">
							<ul>
								<li><a href="khachhang/cart"><i
										class="fa fa-shopping-cart"></i>Giỏ hàng</a> <span>${sessionScope['scopedTarget.cartService'].count}</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- header-mid-area-end -->
		<!-- main-menu-area-start -->
		<div class="main-menu-area hidden-sm hidden-xs sticky-header-1"
			id="header-sticky">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="menu-area">
							<nav>
								<ul style="padding-left: 200px">
									<li class="active"><a href="khachhang/index">Trang chủ</a></li>
									<li><a>Thể loại<i class="fa fa-angle-down"></i></a>
										<div class="mega-menu">
											<c:forEach var="r" items="${d}">
												<span> <a href="khachhang/shop/${r.iddanhmuc}"
													class="title">${r.tendanhmuc}</a> <c:forEach var="l"
														items="${r.loaisach}" begin="0" end="3">
														<a
															href="khachhang/last/${l.danhmuc.tendanhmuc}/${l.tenloai }/${l.idloai }/0">${l.tenloai }</a>
													</c:forEach> <a href="khachhang/shop/${r.iddanhmuc}">Xem thêm...</a>
												</span>
											</c:forEach>
										</div>
									<li><a>${d[4].tendanhmuc}<i class="fa fa-angle-down"></i></a>
										<div class="sub-menu sub-menu-2">
											<ul>
												<c:forEach var="dm" items="${d[4].loaisach}">
													<li><a
														href="khachhang/last/${d[4].tendanhmuc}/${dm.tenloai }/${dm.idloai }/0">${dm.tenloai }</a></li>
												</c:forEach>
											</ul>
										</div></li>
									<li><a href="khachhang/sale-off">khuyến mãi</a></li>
									<c:if test="${user!=null}">
										<li><a href="khachhang/order">Lịch sử mua hàng</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-menu-area-end -->
		<!-- mobile-menu-area-start -->

		<!-- mobile-menu-area-end -->
	</header>
</body>
</html>