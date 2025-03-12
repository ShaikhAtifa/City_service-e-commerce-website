<%@page import="db.DbConnect"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
							<h1 class="text-white mb-4 animated zoomIn">Inquiry Page </h1>
							<p class="text-white pb-3 animated zoomIn"></p>
				
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
				<div class="modal-content"
					style="background: rgba(29, 29, 39, 0.7);">
					<div class="modal-header border-0">
						<button type="button" class="btn bg-white btn-close"
							data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div
						class="modal-body d-flex align-items-center justify-content-center">
						<div class="input-group" style="max-width: 600px;">
							<input type="text"
								class="form-control bg-transparent border-light p-3"
								placeholder="Type search keyword">
							<button class="btn btn-light px-4">
								<i class="bi bi-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Full Screen Search End -->
		<!-- About Start -->
		<!-- About End -->
		<!-- Service Start -->
		<div class="container-xxl py-5">
			<div class="container px-lg-5">
				<div
					class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp"
					data-wow-delay="0.1s">
					<h6 class="position-relative d-inline text-primary ps-4">Our
						Services</h6>
					<h2 class="mt-2">Best Service-Right Time-Right People</h2>
				</div>
				

					<%
					String modifyId = request.getParameter("modifyId");
					sql = "select md.*, sd.*, s.subcategoryName from modifydetails as md inner join shop as sd on md.shopId = sd.shopId inner join subcategory as s on md.subcategoryid = s.subcategoryid where md.modifyid=?";
					ps = DbConnect.getCon().prepareStatement(sql);
					ps.setString(1, modifyId);
					rs = ps.executeQuery();
					if (rs.next()) {
					%>
					<div class="row g-4">
					<div class="col-4 d-flex justify-content-center flex-column align-item-center">
						  <img src="../shop/<%=rs.getString("fimage") %>" style="height: 200px; width: 100%;" class="img-thumbnail"><br><br>
              			<img src="../shop/<%=rs.getString("simage") %>" style="height: 200px; width: 100%;" class="img-thumbnail">
       
					</div>


					<div class="col-lg-8 col-md-6 wow zoomIn p-2" data-wow-delay="0.1s">
						
						<div class=" p-3">
							 <h4 class="text-dark mb-4"><%=rs.getString("description") %>...</h4>
				             <h5>Category : <b class="text-primary"><%=rs.getString("subcategoryName") %></b></h5>
				             <h5>How Many Time for Repair : <b class="text-primary"><%=rs.getString("time") %></b></h5>
				</div>
						
						<div class="shadow mt-3 p-3 rounded">
						
							
							<h3 class=""> Send a request <i class="fab fa-telegram text-primary "></i></h3>
							<form action="requestDB.jsp" method="post">

								<input type="hidden" value="<%=rs.getString("modifyId")%>"
									name="modifyId" class="form-control mt-2">

								<div class="form-group mt-2">
									<input type="text" name="name" id="name" class="form-control"
										placeholder="Enter Your Full Name">
								</div>

								<div class="form-group mt-2">
									<input type="number" name="mobile" id="mobile"
										class="form-control" placeholder="Enter Your Contact">
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group mt-2">
											<label>When we can call You (Select Date)</label> <input
												type="date" name="date" id="date" class="form-control"
												placeholder="">
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-group mt-2">
											<label>When we can call You (Select Time)</label> <input
												type="time" name="time" id="time" class="form-control"
												placeholder="">
										</div>
									</div>
								</div>

								<%
								if (session.getAttribute("userId") == null) {
									session.setAttribute("modifyId", rs.getString("modifyId"));
								%>
								<a href="userLogin.jsp" class="">
								<button class="btn btn-primary mt-3" type="button">Call
									me back</button>
								</a>
								<%
								} else {
								%>
								<input type="submit" value="Call me back"
									class="btn btn-primary mt-3 "
									onclick="return validation()">
								<%
								}
								%>
							</form>

						</div>
					</div>
					</div>
					<div class="row g-4 mt-5">
					<div class="col-12">
					
					<h1 class="h1 text-center text-primary"> <i class="fas fa-store"></i> Shop Details</h1>
					</div>
						<div class="col-md-6">
             <img src="../admin/<%=rs.getString("shopImage") %>" style="height: 300px; width: 100%;" class="img-thumbnail"><br><br>
          </div>
          
           <div class="col-md-6">
            <p>Shop Name : <b><%=rs.getString("shopName") %></b></p>
            <p>Shop Owner Name : <%=rs.getString("shopOwnerName") %></p>
             <p>Contact : <b><%=rs.getString("shopContactNumber") %> / <%=rs.getString("shopOwnerNumber") %></b></p>
             <p>Shop Email : <%=rs.getString("shopEmail") %></p>
             <p>Shop City : <%=rs.getString("shopCity") %></p>
             <p>Shop Address : <%=rs.getString("shopAddress") %></p>
             <p>Shop Open / Close Time : <%=rs.getString("shopTime") %></p>
             <p>Shop Close Day : <%=rs.getString("shopCloseDay") %></p>
          </div>
          </div>
          <div class="row">
          <div class="col-md-4">
            <%=rs.getString("shopLocation") %>       
          </div>
				
					</div>

					<%
					}
					%>
</div>
</div>

					
		<!-- Service End -->


		<!-- Testimonial Start -->
		
		<!-- Testimonial End -->
		<!-- Team Start -->
		
		<!-- Team End -->
		<!-- Footer Start -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- Footer End -->
		<!-- Back to Top -->
		<a href="#"
			class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i
			class="bi bi-arrow-up"></i></a>
	</div>

	<!-- JavaScript Libraries -->
	<jsp:include page="src.jsp"></jsp:include>
</body>

</html>
<%DbConnect.close();%>