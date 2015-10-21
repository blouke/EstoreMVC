<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User details</title>
</head>
<body>
        <table border=1 cellspacing=0 cellpadding=0 >
    		
    		<%
    		Enumeration params = request.getParameterNames();
    		while (params.hasMoreElements())
    		{
    			String paramKey = (String) params.nextElement();
    		%>	
    			<tr>
    			<td>
    			<%= paramKey %>
    			</td>
    			<td>
    		<%	
    			String[] results = request.getParameterValues(paramKey);
    			for (int i=0; i < results.length; ++i)
    			{
    				out.print(results[i]);
    		%>		
    				<p>
    		<%		
    			}   // Closing the for loop
    		%>	
    			</td>
    			</tr>
    		<%
    		}   // Closing the while loop
    		%>	
    			
        </table>
    </body>
</html>