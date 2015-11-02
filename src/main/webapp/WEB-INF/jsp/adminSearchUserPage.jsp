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
                                        <th>User ID</th>
                                        <th>First name</th>
                                        <th>Last name</th>
                                        <th>Email</th>
                                        <th>Create date</th>
                                    </tr>
                                </thead>
                                <tbody>
                              
	                                    <tr>
	                                    	
	                                        <th><c:out value="${user.getID()}"></c:out></th>
	                                        <td><c:out value="${user.getFirstName()}"></c:out></td>
	                                        <td><c:out value="${user.getLastName()}"></c:out></td>
	                                        <td><c:out value="${user.getEmail()}"></c:out></td>
	                                        <td><c:out value="${user.getDateTime()}"></c:out></td>
	                                        
	                                    </tr>
                                  
                                </tbody>
                            </table>
                        </div>

</body>
</html>
