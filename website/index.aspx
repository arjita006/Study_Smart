<%@ Page Title="" Language="C#" MasterPageFile="~/website/website_master.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="website_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="banner-silder">
		<div id="JiSlider" class="jislider">
			<ul>
				<li>
					<div class="w3layouts-banner-top">

							<div class="container">
								<div class="agileits-banner-info">
								 <span>Education</span>
									<h3>For The Creatives</h3>
									 <p>You can learn anything</p>
									
								</div>	
							</div>
						</div>
				</li>
				<li>
						<div class="w3layouts-banner-top w3layouts-banner-top1">
						<div class="container">
								<div class="agileits-banner-info">
								 <span>Education</span>
									<h3>For The Creatives</h3>
									 <p>You can learn anything</p>
									
								</div>	
							</div>
						</div>
				</li>
				<li>
						<div class="w3layouts-banner-top w3layouts-banner-top2">
							<div class="container">
								<div class="agileits-banner-info">
								 <span>Education</span>
									<h3>For the Creatives</h3>
									 <p>You can learn anything.</p>
									
								</div>	
								
							</div>
						</div>
					</li>

			</ul>
		</div>
      </div>

<!-- //banner -->
	

<!-- bootstrap-pop-up -->
	<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div>
				<section>
					<div class="modal-body">
						<h5>Mastering</h5>
						<img src="images/2.jpg" alt=" " class="img-responsive" />
						<p>Ut enim ad minima veniam, quis nostrum 
							exercitationem ullam corporis suscipit laboriosam, 
							nisi ut aliquid ex ea commodi consequatur? Quis autem 
							vel eum iure reprehenderit qui in ea voluptate velit 
							e.
							<i>" Quis autem vel eum iure reprehenderit qui in ea voluptate velit 
								esse quam nihil molestiae consequatur.</i></p>
					</div>
				</section>
			</div>
		</div>
	</div>
<!-- //bootstrap-pop-up -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container">
			<h3>Available <span class="fixed_w3"> Classes</span>  <%--<span class="fixed_w3">  </span>--%></h3>
			<div class="agileits_banner_bottom_grids">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay" >
                          
						   <h4><asp:LinkButton ID="lnk9" runat="server" style="color:#fff" OnClick="lnk9_Click">Class 9</asp:LinkButton></h4>
						   <p>Content</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk10" runat="server" style="color:#fff" OnClick="lnk10_Click" >Class 10</asp:LinkButton></h4>
						     <p>Content</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk11" runat="server" style="color:#fff" OnClick="lnk11_Click" >Class 11</asp:LinkButton></h4>
						    <p>Content</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk12" runat="server" style="color:#fff" OnClick="lnk12_Click">Class 12</asp:LinkButton></h4>
						    <p>Content</p>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
				<div class="team-w3ls-row">
				   <h3 class="w3l_header w3_agileits_header">Latest <span>Notes</span></h3>
                    <div class="agileits_banner_bottom_grids">
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay" >
                          
						   <h4>
                               <asp:LinkButton ID="lnk1" runat="server" style="color:#fff" OnClick="lnk1_Click">Class 9</asp:LinkButton></h4>
						   <p>Notes</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk2" runat="server" style="color:#fff" OnClick="lnk2_Click">Class 10 </asp:LinkButton></h4>
						     <p>Notes</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk3" runat="server" style="color:#fff" OnClick="lnk3_Click">Class 11</asp:LinkButton></h4>
						    <p>Notes</p>
						</div>
					</div>
				</div>
				<div class="col-md-3 agileits_banner_bottom_grid">
					<div class="hovereffect w3ls_banner_bottom_grid">
						<img src="img3.jpg" alt=" " class="img-responsive" />
						<div class="overlay">
						   <h4>
                               <asp:LinkButton ID="lnk4" runat="server" style="color:#fff" OnClick="lnk4_Click">Class 12</asp:LinkButton></h4>
						    <p>Notes</p>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
				<div class="team-w3ls-row">
				 <%--<%--<%--  <div class="agileits_banner_bottom_grids">
				<div class="col-md-3 col-sm-6 team-grids">
					<img src="img3.jpg" alt=""/ class="img-responsive">
					<div class="img-caption w3-agileits">
						<div class="img-agileinfo-text">
							<h4>Class </h4>
							<%--<p>English Instructor</p> --%>
							<%--<div class="w3social-icons"> --%>
								<%--<ul>
									<li><a href="#"><i class="fa fa-google-plus"></i> </a></li>
									<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
									<li><a href="#"><i class="fa fa-twitter"></i> </a></li> 
								</ul>--%>
							<%--</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 team-grids">
					<img src="images/t2.jpg" alt=""/>
					<div class="img-caption">
						<div class="img-agileinfo-text">
							<h4>Lana del Rey</h4>
							<p>PHP Instructor </p>
							<div class="w3social-icons">--%> 
								<%--<ul>
									<li><a href="#"><i class="fa fa-google-plus"></i> </a></li>
									<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
									<li><a href="#"><i class="fa fa-twitter"></i> </a></li> 
								</ul>--%>
							<%--</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 team-grids">
					<img src="images/t3.jpg" alt=""/>
					<div class="img-caption">
						<div class="img-agileinfo-text">
							<h4>Mark John</h4>
							<p>English Instructor</p> 
							<div class="w3social-icons"> --%>
								<%--<ul>
									<li><a href="#"><i class="fa fa-google-plus"></i> </a></li>
									<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
									<li><a href="#"><i class="fa fa-twitter"></i> </a></li> 
								</ul>--%>
							<%--</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 team-grids">
					<img src="images/t4.jpg" alt=""/>
					<div class="img-caption">
						<div class="img-agileinfo-text">
							<h4>Peter Parker</h4>
							<p>PHP Instructor</p>
							<div class="w3social-icons"> --%>
								<%--<ul>
									<li><a href="#"><i class="fa fa-google-plus"></i> </a></li>
									<li><a href="#"><i class="fa fa-facebook"></i> </a></li>
									<li><a href="#"><i class="fa fa-twitter"></i> </a></li> 
								</ul>--%>
							<%--<%--<%--</div>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div> 
			</div>
			</div>

		</div>--%>
	</div>
