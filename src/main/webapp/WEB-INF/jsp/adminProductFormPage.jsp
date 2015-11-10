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
			<div class="container">
			
			     <div class="col-md-3">
                    <!-- *** Admin MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">Admin section</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li >
                                    <a href="/EstoreMVC/adminOrder#"> All orders</a>
                                </li>
                                <li class="active">
                                    <a href="/EstoreMVC/adminProduct#"> All products</a>
                                </li>
                                <li >
                                    <a href="/EstoreMVC/adminUser#"> All accounts</a>
                                </li>
                                <li>
                                    <a href="/EstoreMVC/index.html"><i class="fa fa-sign-out"></i> Logout</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** Admin MENU END *** -->
                </div>
				<div class="col-md-9" id="customer-orders">
				<div class="box">
					<form action="/EstoreMVC/adminAddSuccess" method="post">
					<h1>Add Product</h1>
					<div class="content">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									Name <input type="text"  class="form-control" name="name" value="computer"/>
								</div>
							</div>
						</div>
						<!-- /.row -->

						<div class="row">
							<div class="col-sm-6 col-md-3">
								<div class="form-group">
									Price <input type="text"
										class="form-control" name="price" value="1000">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									description <input type="text"
										class="form-control" name="description" value="great">
								</div>
							</div>
						</div>
						<!-- /.row -->

						<div class="row">
							<div class="col-sm-6 col-md-3">
								<div class="form-group">
									categoryId <input type="text"
										class="form-control" name="categoryId" value="1">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									image <input type="text"
										class="form-control" name="image" value="red-dwarf-mug.jpg">
								</div>
							</div>				

						</div>
						<!-- /.row -->
					</div>


					<div class="box-footer">
						<div class="pull-left">
							<a href="/EstoreMVC/adminProduct" class="btn btn-default"><i
								class="fa fa-chevron-left"></i>Back to admin</a>
						</div>
						<div class="pull-right">
							<button type="submit" class="btn btn-primary">
								Add<i class="fa fa-chevron-right"></i>
							</button>
						</div>
					</div>
					</form>
				</div>
				<!-- /.box -->
				
				</div>
				
			</div>
			<!-- /.container -->


		</div>
		<!-- /#content -->

	</div>





	<%@ include file="/WEB-INF/footer.jsp"%>
	<%@ include file="/WEB-INF/scripts.jsp"%>

</body>
</html>
