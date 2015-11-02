<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                        <h1>Result</h1>

                        <hr>

                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>amount</th>
                                        <th>customerId</th>
                                        <th>Date</th>
                                        <th>paymentId</th>
                                    </tr>
                                </thead>
                                <tbody>

	                                    <tr>
	                                    	<% System.out.println(pageContext.findAttribute("order")); %>
	                                        <th><c:out value="${order.id}"></c:out></th>
	                                        <td><c:out value="${order.amount}"></c:out></td>
	                                        <td><c:out value="${order.customerId}"></c:out></td>
	                                        <td><c:out value="${order.orderDate}"></c:out></td>
	                                        <td><c:out value="${order.paymentId}"></c:out></td>

	                                    </tr>
                                 
                                </tbody>
                            </table>
                        </div>

</body>
</html>
