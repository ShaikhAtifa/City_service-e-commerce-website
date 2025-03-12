<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="db.DbConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>

<%

PreparedStatement ps = null; 
ResultSet rs = null; 
int done = 0; 
String sql = "";
DbConnect.connect();
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp"></jsp:include>
<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
       <!--  <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div> -->
        <!-- Spinner End -->
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
           <jsp:include page="header.jsp"></jsp:include>
            <div class="container-xxl py-5 bg-primary hero-header mb-5">
                <div class="container my-5 py-5 px-lg-5">
                    <div class="row g-5 py-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="text-white mb-4 animated zoomIn">Profile</h1>
                            <p class="text-white pb-3 animated zoomIn">
                            	
                            </p>
                            </div>
                        <div class="col-lg-6 text-center text-lg-start">
                            <!-- <img class="img-fluid" src="C:\Users\lanovo\Desktop\NEW\SEO Master Free Website Template - Free-CSS.com\seo-agency-website-template\img\m.png"alt=""> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->
        <!-- Full Screen Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content" style="background: rgba(29, 29, 39, 0.7);">
                    <div class="modal-header border-0">
                        <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <div class="input-group" style="max-width: 600px;">
                            <input type="text" class="form-control bg-transparent border-light p-3" placeholder="Type search keyword">
                            <button class="btn btn-light px-4"><i class="bi bi-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Full Screen Search End -->
        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="row g-5">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="section-title position-relative mb-4 pb-2">
                            <h6 class="position-relative text-primary ps-4">My Profile</h6>
                           
                        </div>
                        <div class="">
                        	 <%
       
        try{
        sql = "select *from user where userId=?";
        ps = DbConnect.getCon().prepareStatement(sql);
        ps.setString(1, session.getAttribute("userId").toString());
        rs = ps.executeQuery();
        while(rs.next()){
        %>
	       <form action="registerDB.jsp" method="post">
             <input type="hidden" name="type" id="type" value="updateRecord" class="form-control">
              <div class="form-group mt-2">
                <label>Full Name</label>
                <input type="text" value="<%=rs.getString("name") %>" name="name" id="name" placeholder="Enter Your Full Name" class="form-control">
              </div>
              
              <div class="row">
              <div class="col-md-6">
              <div class="form-group mt-2">
                <label>Mobile</label>
                <input type="number" value="<%=rs.getString("mobile") %>" name="mobile" id="mobile" placeholder="Enter Your Registered Mobile" class="form-control" >
              </div>
              </div>
              
              <div class="col-md-6">
              <div class="form-group mt-2">
                <label>City</label>
                <input type="text" value="<%=rs.getString("city") %>" name="city" id="city" placeholder="Enter Your City" class="form-control">
              </div>
              </div>
              </div>
              
              <div class="form-group mt-2">
                <label>Address</label>
                <textarea rows="" cols="" name="address" id="address" placeholder="Enter Your Full Address" class="form-control"><%=rs.getString("address") %></textarea>
              </div>
              
              <div class="form-group mt-2">
                <label>Gender</label><br>
                <select name="gender" class="form-control">
                   <option value="<%=rs.getString("gender") %>"><%=rs.getString("gender") %></option>
                   <option value="Male">Male</option>
                   <option value="Female">Female</option>
                </select>
              </div>
              
               <div class="form-group mt-2">
                <label>Email</label>
                <input type="email" value="<%=rs.getString("email") %>" name="email" id="email" placeholder="Enter Your Valid Email" class="form-control">
              </div>
              
            
              
              <input type="submit" value="Update Profile" class="mt-4 btn btn-primary">
              
           </form>
        <%}
        }catch(Exception e){
        	e.printStackTrace();
        }
        %>
                        </div>
                       
                       
                       
                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/about.jpg">
                    </div>
                </div>
                   <div class="row g-5 mt-5">
                     <div class="section-title position-relative mb-4 pb-2">
                            <h6 class="position-relative text-primary ps-4">Requested Services</h6>
                           
                        </div>
                        <div class="col-12">
                        	<div class="table-responsive">
                        		 <table class="table table-bordered">
						            <thead>
						            <tr>
						               <th>Sr.No</th>
						                <th>OrderDetail</th>
						               <th>Name / Mobile</th>
						               <th>call Date / Time</th>
						               <th>RequestDate</th>
						               <th>Status</th>
						            </tr>
						            </thead>
						            
						            <tbody>
						             <%     try{
			 	     sql = "select *from request where userId=? order by requestId desc";
			 	     ps = DbConnect.getCon().prepareStatement(sql);
			 	     ps.setString(1, session.getAttribute("userId").toString());
			 	     rs = ps.executeQuery();
			 	     int i = 1;
			 	     while(rs.next()){
			    %>  
			    <tr>
			       <td><%=i %></td>
			       <td><a title="click here" style="text-decoration: underline; color:blue;" href="viewModifyDetails.jsp?modifyId=<%=rs.getString("modifyId") %>"><%=rs.getString("modifyId") %></a></td>
			       <td><%=rs.getString("name") %><br>(<%=rs.getString("mobile") %>)</td>
			        <td><%=rs.getString("date") %><br>(<%=rs.getString("time") %>)</td>
			        <td><%=rs.getString("requestDate") %></td>
			        
			        <td>
			           <%if(rs.getString("requestStatus").equals("Pending")){ %>
			             <span class="text-danger"> <%=rs.getString("requestStatus") %> </span>
			           <%}else{ %>
			              <span class="text-success"> <%=rs.getString("requestStatus") %> </span>
			           <%} %>
			           </td>
			    </tr>
			    <%i++;}
              }catch(Exception e){
              	e.printStackTrace();
              }
			 	     %>
						            </tbody>
						            
						            </table>
						            
                        	</div>
                        </div>
                   </div>
            </div>
        </div>
        <!-- About End -->  
        <!-- Service Start -->
      

     
          <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
   <jsp:include page="src.jsp"></jsp:include>
</body>

</html>
<%DbConnect.close();%>