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
                                        <th>Product ID</th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Description</th>
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
	                                        <td><c:out value="${product.image}"></c:out></td>
	                                        
	                                    </tr>
                                  
                                </tbody>
                            </table>
                        </div>

</body>
</html>
