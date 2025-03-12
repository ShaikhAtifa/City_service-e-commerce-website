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
                            <h1 class="text-white mb-4 animated zoomIn">Contact</h1>
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
      <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <!-- <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                            <h6 class="position-relative d-inline text-primary ps-4">Contact Us</h6>
                            <h2 class="mt-2">Contact For Any Query</h2>
                        </div> -->
                        <div class="wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                            <form action="feedbackDB.jsp" method="post">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Your Name" required="">
                                            <label for="name">Your Name</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="email" placeholder="Your Email" required="">
                                            <label for="email">Your Email</label>
                                        </div>
                                    </div>
                                     <div class="col-md-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="mobile" placeholder="Enter Mobile" required="">
                                            <label for="name">Your Contact No.</label>
                                        </div>
                                    </div>
                                  
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Leave a message here" id="message" style="height: 150px" required=""></textarea>
                                            <label for="message">Message</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit" onclick="return validation()">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer Start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Footer End -->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top pt-2"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
   <jsp:include page="src.jsp"></jsp:include>
    <script type="text/javascript">
    function validation(){
    	var name = $("#name").val();
    	var email = $("#email").val();
    	var mobile = $("#mobile").val();
    	var comment = $("#comment").val();
    	
    	
    	if(name==""){
    		alert("Enter Name");
    		return false;
    	}
    	else if(email==""){
    		alert("Enter Email");
    		return false;
    	}
    	else if(mobile.length!=10){
    		alert("Enter 10 digit mobile number");
    		return false;
    	}
    	else if(comment==""){
    		alert("Enter Comment");
    		return false;
    	}
    	else{
    		return true;
    	}
    }
 </script>
</body>

</html>
<%DbConnect.close();%>