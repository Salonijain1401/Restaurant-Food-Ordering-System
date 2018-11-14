<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.Date"%>
<%@page import="com.rajan.dao.UserService"%>
<%@page import="com.rajan.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rajan.constants.GlobalConstants"%>
<%
	ArrayList<Category> cats = new UserService().getAllCategorys();
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setHeader ("Expires", "0"); 
%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Menu Categories</title>
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="assets/mycss/navbar.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="sidenav">
    <a href="UserHome.jsp"> <%=new Date() %></a>
    <hr color="white" />
	<a href="ViewCategory.jsp"> Place Order </a>
	<a href="OrderStatus.jsp"> View Order Status </a>
	<a href="ViewBill.jsp"> View Bill </a>
	<a href="LoginPage.jsp"> Log Out </a>
</div>

<div class="main">
  <div class="container">
    <div class="row">
      <div class="col-12">  
                
        <br/>
        <h1>Menu Categories</h1>  
        <br/>      
        <%
		    if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
		        out.write("<h3>" + GlobalConstants.MESSAGE + " </h3>");
			    GlobalConstants.MESSAGE = "";
		    }
		%>
		  <table class="table table-striped table-hover">
			  <tr>
				<th>Sr No</th>
				<th>Name</th>
			  </tr>
		<% 
			if(cats!=null && cats.size()!=0){
				for(int i=0; i<cats.size(); i++){
					Category cat = cats.get(i);
		%>
						<tr>
						  <td><%= i+1  %></td>
						  <td><a href="ViewItems.jsp?catId=<%=cat.getId()%>"><%= cat.getCategoryName() %></a></td>
						</tr>
		<%
				}
			} 
		%>
			</table>    			
      </div>
    </div>
  </div>
</div>	
</body>
</html>