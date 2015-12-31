<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="jahia" uri="http://www.jahia.org/tags/templateLib" %>
<%-- TODO: Display News Categories --%>

<template:addResources type="css" resources="news.css"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<fmt:setLocale value="${language}" scope="session"/>

<c:set var="newsImage" value="${currentNode.properties['image'].node}"/>
<c:set var="newsTitle" value="${currentNode.properties['jcr:title']}"/>
<c:set var="description" value="${currentNode.properties['desc']}"/>
<fmt:formatDate pattern="MMMM dd, yyyy" dateStyle="short" value="${currentNode.properties['date'].time}"
                var="newsDate"/>


    <!-- News Detail -->

        <!-- News v3 -->
        <div class="news-v3 bg-color-white margin-bottom-30">
            <h2>${newsTitle.string}</h2>
            <c:if test="${not empty newsImage}">
                <img class="img-responsive full-width" src="${newsImage.url}" alt="${newsTitle}">
            </c:if>
            <div class="news-v3-in">
                <ul class="list-inline posted-info">
                    <%-- news categories here?                    <li>In <a href="#">Design</a></li> --%>
                    <li>Posted ${newsDate}</li>
                </ul>
                ${description.string}
<%--                <ul class="post-shares post-shares-lg">
                    <li>
                        <a href="#">
                            <i class="rounded-x icon-speech"></i>
                            <span>28</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="rounded-x icon-share"></i>
                            <span>355</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="rounded-x icon-heart"></i>
                            <span>107</span>
                        </a>
                    </li>
                </ul> --%>
            </div>
            <!-- End News v3 -->

            <!-- Recent Comments -->
<%--
            <div class="media">
                <h3>Comments</h3>
            </div>
            <div class="media">
                <div class="pull-left">
                    <img class="media-object rounded-x" src="assets/img/testimonials/img1.jpg" alt=""/>
                    <br/><span class="testimonial-author">
                                        Jeremy
						</span>
                </div>

                <h4 class="media-heading">Comment heading <span>5 hours ago</span></h4>

                <p>Donec id elit non mi portas sats eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris
                    condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna..</p>

                <hr>
            </div>

            <div class="media">
                <div class="pull-left">
                    <img class="media-object rounded-x" src="assets/img/user.jpg" alt=""/>
                    <br/><span class="testimonial-author">
                                        Anonymous
						</span>
                </div>
                <div class="media-body">
                    <h4 class="media-heading">Comment heading <span>17 hours ago</span></h4>

                    <p>Donec id elit non mi portas sats eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                        mauris condimentum anibhut fermentum massa justo sit amet risus. Etiam porta sem malesuada
                        magna..</p>
                </div>
            </div>

            <hr>

            <div class="media">
                <div class="pull-left">
                    <img class="media-object rounded-x" src="assets/img/testimonials/img3.jpg" alt=""/>
                    <br/><span class="testimonial-author">
                                        Jeremy
						</span>
                </div>
                <div class="media-body">
                    <h4 class="media-heading">Comment heading <span>2 days ago</span></h4>

                    <p>Donec id elit non mi portas sats eget metus. Fusce dapibus, tellus ac cursus commodo, tortor
                        mauris condimentum anibhut fermentum massa justo sit amet risus. Etiam porta sem malesuada
                        magna..</p>
                </div>
            </div>
            <!--/media-->

            <!-- End Recent Comments -->
            <hr>

            <!-- Comment Form -->
            <div class="post-comment">
                <h3>Leave a Comment</h3>

                <form>
                    <label>Name</label>

                    <div class="row margin-bottom-20">
                        <div class="col-md-7 col-md-offset-0">
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <label>Email <span class="color-red">*</span></label>

                    <div class="row margin-bottom-20">
                        <div class="col-md-7 col-md-offset-0">
                            <input type="text" class="form-control">
                        </div>
                    </div>

                    <label>Message</label>

                    <div class="row margin-bottom-20">
                        <div class="col-md-11 col-md-offset-0">
                            <textarea class="form-control" rows="8"></textarea>
                        </div>
                    </div>

                    <p>
                        <button class="btn-u" type="submit">Send Message</button>
                    </p>
                </form>
            </div>
            <!-- End Comment Form --> --%>
        </div>

    <!-- End Blog All Posts -->

