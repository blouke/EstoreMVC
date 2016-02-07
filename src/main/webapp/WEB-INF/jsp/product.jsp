
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
        Delivery Bags Factory
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

                <div class="col-md-9">

                    <div class="row" id="productMain">
                        <div class="col-sm-6">
                            <div id="mainImage">
                                <img src="<c:url value="/resources/img/productImages/${product.image}" />" alt="" class="img-responsive">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="box">
                                <h1 class="text-center">${product.name}</h1>
                                <p class="goToDescription"><a href="#details" class="scroll-to">Scroll to product details</a>
                                </p>
                                <p class="price">
                                	<fmt:setLocale value="en_US"/>
									<fmt:formatNumber value="${product.price}" type="currency"/>
                                </p>

                                <p class="text-center buttons">
                                    <a href="<c:url value="/cart/add/${product.id}" />" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                </p>


                            </div>

                            
                        </div>

                    </div>


                    <div class="box" id="details">
                        <p>
                            <h4>Product details</h4>
                            ${product.description}
            			</p>
                    </div>

                </div>
                <!-- /.col-md-9 -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
       

    	<%@ include file="/WEB-INF/footer.jsp" %>

    </div>

    <%@ include file="/WEB-INF/scripts.jsp" %>

</body>
</html>
