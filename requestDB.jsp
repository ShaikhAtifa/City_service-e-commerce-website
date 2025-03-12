<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
 
 <%
 PreparedStatement ps = null; ResultSet rs = null; int done = 0; String sql = "";
 
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastservice","root","root");
 
	String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
	String date = request.getParameter("date");
    String time = request.getParameter("time");
    String modifyId = request.getParameter("modifyId");
    
    sql = "insert into request(name, mobile, date, time, requestDate, userId, requestStatus, modifyId) values (?, ?, ?, ?, CURDATE(), ?, 'Pending', ?)";
    ps = con.prepareStatement(sql);
    ps.setString(1, name);
    ps.setString(2, mobile);
    ps.setString(3, date);
    ps.setString(4, time);
    ps.setString(5, session.getAttribute("userId").toString());
    ps.setString(6, modifyId);
 
    done = ps.executeUpdate();
    if(done>0){%>
	<script>
	   alert("Request Sended Successfully");
	   location.href="index.jsp";
	</script>
	
<%}else{%>
     <script>
	   alert("Failed Try Again !!");
	   location.href="index.jsp";
	</script>
<%}
 %>