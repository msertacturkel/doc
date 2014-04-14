package com.mysite;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: ControllerServlet
 *
 */
 public class ControllerServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
	 /**Initialize global variables*/ 
	  public void init(ServletConfig config) throws ServletException {

	    System.out.println("initializing controller servlet."); 

	    ServletContext context = config.getServletContext(); 
	    context.setAttribute("base", config.getInitParameter("base")); 
	    context.setAttribute("imageUrl", config.getInitParameter("imageUrl")); 

	    // instantiating the DbBean 
	    DbBean dbBean = new DbBean(); 
	    // initialize the DbBean's fields 
	    dbBean.setDbUrl(config.getInitParameter("dbUrl")); 
	    dbBean.setDbUserName(config.getInitParameter("dbUserName")); 
	    dbBean.setDbPassword(config.getInitParameter("dbPassword")); 

	    // put the bean in the servlet context 
	    // the bean will be accessed from JSP pages 
	    context.setAttribute("dbBean", dbBean); 

	    try {
	      // loading the database JDBC driver 
	      Class.forName(config.getInitParameter("jdbcDriver")); 
	      System.out.println("surucu var");
	    }   
	    catch (ClassNotFoundException e) {
	      System.out.println(e.toString()); 
	    } 
	    super.init(config); 
	  } 


	  /**Process the HTTP Get request*/ 
	  public void doGet(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {
	    doPost(request, response); 
	  } 

	  /**Process the HTTP Post request*/ 
	  public void doPost(HttpServletRequest request, HttpServletResponse response) throws 
	ServletException, IOException {

	    String base = "/jsp/"; 
	    String url = base + "Default.jsp"; 
	    String action = request.getParameter("action"); 

	    if (action!=null) {
	      if (action.equals("search")) 
	        url = base + "SearchResults.jsp"; 
	      else if (action.equals("browseCatalog")) 
	        url = base + "BrowseCatalog.jsp"; 
	      else if (action.equals("productDetails")) 
	        url = base + "ProductDetails.jsp"; 
	      else if (action.equals("productDetails")) 
	        url = base + "ProductDetails.jsp"; 
	      else if (action.equals("addShoppingItem") || 
	        action.equals("updateShoppingItem") || 
	        action.equals("deleteShoppingItem") || 
	        action.equals("displayShoppingCart")) 
	        url = base + "ShoppingCart.jsp"; 
	      else if (action.equals("checkOut")) 
	        url = base + "CheckOut.jsp"; 
	      else if (action.equals("order")) 
	        url = base + "Order.jsp"; 
	    } 
	    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(url); 
	    requestDispatcher.forward(request, response); 

	  } 
  	    
}