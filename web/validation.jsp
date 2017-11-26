<%-- 
    Document   : validation
    Created on : 12-Oct-2017, 18:21:42
    Author     : corma
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
        //Weak code derived from the SQL Injection tutorial at: https://free.codebashing.com/courses/java/lessons/sql_injection
        
        
        //This weak code is discussed in the Interim Report on page 19
        
        //String to hold the username of the user
        String username = request.getParameter("username"); 
        //String to hold the password of the user
        String password = request.getParameter("password");
        
        //Query to select the users with the entered username and password
        String sql = "Select * from login Where (username ='" + username +"' and password='" + password + "')";
       
        // MySQL database connection
        Class.forName("com.mysql.jdbc.Driver"); 
        //Address of my SQL database
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/fyp?" + "user=root&password=CompSci17");    
      
        //Statement to hold the query
        Statement stm = conn.createStatement();
        
        //Result set to hold and execute the query
        ResultSet rs = stm.executeQuery(sql);                        
        if(rs.next())           
           out.println("Valid login credentials");        
        else
           out.println("Invalid login credentials");            
    }
   catch(Exception e){       
       out.println("Something went wrong !! Please check Internet Connection");       
   }      
%>
