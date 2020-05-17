<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Chi tiết hóa đơn</title>
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
		<h2>Chi tiết đơn hàng</h2>
	</div>
	<c:forEach var="ap" items="${don}">
		<div
			style="padding-left: 100px; height: 300px; border: 1px solid black;">
			<div>
				<div class="row">
					<div class="col-md-2">
						<p>Số chi tiết hóa đơn:</p>
						<br> <span>${ap.donhang.iddonhang}</span>
					</div>
					<div class="col-md-2">
						<p>Hình sách:</p>
						<br> <span><img style="height: 200px" alt=""
							src="/ne?image=${ap.sach.anhsach}"> </span>
					</div>
					<div class="col-md-2">
						<p>Tên sách:</p>
						<br> <span>${ap.sach.tensach}</span>
					</div>
					<div class="col-md-2">
						<p>Đơn giá:</p>
						<br> <span>${ap.dongia}</span>
					</div>
					<div class="col-md-2">
						<p>Số lượng:</p>
						<br> <span>${ap.soluong}</span>
					</div>

					<div class="col-md-2">
						<p>Thành tiền:</p>
						<br> <span>${ap.thanhtien}</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>