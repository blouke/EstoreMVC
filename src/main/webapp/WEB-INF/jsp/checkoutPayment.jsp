
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
	
	<sec:csrfMetaTags/>
	
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
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>

    <link rel="shortcut icon" href="favicon.png">



</head>

<body>
    
    <%@ include file="/WEB-INF/header.jsp"%>    
    
    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>Checkout - Payment method</li>
                    </ul>
                </div>
                
                <div class="col-md-9" id="checkout">

                    <div class="box">
                        <form method="post" action="/cart/checkoutReview" id="payment-form">
                        	
                        	<!-- spring csrf token -->
                        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                        
                            <h1>Checkout - Payment</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li><a href="<c:url value="/cart/checkoutAddress" />"><i class="fa fa-map-marker"></i><br>Address</a>
                                </li>
                                <li><a href="<c:url value="/cart/checkoutDelivery" />"><i class="fa fa-truck"></i><br>Delivery Method</a>
                                </li>
                                <li class="active"><a href="#"><i class="fa fa-money"></i><br>Payment Method</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>Order Review</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="name">Name on Card</label>
                                            <input type="text" class="form-control" id="name">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label for="number">Card Number</label>
                                            <input type="text" class="form-control" id="number" size="20" data-stripe="number" />
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                                <div class="row">
                                    
                                    <div class="col-sm-6 col-md-3">
                                        <div class="form-group">
                                            <label for="cvc">Security Code (CVV2)</label>
                                            <input type="text" class="form-control" id="cvc" size="4" data-stripe="cvc" />
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6 col-md-3">
										<div class="form-group">
                                          	<label>Expiration (MM/YYYY)</label>
                                          	<input type="text" class="form-control" id="month" size="2" data-stripe="exp-month" />
                                          	<input type="text" class="form-control" id="year" size="4" data-stripe="exp-year" />
                                      </div>
                                    </div>
                                                                        
                                    
                                </div>
                                <!-- /.row -->

                                
                            </div>
                                                                                 
                            <div class="box-footer">
                                <div class="pull-left">
                                
                                    <a href="<c:url value="/cart/checkoutDelivery" />" class="btn btn-default"><i class="fa fa-chevron-left"></i>Back to Shipping method</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">Continue to Order review<i class="fa fa-chevron-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col-md-9 -->

                <div class="col-md-3">

                    <div class="box" id="order-summary">
                        <div class="box-header">
                            <h3>Order summary</h3>
                        </div>
                        <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>

                        <div class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Order subtotal</td>
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${cart.total}" /></th>
                                    </tr>
                                    <tr>
                                        <td>Shipping and handling</td>
                                        <c:choose>
                                        	<c:when test="${totalItems>0}">
                                        		<c:set var="shippingAmount" value="${10}" />
                                        	</c:when>
                                        	<c:otherwise>
                                        		<c:set var="shippingAmount" value="${0}" />		
                                        	</c:otherwise>
                                        </c:choose>                                        
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${shippingAmount}" /></th>
                                    </tr>
                                    <tr>
                                        <td>Tax</td>
                                        <c:set var="taxAmount" value="${cart.total*0.0625}" />
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${taxAmount}" /></th>
                                    </tr>
                                    <tr class="total">
                                        <td>Total</td>
                                        <c:set var="totalAmount" value="${cart.total+taxAmount+shippingAmount}" />
                                        <th><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="2" value="${totalAmount}" /></th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
                <!-- /.col-md-3 -->

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


 <!-- *** FOOTER *** -->

		<%@ include file="/WEB-INF/footer.jsp" %>

        <!-- *** FOOTER END *** -->

    </div>
 
    <!-- *** SCRIPTS TO INCLUDE ***-->

 	<%@ include file="/WEB-INF/scripts.jsp" %>


</body>

</html>