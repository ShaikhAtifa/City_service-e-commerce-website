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
                            <h1 class="text-white mb-4 animated zoomIn">Gallery</h1>
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
            <div class="text-center mb-3 mt-3">
            	<h1>Gallery</h1>
            </div>
                <div class="row g-5">
                    <%
				ps = null;
				rs = null;
				done = 0;
				sql = "";
				sql = "select *from gallery order by galleryId desc";
				ps = DbConnect.getCon().prepareStatement(sql);

				rs = ps.executeQuery();
				while (rs.next()) {
				%>
				<div class="col-md-4 col-sm-12 w3_ban1">
					<div class="card">
						<img class="card-img-top img-fluid"  src="../admin/<%=rs.getString("photo")%>" style="height: 200px"
							alt="<%=rs.getString("photo")%>"
							title="<%=rs.getString("title")%>">
						
					</div>
				</div>

				<%
				}
				%>
                </div>
            </div>
        </div>
        <!-- About End -->  
        <!-- Service Start -->
     

   
        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
   <jsp:include page="src.jsp"></jsp:include>
</body>

</html>
<%DbConnect.close();%>