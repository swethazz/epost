<%-- 
    Document   : signupcheck
    Created on : 3 Feb, 2019, 8:05:42 PM
    Author     : Narmada Murali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    String action=request.getParameter("action");
    if(action.equals("signup"))
    {
        String customername=request.getParameter("customername");
        String useremail=request.getParameter("useremail");
        String address=request.getParameter("password");
        
        int mobilenumber=Integer.parseInt(request.getParameter("mobilenumber"));
        int password=Integer.parseInt(request.getParameter("password"));
        try
        {
             Class.forName("com.mysql.jdbc.Driver");    
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/epost","root","");
             PreparedStatement stmt=con.prepareStatement("insert into customer values(?,?,?,?,?,?)");
             stmt.setString(1,null);
             stmt.setString(2,customername);
             stmt.setInt(3,mobilenumber);
             stmt.setString(4,address);
             stmt.setString(5,useremail);
             stmt.setInt(6,password);
             int flag=stmt.executeUpdate();
             System.out.println(flag+"record inserted");
             if(flag>0)
             {
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('welcome');");
                 out.println("location='after_login.jsp';");
                 out.println("</script>"); 
                 response.sendRedirect("after_login.jsp");
             }
             con.close();
        }
       
        catch(Exception e)
        {
            out.println(e);
        }
    }
   
%>
