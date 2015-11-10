<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="robots" content="all,follow">
<meta name="googlebot" content="index,follow,snippet,archive">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Obaju e-commerce template">
<meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
<meta name="keywords" content="">

<title>Obaju : e-commerce template</title>

<meta name="keywords" content="">

<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100'
	rel='stylesheet' type='text/css'>

<!-- styles -->
<link href="<c:url value="/resources/css/font-awesome.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/animate.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/owl.carousel.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/owl.theme.css" />"
	rel="stylesheet">

<!-- theme stylesheet -->
<link href="<c:url value="/resources/css/style.default.css" />"
	rel="stylesheet" id="theme-stylesheet">

<!-- your stylesheet with modifications -->
<link href="<c:url value="/resources/css/custom.css" />"
	rel="stylesheet">

<script src="<c:url value="/resources/js/respond.min.js" />"></script>

</head>

<body>

	<%@ include file="/WEB-INF/header.jsp"%>

	<div id="all">

		<div id="content">
			<div id="billing-form">

				<div class="box">
					<div class="container">
						<div class="col-md-12">
							<h2>Billing and Shipping Information</h2>
						</div>
					</div>
				</div>

				<form class="form-horizontal" action="/EstoreMVC/billing" role="form" method="POST">
					
					<div class="form-group">
						<label class="control-label col-sm-2" for="street">Street Address:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="street" placeholder="Enter Street">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="city">City:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="city" placeholder="Enter City">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="state">State:</label>
						<div class="col-sm-10">
							<select class="form-control" name="state" name="state">
								<option value="">Select State</option>
								<option value="AK">Alaska</option>
								<option value="AL">Alabama</option>
								<option value="AR">Arkansas</option>
								<option value="AZ">Arizona</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DC">District of Columbia</option>
								<option value="DE">Delaware</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="IA">Iowa</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="MA">Massachusetts</option>
								<option value="MD">Maryland</option>
								<option value="ME">Maine</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MO">Missouri</option>
								<option value="MS">Mississippi</option>
								<option value="MT">Montana</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="NE">Nebraska</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NV">Nevada</option>
								<option value="NY">New York</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="PR">Puerto Rico</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VA">Virginia</option>
								<option value="VT">Vermont</option>
								<option value="WA">Washington</option>
								<option value="WI">Wisconsin</option>
								<option value="WV">West Virginia</option>
								<option value="WY">Wyoming</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="zip">Zip Code:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="zip"
								placeholder="Enter Zip Code">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="phone">Phone Number:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="phone"
								placeholder="Enter Phone Number">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<%@ include file="/WEB-INF/footer.jsp"%>

	</div>

	<%@ include file="/WEB-INF/scripts.jsp"%>

</body>
</html>
