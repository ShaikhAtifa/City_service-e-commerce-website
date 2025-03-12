<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
        String type = request.getParameter("type");


	    
	    
	    PreparedStatement ps = null; ResultSet rs = null; int done = 0; String sql = "";
	    
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fastservice","root","root");
	    
	    if(type.equals("insertRecord")){
	    	
	    	String name = request.getParameter("name");
	        String mobile = request.getParameter("mobile");
	        String city = request.getParameter("city");
	        String address = request.getParameter("address");
	        String gender = request.getParameter("gender");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	    sql = "insert into user(name, mobile, city, address, gender, email, password) values(?, ?, ?, ?, ?, ?, ?)";
	    ps = con.prepareStatement(sql);
	    ps.setString(1, name);
	    ps.setString(2, mobile);
	    ps.setString(3, city);
	    ps.setString(4, address);
	    ps.setString(5, gender);
	    ps.setString(6, email);
	    ps.setString(7, password);
	    
	    done = ps.executeUpdate();
	    if(done>0){%>
	    	<script>
	    	   alert("Registration Successfully");
	    	   location.href="userLogin.jsp";
	    	</script>
	    	
	    <%}else{%>
	         <script>
	    	   alert("Failed Try Again !!");
	    	   location.href="userLogin.jsp";
	    	</script>
<%}
}else if(type.equals("selectRecord")){

	String mobile = request.getParameter("mobile");
	String password = request.getParameter("password");
	
	sql = "select * from user where mobile=? and password=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, mobile);
	ps.setString(2, password);
	rs = ps.executeQuery();
	if(rs.next()){
		session.setAttribute("userId", rs.getString("userId"));
		session.setAttribute("userName", rs.getString("name"));
		
		if(session.getAttribute("modifyId")==null){
			response.sendRedirect("index.jsp");
		}else{
			response.sendRedirect("viewModifyDetails.jsp?modifyId="+session.getAttribute("modifyId").toString());
		}
	}else{
%>
            <script>
	    	   alert("Failed Try Again !!");
	    	   location.href="userLogin.jsp";
	    	</script>

<%}}

else if(type.equals("updateRecord")){
	String name = request.getParameter("name");
    String mobile = request.getParameter("mobile");
    String city = request.getParameter("city");
    String address = request.getParameter("address");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    
    
	sql = "update user set name=?, mobile=?, city=?, address=?, gender=?, email=? where userId=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, mobile);
	ps.setString(3, city);
	ps.setString(4, address);
	ps.setString(5, gender);
	ps.setString(6, email);
	ps.setString(7, session.getAttribute("userId").toString());
	
	done = ps.executeUpdate();
    if(done>0){%>
    	<script>
    	   alert("Update Successfully");
    	   location.href="myprofile.jsp";
    	</script>
    	
    <%}else{%>
         <script>
    	   alert("Failed Try Again !!");
    	   location.href="myprofile.jsp";
    	</script>
<%}
	
}
%>