<%--    <!-- Blog Sidebar -->
    <div class="col-md-3">
        <div class="headline-v2 tag-box-v2"><h2>Top Rated</h2></div>
        <!-- Trending -->
        <ul class="list-unstyled blog-trending margin-bottom-50">
            <li>
                <h3><a href="#">Proin dapibus ornare magna.</a></h3>
                <small>19 Jan, 2015 / <a href="#">Hi-Tech,</a> <a href="#">Technology</a></small>
            </li>
            <li>
                <h3><a href="#">Fusce at diam ante.</a></h3>
                <small>17 Jan, 2015 / <a href="#">Artificial Intelligence</a></small>
            </li>
            <li>
                <h3><a href="#">Donec quis consequat magna...</a></h3>
                <small>5 Jan, 2015 / <a href="#">Web,</a> <a href="#">Webdesign</a></small>
            </li>
        </ul>
        <!-- End Trending -->

        <div class="headline-v2 tag-box-v2"><h2>Latest Posts</h2></div>
        <!-- Latest Links -->
        <ul class="list-unstyled blog-latest-posts margin-bottom-20">
            <li>
                <h3><a href="#">Many desktop publishing packages...</a></h3>
                <small>23 Jan, 2015 / <a href="#">Art,</a> <a href="#">Lifestyles</a></small>
                <p>Integer vehicula sed justo ac dapibus. In sodales nunc non varius accumsan.</p>
            </li>
            <li>
                <h3><a href="#">The point of using Lorem Ipsum</a></h3>
                <small>19 Jan, 2015 / <a href="#">Hi-Tech,</a> <a href="#">Technology</a></small>
                <p>Phasellus ullamcorper pellentesque ex. Cras venenatis elit orci...</p>
            </li>
            <li>
                <h3><a href="#">Many desktop publishing packages...</a></h3>
                <small>23 Jan, 2015 / <a href="#">Art,</a> <a href="#">Lifestyles</a></small>
                <p>Integer vehicula sed justo ac dapibus. In sodales nunc non varius accumsan.</p>
            </li>
            <li>
                <h3><a href="#">The point of using Lorem Ipsum</a></h3>
                <small>19 Jan, 2015 / <a href="#">Hi-Tech,</a> <a href="#">Technology</a></small>
                <p>Phasellus ullamcorper pellentesque ex. Cras venenatis elit orci...</p>
            </li>
            <li>
                <h3><a href="#">Many desktop publishing packages...</a></h3>
                <small>23 Jan, 2015 / <a href="#">Art,</a> <a href="#">Lifestyles</a></small>
                <p>Integer vehicula sed justo ac dapibus. In sodales nunc non varius accumsan.</p>
            </li>
        </ul>
        <ul class="pager">
            <li class="next btn-u-xs"><a href="#">More News <i class="fa fa-angle-right"></i></a></li>
        </ul>
        <!-- End Latest Links -->


        <div class="headline-v2 tag-box-v2"><h2>Tags</h2></div>
        <!-- Tags v2 -->
        <ul class="list-inline tags-v2 margin-bottom-50">
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Economy</a></li>
            <li><a href="#">Sport</a></li>
            <li><a href="#">Marketing</a></li>
            <li><a href="#">Books</a></li>
            <li><a href="#">Elections</a></li>
            <li><a href="#">Flickr</a></li>
            <li><a href="#">Politics</a></li>
        </ul>
        <!-- End Tags v2 -->
        <div class="headline-v2 tag-box-v2"><h2>Newsletter</h2></div>
        <!-- Blog Newsletter -->
        <p>Subscribe to our newsletter for good news, sent out every month.</p>

        <div class="input-group margin-bottom-40">
            <input class="form-control" placeholder="Email" type="text">
                            <span class="input-group-btn">
                                <button class="btn-u" type="button">Subscribe</button>
                            </span>
        </div>

        <!-- End Blog Newsletter -->

    </div>
    <!-- End Blog Sidebar --> --%>