<!-- //banner-bottom -->

	<!-- services -->
	<div class="services" id="services">
		<div class="container">
		<h3 class="w3l_header w3_agileits_header two">Latest <span>Question Paper</span></h3>
			<div class="agile_inner_w3ls-grids two">
				<div class="col-md-3 service-box">
					<figure class="icon">
					   
                           <span>
                            9</span>
						<i class="fa fa-graduation-cap" aria-hidden="true"></i>
					</figure>
					<h5><asp:LinkButton ID="LinkButton5" runat="server"  style="color:#fff" OnClick="LinkButton5_Click">Mock Papers</asp:LinkButton></h5>
					<%--<p>Lorem ipsum dolor sit amet.doloremque laudantium elerisque.</p>--%>
				</div>
				<div class="col-md-3 service-box">
				
					<figure class="icon">
					 <span>10</span>
					<i class="fa fa-laptop" aria-hidden="true"></i>
					</figure>
					<h5>
                        <asp:LinkButton ID="LinkButton8" runat="server" style="color:#fff" OnClick="LinkButton8_Click" >Previous Year Question Papers</asp:LinkButton></h5>
					<%--<p>Lorem ipsum dolor sit amet.doloremque laudantium elerisque.</p>--%>
				</div>
				<div class="col-md-3 service-box">
					<figure class="icon">
					 <span>11</span>
						<i class="fa fa-book" aria-hidden="true"></i>
					</figure>
					<h5>
                        <asp:LinkButton ID="LinkButton6" runat="server" style="color:#fff" OnClick="LinkButton6_Click">Mock Papers</asp:LinkButton></h5>
				<%--<p>Lorem ipsum dolor sit amet.doloremque laudantium elerisque.</p>--%>
				</div>
				<div class="col-md-3 service-box">
					<figure class="icon">
					 <span>12</span>
						<i class="fa fa-lightbulb-o" aria-hidden="true"></i>
					</figure>
					<h5>
                        <asp:LinkButton ID="LinkButton7" runat="server" style="color:#fff" OnClick="LinkButton7_Click" >Previous Year Question Papers</asp:LinkButton></h5>
					<%--<p>Lorem ipsum dolor sit amet.doloremque laudantium elerisque.</p>--%>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //services -->

	<!-- blog -->
	<%--<div class="blog" id="blog">
		<div class="container">
		
		<h3 class="w3l_header w3_agileits_header"> Latest <span>  News</span></h3>
			<div class="agile_inner_w3ls-grids">
	
				<div class="col-sm-6 w3-agile-post-grids">
					<div class="w3-agile-post-img w3-agile-post-img1">
						<a href="#" data-toggle="modal" data-target="#myModal"> 
							<ul>
								<li><i class="fa fa-comments" aria-hidden="true"></i> 05</li>
								<li><i class="fa fa-heart" aria-hidden="true"></i> 874</li>
								<li><i class="fa fa-share" aria-hidden="true"></i> Share</li>
							</ul>
						</a>
					</div>
					<div class="w3-agile-post-info">
						<h4><a href="#" data-toggle="modal" data-target="#myModal">Quisque a rhoncus</a></h4>
						<ul>
							<li>By <a href="#">Admin</a></li>
							<li>Jan 28th,2017</li>
						</ul>
						<p>Suspendisse in nisl at ipsum molestie dignissim. Pellentesque est nisi, blandit eget aliquam sed, consequat nec risus.</p>
					</div>
				</div>
				<div class="col-sm-6 w3-agile-post-grids">
					<div class="w3-agile-post-img w3-agile-post-img2">
						<a href="#" data-toggle="modal" data-target="#myModal"> 
							<ul>
								<li><i class="fa fa-comments" aria-hidden="true"></i> 21</li>
								<li><i class="fa fa-heart" aria-hidden="true"></i> 287</li>
								<li><i class="fa fa-share" aria-hidden="true"></i> Share</li>
							</ul>
						</a>
					</div>
					<div class="w3-agile-post-info">
						<h4><a href="#" data-toggle="modal" data-target="#myModal">Quisque a rhoncus</a></h4>
						<ul>
							<li>By <a href="#">Admin</a></li>
							<li>Feb 24th,2017</li>
						</ul>
						<p>Suspendisse in nisl at ipsum molestie dignissim. Pellentesque est nisi, blandit eget aliquam sed, consequat nec risus.</p>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>--%>
	<!-- //blog -->
