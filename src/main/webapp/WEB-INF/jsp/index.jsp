
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
        
        	
        	
        	
			<!-- /#main-slider -->
        	
        	<div class="container">
                <div class="col-md-12">
                    <div id="main-slider">
                        <div class="item">
                            <img src="<c:url value="/resources/img/productImages/blue-pizza-bag.jpg" />" alt="" class="img-responsive" />
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="<c:url value="/resources/img/productImages/red-pizza-bag.jpg" />" alt="" />
                        </div>
                        <div class="item">
                            <img class="img-responsive" src="<c:url value="/resources/img/productImages/black-pizza-bag.jpg" />" alt="" />
                        </div>
                    </div>
                </div>
            </div>
            
             <!-- /#main-slider -->


			
			<!-- categories -->

            <div id="categories">

                <div class="container">
                    <div class="same-height-row">
                    
                    <c:forEach var="category" items="${categories}">
                    
                        <div class="col-sm-4">
                            <div class="box same-height clickable">
                            
                                <!-- <div class="icon"><i class="fa fa-heart"></i></div> -->

                                <h3><a href="<c:url value="/category/${category.id}" />">${category.name}</a></h3>
                                <p>${category.description}</p>
                            </div>
                        </div>

					</c:forEach>

                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.container -->

            </div>
            <!-- /#categories -->



        
            
        </div>

    	<%@ include file="/WEB-INF/footer.jsp" %>

    </div>

    <%@ include file="/WEB-INF/scripts.jsp" %>

</body>
</html>
