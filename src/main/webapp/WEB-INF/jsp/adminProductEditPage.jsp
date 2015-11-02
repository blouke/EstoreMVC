<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                        <h1>Edit Product</h1>
                        <hr>

						<form action="/EstoreMVC/adminEditSuccess" method="post">
						  <p>
						  	id : <input type="text" name="id" value=${id } readonly style="background-color:rgba(50, 50, 50, 0.2);"/>
						  </p>
						  <p>
						  	Name : <input type="text" name="name" />
						  </p>
						  <p>
						  	Price : <input type="text" name="price" />
						  </p>
						  <p>
						  	description : <input type="text" name="description" />
						  </p>
						  <p>
						  	categoryId : <input type="text" name="categoryId" />
						  </p>
						  <p>
						  	image : <input type="text" name="image" />
						  </p>
						  <input type="submit" value="Submit" />
						</form>

</body>
</html>
