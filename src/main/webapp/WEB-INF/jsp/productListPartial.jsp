<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:forEach var="product" items="${pagedProducts.pageList}">
	<div class="col-md-4 product-small">
		<h4><a href="<c:url value="/product/${product.id}" />">${product.name}</a></h4>
		<a href="<c:url value="/product/${product.id}" />"><img src="<c:url value="/resources/img/productImages/${product.image}" />" /></a>
		<p>
			<fmt:setLocale value="en_US"/>
			<h4><fmt:formatNumber value="${product.price}" type="currency"/></h4>
		</p>
		<a href="<c:url value="/cart/add/${product.id}" />" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add to cart</a>
	</div>
</c:forEach>