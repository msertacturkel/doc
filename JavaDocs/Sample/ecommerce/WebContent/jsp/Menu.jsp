<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*" %> 
<jsp:useBean id="dbBean" scope="application" class="com.mysite.DbBean"/> 
<% 
  String base = (String) application.getAttribute("base"); 
%> 
<TABLE CELLSPACING="0" CELLPADDING="5" WIDTH="150" BORDER="0"> 
<TR> 
  <TD BGCOLOR="F6F6F6"> 
    <FONT FACE="Verdana">Search</FONT> 
    <FORM> 
    <INPUT TYPE="HIDDEN" NAME="action" VALUE="search"> 
    <INPUT TYPE="TEXT" NAME="keyword" SIZE="10"> 
    <INPUT type="SUBMIT" VALUE="Go"> 
    </FORM> 
  </TD> 
</TR> 
<TR> 
  <TD BGCOLOR="F6F6F6"><FONT FACE="Verdana">Categories:</FONT></TD>   
</TR> 
<TR VALIGN="TOP"> 
  <TD BGCOLOR="F6F6F6"> 
<% 
  Hashtable categories = dbBean.getCategories(); 
  Enumeration categoryIds = categories.keys(); 
  while (categoryIds.hasMoreElements()) {
    Object categoryId = categoryIds.nextElement(); 
    out.println("<A HREF=" + base + "?action=browseCatalog&categoryId=" + 
      categoryId.toString() + ">" + 
      categories.get(categoryId) + 
      "</A><BR>"); 
  } 
%> 
  </TD> 
</TR> 
</TABLE>

</body>
</html>