<!-- stats -->
                    <div style="width:100%;height:75px">

                    </div>
	<div class="stats" id="stats">
	    <div class="container"> 
			<div class="inner_w3l_agile_grids">
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid">
		   <i class="fa fa-laptop" aria-hidden="true"></i>
          <div>  <asp:Label ID="Label1" runat="server"  class="counter" Text="" ForeColor="White" Font-Size="XX-Large" Font-Bold="true"></asp:Label> </div>
			<h3>Student's Connected</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid1">
		    <i class="fa fa-smile-o" aria-hidden="true"></i>
			<div> <asp:Label ID="Label2" runat="server"  class="counter" Text="" ForeColor="White"  Font-Size="XX-Large" Font-Bold="true"></asp:Label></div>
			<h3>Feedback</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid2">
		<i class="fa fa-trophy" aria-hidden="true"></i>
			<div><asp:Label ID="Label3" runat="server"  class="counter" Text="" ForeColor="White" Font-Size="XX-Large" Font-Bold="true"></asp:Label></div> 
			<h3>Amount of Content Downloaded</h3>
		</div>
		<div class="col-md-3 w3layouts_stats_left w3_counter_grid3">
		<i class="fa fa-user" aria-hidden="true"></i>
			<div><asp:Label ID="Label4" runat="server"  class="counter" Text="" ForeColor="White"  Font-Size="XX-Large" Font-Bold="true"></asp:Label></div> 
			<h3>Tutor's Connected</h3>
		</div>
		<div class="clearfix"> </div>
	</div>
   </div>	
</div>
<!-- //stats -->

<!-- testimonials -->		
                    <div style="width:100%;height:75px"></div>
	<div class="testimonials">
		<div class="col-md-6 w3layouts_event_left">
			<img src="images/test.jpg" alt=" " class="img-responsive" />
		</div>
		<div class="col-md-6 w3layouts_event_right">
			<h3>what people says</h3>
			<section class="slider">
				<div class="flexslider">
					<ul class="slides">
						<li>
							<div class="w3_event_right_grid">
								<div class="w3layouts_event_right_para">
