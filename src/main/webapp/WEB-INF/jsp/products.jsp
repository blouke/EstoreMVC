
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
            <div id="product-list">
                <div class="box">
                    <div class="container">
                        <div class="col-md-12">
                            <h2>${categoryName}</h2>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="container">
                    	<nav class="paging">
						  <ul class="pagination" data-category="${catId}" data-baseurl="${pageContext.request.contextPath}" data-total="${pagedProducts.pageCount}">
						    <li class="previous disabled">
						      <a href="javascript:void(0)" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <c:forEach begin="1" end="${pagedProducts.pageCount}" varStatus="loop">
    							<li class="getPage" data-page="${loop.index}"><a href="javascript:void(0)">${loop.index}</a></li>
							</c:forEach>
						    <li class="next ${pagedProducts.pageCount > 1 ? '' : 'disabled'}">
						      <a href="javascript:void(0)" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
						</nav>
                		<div class="row productListing">
                			<%@ include file="/WEB-INF/jsp/productListPartial.jsp" %>
						</div>
					</div>
				</div>
            </div>
        </div>

    	<%@ include file="/WEB-INF/footer.jsp" %>

    </div>

    <%@ include file="/WEB-INF/scripts.jsp" %>

</body>
</html>
