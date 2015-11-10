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
    <link href="<c:url value="resources/css/font-awesome.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/animate.min.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/owl.carousel.css" />" rel="stylesheet">
    <link href="<c:url value="resources/css/owl.theme.css" />" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="<c:url value="resources/css/style.default.css" />" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="<c:url value="resources/css/custom.css" />" rel="stylesheet">

    <script src="<c:url value="resources/js/respond.min.js" />"></script>

    <!--  <link rel="shortcut icon" href="favicon.png">		-->



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
                                    <a href="adminOrder#"> All orders</a>
                                </li>
                                <li>
                                    <a href="adminProduct#"> All products</a>
                                </li>
                                <li class="active">
                                    <a href="adminUser#"> All accounts</a>
                                </li>
                                <li>
                                    <a href="index.html"><i class="fa fa-sign-out"></i> Logout</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** Admin MENU END *** -->
                </div>

                <div class="col-md-9" id="customer-orders">
                    <div class="box">
                        <h1>All accounts</h1>
	                   <TABLE>
    					<TR> 
    					<td>
	                    </td>
	                    	<td>
	                    	<form action="/EstoreMVC/adminSearch/user">
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
                                        <th>User ID</th>
                                        <th>First name</th>
                                        <th>Last name</th>
                                        <th>Email</th>
                                        <th>Create date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${userAdmin}" var="user">
	                                    <tr>
	                                    	<% System.out.println(pageContext.findAttribute("user")); %>
	                         	            <th><c:out value="${user.getID()}"></c:out></th>
	                                        <td><c:out value="${user.getFirstName()}"></c:out></td>
	                                        <td><c:out value="${user.getLastName()}"></c:out></td>
	                                        <td><c:out value="${user.getEmail()}"></c:out></td>
	                                        <td><c:out value="${user.getDateTime()}"></c:out></td>
	                                        
	                                        
	                                        <td><a href="adminDelete/user/${user.getID()}" class="btn btn-primary btn-sm">Delete</a>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
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