<%--									<p>Nam tempus lobortis sem non ornare. Curabitur dignissim interdum sem, et mollis lorem. 
										Mauris hendrerit, mi in aliquet egestas, nisi mi vestibulum turpis.</p>--%>
                                   <div> <asp:TextBox ID="txtmsg" runat="server" Text="qwertyu" ForeColor="Black"></asp:TextBox> </div>
									<div class="w3layouts_event_right_para_pos">
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</div>
								</div>
								<div class="w3_agile_event_right_grids">
									<div class="col-xs-4 w3_agile_event_right_grid_left">
									<%--	<img src="images/test1.jpg" alt=" " class="img-responsive" />--%>
									</div>
									<div class="col-xs-8 w3_agile_event_right_grid_right">
                                        <asp:Label ID="lblname" runat="server" Text="Label"></asp:Label>
										<%--<h4>Williams Stall</h4>
										<p>Graphic & web designer</p>--%>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</li>
						<li>
							<div class="w3_event_right_grid">
								<div class="w3layouts_event_right_para">
                                    <asp:TextBox ID="txtmsg1" runat="server"></asp:TextBox>
									<%--<p>Nam tempus lobortis sem non ornare. Curabitur dignissim interdum sem, et mollis lorem. 
										Mauris hendrerit, mi in aliquet egestas, nisi mi vestibulum turpis.</p>--%>
									<div class="w3layouts_event_right_para_pos">
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</div>
								</div>
								<div class="w3_agile_event_right_grids">
									<div class="col-xs-4 w3_agile_event_right_grid_left">
										<%--	<img src="images/test2.jpg" alt=" " class="img-responsive" />--%>
									</div>
									<div class="col-xs-8 w3_agile_event_right_grid_right">
                                        <asp:Label ID="lblname1" runat="server" Text="Label"></asp:Label>
										<%--<h4>Catherine Mark</h4>
										<p>PHP & web developer</p>--%>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
						</li>
                        <li>
                            <div class="w3_event_right_grid">
								<div class="w3layouts_event_right_para">
                                    <asp:TextBox ID="txtmsg2" runat="server" TextMode="MultiLine"></asp:TextBox>
									<%--<p>Nam tempus lobortis sem non ornare. Curabitur dignissim interdum sem, et mollis lorem. 
										Mauris hendrerit, mi in aliquet egestas, nisi mi vestibulum turpis.</p>--%>
									<div class="w3layouts_event_right_para_pos">
										<i class="fa fa-quote-left" aria-hidden="true"></i>
									</div>
								</div>
								<div class="w3_agile_event_right_grids">
									<div class="col-xs-4 w3_agile_event_right_grid_left">
											<%--<img src="images/test2.jpg" alt=" " class="img-responsive" />--%>
									</div>
									<div class="col-xs-8 w3_agile_event_right_grid_right">
                                        <asp:Label ID="lblname2" runat="server" Text=""></asp:Label>
										<%--<h4>Catherine Mark</h4>
										<p>PHP & web developer</p>--%>
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
                        </li>
					</ul>
				</div>
			</section>
		</div>
		<div class="clearfix"> </div>
	</div>
<!-- //testimonials -->	
    <!-- start-smoth-scrolling -->
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<script src="js/JiSlider.js"></script>
<script>
    $(window).load(function () {
        $('#JiSlider').JiSlider({ color: '#fff', start: 3, reverse: true }).addClass('ff')
    })
</script><script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-36251023-1']);
    _gaq.push(['_setDomainName', 'jqueryscript.net']);
    _gaq.push(['_trackPageview']);

    (function () {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>
<!-- stats -->
	<script src="https://js/jquery.waypoints.min.js"></script>
	<script src="https://js/jquery.countup.js"></script>
		<%--<script>
		    $('.counter').countUp();
		</script>--%>
<!-- //stats -->
<!-- //footer -->
<!-- flexSlider -->
	<script defer src="https://js/jquery.flexslider.js"></script>
	<script type="https://text/javascript">
	    $(window).load(function () {
	        $('.flexslider').flexslider({
	            animation: "slide",
	            start: function (slider) {
	                $('body').removeClass('loading');
	            }
	        });
	    });
  </script>
<!-- //flexSlider -->


<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
        });
    });
</script>
<!-- start-smoth-scrolling -->
<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- here stars scrolling icon -->
	<script type="text/javascript">
	    $(document).ready(function () {
	        /*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			*/

	        $().UItoTop({ easingType: 'easeOutQuart' });

	    });
	</script>
<!-- //here ends scrolling icon -->
    </div>
    </div>
    </div>
    </span>
</asp:Content>

