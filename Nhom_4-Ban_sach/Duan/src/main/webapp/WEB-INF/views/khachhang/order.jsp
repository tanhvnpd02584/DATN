<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Hóa đơn</title>
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
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div style="text-align: center;">
		<h2>Lịch sử mua hàng của bạn</h2>
	</div>
	<c:forEach var="ap" items="${don}">
		<div
			style="padding-left: 100px; height: 150px; border: 1px solid black;">
			<div>
				<div class="row">
					<div class="col-md-2">
						<p>Số hóa đơn</p>
						<br> <span>${ap.iddonhang}</span>
					</div>
					<div class="col-md-2">
						<p>Người nhận:</p>
						<br> <span>${ap.khachhang.hoten}</span>
					</div>
					<div class="col-md-2">
						<p>Địa chỉ nhận hàng:</p>
						<br> <span>${ap.diachi}</span>
					</div>
					<div class="col-md-2">
						<p>Ngày đặt hàng:</p>
						<br> <span>${ap.ngaydat}</span>
					</div>
					<div class="col-md-2">
						<p>Tổng tiền:</p>
						<br> <span>${ap.tong}</span>
					</div>
					<div class="col-md-2">
						<c:if test="${ap.tinhtrangdh==false}">
							<p>Tình trạng đơn hàng:</p>
							<br>
							<span>Đang vận chuyển</span>
							<button>
								<a href="khachhang/order/cancel/${ap.iddonhang}"> Hủy </a>
							</button>
							<br>
							<a href="khachhang/order/detail/${ap.iddonhang}"> Chi tiết
								đơn hàng </a>
						</c:if>
						<c:if test="${ap.tinhtrangdh==true}">
							<p style="color: gray">Đã giao</p>
							<br>
							<a href="khachhang/order/detail/${ap.iddonhang}"> chi tiết
								đơn hàng </a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>