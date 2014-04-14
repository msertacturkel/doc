<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
  String base = (String) application.getAttribute("base"); 
  String imageUrl = (String) application.getAttribute("imageUrl"); 
%> 
<TABLE WIDTH="740" CELLPADDING="0" 
  HEIGHT="75" CELLSPACING="0" BORDER="0"> 
<TR> 
  <TD ALIGN="left" BGCOLOR="F6F6F6"> 
    <FONT FACE="Verdana" SIZE="4">Burnaby e-Mall</FONT> 
  </TD> 
  <TD ALIGN="RIGHT" BGCOLOR="F6F6F6"> 
    <A HREF="<%=base%>?action=displayShoppingCart"><IMG 
      BORDER="0" SRC="<%=(imageUrl + "cart.gif")%>"></A> 
    &nbsp;&nbsp;&nbsp; 
  </TD> 
</TR> 
</TABLE>

</body>
</html>