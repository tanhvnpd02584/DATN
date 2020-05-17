<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Thông tin liên hệ shop</title>
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
<body class="contact">
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header-area-end -->
	<!-- googleMap-area-start -->
	<div class="map-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div id="googleMap"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- googleMap-end -->
	<!-- contact-area-start -->
	<div class="contact-area mb-70">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="contact-info">
						<h3>Contact info</h3>
						<ul>
							<li><i class="fa fa-map-marker"></i> <span>Address: </span>
								Trụ sở: Sư Vạn Hạnh Quận 10</li>
							<li><i class="fa fa-envelope"></i> <span>Phone: </span> Liên
								hệ: (+84)-12345679</li>
							<li><i class="fa fa-mobile"></i> <span>Email: </span> <a>trong900@gmail.com</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- contact-area-end -->
	<!-- footer-area-start -->
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer-area-end -->


	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- ajax-mail js -->
	<script src="js/ajax-mail.js"></script>
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
	<!-- googleapis -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMlLa3XrAmtemtf97Z2YpXwPLlimRK7Pk"></script>
	<script>
		/* Google Map js */
		function initialize() {
			var mapOptions = {
				zoom : 15,
				scrollwheel : false,
				center : new google.maps.LatLng(23.810332, 90.412518)
			};

			var map = new google.maps.Map(document.getElementById('googleMap'),
					mapOptions);

			var marker = new google.maps.Marker({
				position : map.getCenter(),
				animation : google.maps.Animation.BOUNCE,
				icon : 'img/map.png',
				map : map
			});

		}
		google.maps.event.addDomListener(window, 'load', initialize);
	</script>
</body>
</html>

