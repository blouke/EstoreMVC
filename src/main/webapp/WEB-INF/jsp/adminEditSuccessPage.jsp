<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>
        Obaju : e-commerce template
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="<c:url value="/resources/css/font-awesome.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/animate.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.carousel.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/owl.theme.css" />" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="<c:url value="/resources/css/style.default.css" />" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="<c:url value="/resources/css/custom.css" />" rel="stylesheet">

    <script src="<c:url value="/resources/js/respond.min.js" />"></script>

</head>
<body>
		<%@ include file="/WEB-INF/header.jsp" %>		

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
                        <h1>Editing Succeeded</h1>								

						
                        <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                        <hr>

						id : ${product1.id} <br>
						name : ${product1.name} <br>
						price: ${product1.price} <br>
						description : ${product1.description} <br>
						categoryId: ${product1.categoryId} <br>
						image :${product1.image}


					<div class="box-footer">
						<div class="pull-left">
							<a href="/EstoreMVC/adminProduct" class="btn btn-default"><i
								class="fa fa-chevron-left"></i>Back to admin</a>
						</div>
					</div>

                    </div>
                    <!-- /.box -->
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->

		<%@ include file="/WEB-INF/footer.jsp" %>
		
	</div>
	<%@ include file="/WEB-INF/scripts.jsp" %>

</body>
</html>
