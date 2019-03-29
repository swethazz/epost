<%-- 
    Document   : check
    Created on : 3 Feb, 2019, 4:32:43 PM
    Author     : Narmada Murali
--%>

<%@page import="java.sql.*"%>
<%
    String action=request.getParameter("action");
    if(action.equals("signin"))
    {
        String useremail=request.getParameter("useremail");
        String pwd=request.getParameter("password");
        try
        {
             Class.forName("com.mysql.jdbc.Driver");    
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/epost","root","");
             Statement stmt=con.createStatement();
             ResultSet rs=stmt.executeQuery("select * from customer where useremail='"+useremail+"'and password='"+pwd+"'");
             if(rs.next())
             {
                // response.sendRedirect("success.jsp");
                  out.println("<script type=\"text/javascript\">");
                 out.println("alert('welcome');");
                 out.println("location='after_login.jsp';");
                 out.println("</script>");  
             }
             else
             {
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('username and password does not match');");
                 out.println("location='index.jsp';");
                 out.println("</script>");       
             }
        }
       
        catch(Exception e)
        {
            out.println(e);
        }
    }
   
%>
    


