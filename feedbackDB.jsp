<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
 
 <%
 PreparedStatement ps = null; ResultSet rs = null; int done = 0; String sql = "";
 
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastservice","root","root");
 
	String name = request.getParameter("name");
    String email = request.getParameter("email");
	String mobile = request.getParameter("mobile");
    String message = request.getParameter("message");
    
    sql = "insert into feedback(name, mobile, email, message) values (?, ?, ?, ?)";
    ps = con.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, mobile);
    ps.setString(3, email);
    ps.setString(4, message);
    
 
    done = ps.executeUpdate();
    if(done>0){%>
	<script>
	   alert("Feedback Sended Successfully");
	   location.href="index.jsp";
	</script>
	
<%}else{%>
     <script>
	   alert("Failed Try Again !!");
	   location.href="index.jsp";
	</script>
<%}
 %>