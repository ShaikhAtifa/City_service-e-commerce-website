<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                    <h1 class="m-0"><i class="fa fa-search me-2"></i>Fast<span class="fs-5"> Service</span></h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                        <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="services.jsp" class="nav-item nav-link">Service</a>
                        
                        <%
                if(session.getAttribute("userId")!=null){
               			
               			%>
               			  <a href="myprofile.jsp" class="nav-item nav-link">My Profile</a>
					<% }%>
                      
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
<!--                     <butaton type="button" class="btn text-secondary ms-3" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fa fa-search"></i></butaton>
 -->                    
                    <%
                    if(session.getAttribute("userId")==null){
                    %> 
                    <a href="login.html" class="btn btn-secondary text-light rounded-pill py-2 px-4 ms-3">Login</a>
               			<%}
                if(session.getAttribute("userId")!=null){
               			
               			%>
               			  <a href="logout.jsp" class="btn btn-secondary text-light rounded-pill py-2 px-4 ms-3">Logout</a>
					<% }%>
                </div>
            </nav>
    