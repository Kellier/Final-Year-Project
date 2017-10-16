<%-- 
    Document   : validation
    Created on : 12-Oct-2017, 18:21:42
    Author     : corma
--%>

<%@ page import ="java.sql.*" %>
<%
    //try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        
        String sql = "Select * from login Where (username ='" + username +"' and password='" + password + "')";
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/fyp?" + "user=root&password=CompSci17");    
      
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
   //
   //catch(Exception e){       
   //    out.println("Something went wrong !! Please try again");       
   //}      
%>
