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
                        <h1>Result </h1>
	                   <TABLE>
    					<TR> 
    					<td><a href="/EstoreMVC/adminProductForm" class="btn btn-primary btn-sm">Add</a>
	                    </td>
	                    	<td>
	                    	<form action="/EstoreMVC/adminSearch/product">
                                <input type="text" name="id" placeholder="Search by id ..." required style="background-color:rgba(50, 50, 50, 0.2);">
                                <input type="submit" class="btn btn-primary btn-sm" value="Search">
							</form>
							</td>
						</TR> 
						</TABLE>
							
							

						
                        <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p>

                        <hr>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Description</th>
                                        <th>Category</th>
                                        <th>image</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                    <tr>
	                                    	<% System.out.println(pageContext.findAttribute("product")); %>
	                                        <th><c:out value="${product.id}"></c:out></th>
	                                        <td><c:out value="${product.name}"></c:out></td>
	                                        <td><c:out value="${product.price}"></c:out></td>
	                                        <td><c:out value="${product.description}"></c:out></td>
	                                        
	                                        <c:set var="productCategory" value="${ productCategoryAdmin.getCategoryById(product.categoryId)}"/>
	                                        
	                                        <td><c:out value="${productCategory.name}"></c:out></td>
	                                        <td align=left valign=bottom>
					                        	<img src="<c:url value="/resources/img/productImages/${product.image}" />" alt="" style="width:100px; height:auto;">
					                        </td>
	                                        
	                                        <td><a href="/EstoreMVC/adminDelete/product/${product.id}" class="btn btn-primary btn-sm">Delete</a>
	                                        </td>
	                                        <td><a href="<c:url value="/adminProductEdit/${product.id}/"/> " class="btn btn-primary btn-sm">Edit</a>
	                                        </td>
	                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
