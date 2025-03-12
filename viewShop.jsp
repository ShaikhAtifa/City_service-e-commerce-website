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
                            <h1 class="text-white mb-4 animated zoomIn">Quality Service From Qualified Pros!</h1>
                            <p class="text-white pb-3 animated zoomIn">
                            	
                            </p>
                            <a href="service.html" class="btn btn-light py-sm-3 px-sm-5 rounded-pill me-3 animated slideInLeft">Services</a>
                            <a href="contact.html" class="btn btn-outline-light py-sm-3 px-sm-5 rounded-pill animated slideInRight">Contact Us</a>
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
                            <h6 class="position-relative text-primary ps-4">About Us</h6>
                            <h2 class="mt-2">A Brighter Future For Our City,We Can Make It Happen!</h2>
                        </div>
                        <p class="mb-4">City Serve is a technology platform offering a variety of services at home. Customers use our platform to book services such as beauty treatments, haircuts, massage therapy, cleaning, plumbing, carpentry, appliance repair, painting etc. These services are delivered in the comfort of their home and at a time of their choosing. We promise our customers a high quality, standardised and reliable service experience. To fulfill this promise, we work closely with our hand-picked service partners, enabling them with technology, training, products, tools, financing, insurance and brand, helping them succeed and deliver on this promise.</p>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>Quality Services</h6>
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Professional Staff</h6>
                            </div>
                            <div class="col-sm-6">
                                <h6 class="mb-3"><i class="fa fa-check text-primary me-2"></i>24/7 Support</h6>
                                <h6 class="mb-0"><i class="fa fa-check text-primary me-2"></i>Fair Prices</h6>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mt-4">
                            <!-- <a class="btn btn-primary rounded-pill px-4 me-3" href="">Read More</a> -->
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-primary btn-square me-3" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-primary btn-square" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <img class="img-fluid wow zoomIn" data-wow-delay="0.5s" src="img/about.jpg">
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->  
        <!-- Service Start -->
       <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="position-relative d-inline text-primary ps-4">Our Services</h6>
                    <h2 class="mt-2">Best Service-Right Time-Right People</h2>
                </div>
                <div class="row g-4">
                   
                   <%
                   
                   String subCategoryId = request.getParameter("subCategoryId");
                   sql = "select sd.*, md.modifyId from shop as sd inner join  modifydetails as md on md.shopId = sd.shopId where md.subcategoryId=?";
                   ps = DbConnect.getCon().prepareStatement(sql);
                   ps.setString(1, subCategoryId);
                   rs = ps.executeQuery();
                   while(rs.next()){
                   %>
                   
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.1s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded" >
                            <h3 class="mb-3"><strong><%=rs.getString("shopName") %></strong></h3>
                            <h6>City : <%=rs.getString("shopCity") %></h6>
                            <div class="bg-img" style="background-image: url('../admin/<%=rs.getString("shopImage")%>')">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-plug-circle-check"></i> -->
                            </div>
                            <p></p>
                        </div>
                         <div class="d-flex mt-3 flex-row justify-content-center text-center">
                           <a class="" href="viewModifyDetails.jsp?modifyId=<%=rs.getString("modifyId") %>" class="btn btn-primary">
                           <button class="btn btn-outline-warning " type="button"> View Shops </button>
                           </a>
                    </div>
                    </div>
                   
                   <%} %>
                   
                   
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
                        <div class="imgs">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3"><strong>Mechanic</strong></h5>
                            <div class="bg-img2">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-gears"></i> -->
                            </div>
                            
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                            </div>
                        </div>
                    </div>
                   </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Carpenter</h5>
                         <div class="bg-img3">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-couch"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.1s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Painter</h5>
                        <div class="bg-img4">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-paint-roller"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.3s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Plumber</h5>
                            <div class="bg-img5">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-faucet-drip"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Cleaner</h5>
                             <div class="bg-img6">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-broom"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="">See More</a>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Women Beauty Care</h5>
                             <div class="bg-img7">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-wand-magic-sparkles"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Men Beauty Care</h5>
                             <div class="bg-img8">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-wand-magic-sparkles"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="">See More</a>
                             </div>
                        </div>
                    </div>

                     <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Event Manager</h5>
                             <div class="bg-img9">
                            <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-cake-candles"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        
                    </div>
                    <div class="col-lg-4 col-md-6 wow zoomIn" data-wow-delay="0.6s">
                        <div class="service-item d-flex flex-column justify-content-center text-center rounded">
                            <h5 class="mb-3">Shifting</h5>
                             <div class="bg-img10">
                             <div class="service-icon flex-shrink-0">
                                <!-- <i class="fa-solid fa-truck-fast"></i> -->
                            </div>
                            <p></p>
                            <a class="btn px-3 mt-auto mx-auto" href="service.html">See More</a>
                        </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Portfolio Start -->
       <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="position-relative d-inline text-primary ps-4">Our Projects</h6>
                    <h2 class="mt-2">Recently Launched Projects</h2>
                </div>
                <div class="row mt-n2 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="col-12 text-center">
                        <ul class="list-inline mb-5" id="portfolio-flters">
                            <li class="btn px-3 pe-4 active" data-filter="*">All</li>
                            <li class="btn px-3 pe-4" data-filter=".first">Design</li>
                            <li class="btn px-3 pe-4" data-filter=".second">Development</li>
                        </ul>
                    </div>
                </div>
                <div class="row g-4 portfolio-container">
                    <div class="col-lg-4 col-md-6 portfolio-item first wow zoomIn" data-wow-delay="0.1s">
                        <div class="position-relative rounded overflow-hidden">
                            <!-- <img class="img-fluid w-100 v" src="img/portfolio-1.jpg" alt=""> -->
                            <video class="img-fluid w-100 v " src="Video\5ce371eccdb90996961020da47eec831.mp4" loops autoplay controls muted></video>
                            <div class="portfolio-overlay">
                                <a class="btn btn-light" href="img/portfolio-1.jpg" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                <div class="mt-auto">
                                    <small class="text-white"><i class="fa fa-folder me-2"></i>Wedding Planner</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="service.html">Book Service</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item second wow zoomIn" data-wow-delay="0.3s">
                        <div class="position-relative rounded overflow-hidden">
                            <!-- <img class="img-fluid w-100 v" src="img/portfolio-2.jpg" alt=""> -->
                             <video class="img-fluid w-100 v " src="Video\c77c30ab12386610fac9d47b52b75a05_t3.mp4" loops autoplay controls muted></video>
                            <div class="portfolio-overlay">
                            <!-- <div class="portfolio-overlay"> -->
                                <a class="btn btn-light" href="img/portfolio-2.jpg" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                <div class="mt-auto">
                                    <small class="text-white"><i class="fa fa-folder me-2"></i>Event Manager</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="service.html">Book Service</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item first wow zoomIn" data-wow-delay="0.6s">
                        <div class="position-relative rounded overflow-hidden">
                            <!-- <img class="img-fluid w-100 v" src="img/portfolio-3.jpg" alt=""> -->
                            <video class="img-fluid w-100 v " src="Video\6db1b4f42e9e9c9a50c7d2a70d5aa8ba.mp4" loops autoplay controls muted></video>
                            <div class="portfolio-overlay">
                               <a class="btn btn-light" href="#" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                 <div class="mt-auto">
                                   <small class="text-white"><i class="fa fa-folder me-2"></i>Women Makeup</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="service.html">Book Service</a>
                                </div> 
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item second wow zoomIn" data-wow-delay="0.1s">
                        <div class="position-relative rounded overflow-hidden">
                            <!-- <img class="img-fluid w-100 v" src="img/portfolio-4.jpg" alt=""> -->
                            <video class="img-fluid w-100 v " src="Video\62d5c9d706c5ad04a056ae26d601d38d.mp4" loops autoplay controls muted></video>
                             
                            <div class="portfolio-overlay">
                                <a class="btn btn-light" href="img/portfolio-4.jpg" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                <div class="mt-auto">
                                    <small class="text-white"><i class="fa fa-folder me-2"></i>Plumber</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="service.html">Book Service</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item first wow zoomIn" data-wow-delay="0.3s">
                        <div class="position-relative rounded overflow-hidden">
                            <!-- <img class="img-fluid w-100 v" src="img/portfolio-5.jpg" alt=""> -->
                             <video class="img-fluid w-100 v " src="Video\2ce87866315d6fe856c431305e95f27e.mp4" loops autoplay controls muted></video>
                            <div class="portfolio-overlay">
                                <a class="btn btn-light" href="#" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                <div class="mt-auto">
                                    <small class="text-white"><i class="fa fa-folder me-2"></i>Cleaning</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="service.html">Book Service</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 portfolio-item second wow zoomIn" data-wow-delay="0.6s">
                        <div class="position-relative rounded overflow-hidden">
                             <video class="img-fluid w-100 v " src="Video\2d50a3085a5e501c1dfb271a89c048f8.mp4"loops autoplay controls muted></video>
                            <div class="portfolio-overlay">
                                <a class="btn btn-light" href="img/portfolio-6.jpg" data-lightbox="portfolio"><i class="fa fa-plus fa-2x text-primary"></i></a>
                                <div class="mt-auto">
                                    <small class="text-white"><i class="fa fa-folder me-2"></i>Mechanic</small>
                                    <a class="h5 d-block text-white mt-1 mb-0" href="">Book Service</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Portfolio End -->


        <!-- Testimonial Start -->
        <div class="container-xxl bg-primary testimonial py-5 wow fadeInUp" data-wow-delay="0.1s" style="margin: 6rem 0;">
            <div class="container py-5 px-lg-5">
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item bg-transparent border rounded text-white p-4">
                        <i class="fa fa-quote-left fa-2x mb-3"></i>
                        <p>This product is amazing! I love the features and the design. Highly recommended.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-1.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h6 class="text-white mb-1">Neha M.</h6>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded text-white p-4">
                        <i class="fa fa-quote-left fa-2x mb-3"></i>
                        <p>The design is sleek, and the user interface is intuitive. I'm very satisfied with my purchase.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-2.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h6 class="text-white mb-1">Kartik K</h6>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded text-white p-4">
                        <i class="fa fa-quote-left fa-2x mb-3"></i>
                        <p>The customer support is excellent. They were very responsive and helpful with my inquiries.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-3.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h6 class="text-white mb-1">John D.</h6>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded text-white p-4">
                        <i class="fa fa-quote-left fa-2x mb-3"></i>
                        <p>I've been using this product for a month, and I'm impressed with its performance.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-4.jpg" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h6 class="text-white mb-1">Shilpa S.</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container px-lg-5">
                <div class="section-title position-relative text-center mb-5 pb-2 wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="position-relative d-inline text-primary ps-4">Our Team</h6>
                    <h2 class="mt-2">Meet Our Team Members</h2>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item">
                            <div class="d-flex">
                                <div class="flex-shrink-0 d-flex flex-column align-items-center mt-4 pt-5" style="width: 75px;">
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                                <img class="img-fluid rounded w-100" src="img\a1.jpg" alt="">
                            </div>
                            <div class="px-4 py-3">
                                <h5 class="fw-bold m-0">Atifa S.</h5>
                              
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item">
                            <div class="d-flex">
                                <div class="flex-shrink-0 d-flex flex-column align-items-center mt-4 pt-5" style="width: 75px;">
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                                <img class="img-fluid rounded w-100" src="img\z.jpg" alt="">
                            </div>
                            <div class="px-4 py-3">
                                <h5 class="fw-bold m-0">Zoya S.</h5>
                                
                            </div>
                        </div>
                    </div>
                   </div>
                    <div class="row">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="team-item">
                            <div class="d-flex">
                                <div class="flex-shrink-0 d-flex flex-column align-items-center mt-4 pt-5" style="width: 75px;">
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                                <img class="img-fluid rounded w-100" src="img\s.jpg" alt="">
                            </div>
                            <div class="px-4 py-3">
                                <h5 class="fw-bold m-0">Sakshi M.</h5>
                              
                            </div>
                        </div>
                    </div>  
                     <div class="col-lg-2"></div>
                     <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item">
                            <div class="d-flex">
                                <div class="flex-shrink-0 d-flex flex-column align-items-center mt-4 pt-5" style="width: 75px;">
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-instagram"></i></a>
                                    <a class="btn btn-square text-primary bg-white my-1" href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                                <img class="img-fluid rounded w-100" src="img\a1.jpg"alt="">
                            </div>
                            <div class="px-4 py-3">
                                <h5 class="fw-bold m-0">Aafiya S.</h5>
                            </div>
                        </div>
                    </div>
              </div> <!-- ROW ENDS -->
            </div>
        </div>
        <!-- Team End -->
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