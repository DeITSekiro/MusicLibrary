<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Music Library</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <!-- Graph CSS -->
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <!-- lined-icons -->
        <link rel="stylesheet" href="css/icon-font.css" type='text/css' />
        <!-- //lined-icons -->
        <link rel="stylesheet" href="css/playlistDetailsStyle.css" type='text/css' />
        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>


    </head> 
    <!-- /w3layouts-agile -->
    <body class="sticky-header left-side-collapsed"  onload="initMap()">
        <section>
            <!-- left side start-->
            <div class="left-side sticky-left-side">

                <!--logo and iconic logo start-->
                <div class="logo">
                    <h1><a href="index.html">Mosai<span>c</span></a></h1>
                </div>
                <div class="logo-icon text-center">
                    <a href="index.html">M </a>
                </div>

                <!--logo and iconic logo end-->
                <div class="left-side-inner">

                    <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <li class="active"><a href="index.html"><i class="lnr lnr-home"></i><span>Home</span></a></li>

                        <li><a href="radio.html"><i class="camera"></i> <span>Radio</span></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-th"></i><span>Apps</span></a></li>
                        <li><a href="radio.html"><i class="lnr lnr-users"></i> <span>Artists</span></a></li> 
                        <li><a href="browse.html"><i class="lnr lnr-music-note"></i> <span>Albums</span></a></li>						
                        <li class="menu-list"><a href="browse.html"><i class="lnr lnr-indent-increase"></i> <span>Browser</span></a>  
                            <ul class="sub-menu-list">
                                <li><a href="browse.html">Artists</a> </li>
                                <li><a href="404.html">Services</a> </li>
                            </ul>
                        </li>
                        <li><a href="blog.html"><i class="lnr lnr-book"></i><span>Blog</span></a></li>
                        <li><a href="typography.html"><i class="lnr lnr-pencil"></i> <span>Typography</span></a></li>
                        <li class="menu-list"><a href="#"><i class="lnr lnr-heart"></i>  <span>My Favourities</span></a> 
                            <ul class="sub-menu-list">
                                <li><a href="radio.html">All Songs</a></li>
                            </ul>
                        </li>
                        <li class="menu-list"><a href="contact.html"><i class="fa fa-thumb-tack"></i><span>Contact</span></a>
                            <ul class="sub-menu-list">
                                <li><a href="contact.html">Location</a> </li>
                            </ul>
                        </li>     
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>
            <!-- /w3l-agile -->
            <!-- left side end-->
            <!-- app-->
            <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog facebook" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <div class="modal-body">
                            <div class="app-grids">
                                <div class="app">
                                    <div class="col-md-5 app-left mpl">
                                        <h3>Mosaic mobile app on your smartphone!</h3>
                                        <p>Download and Avail Special Songs Videos and Audios.</p>
                                        <div class="app-devices">
                                            <h5>Gets the app from</h5>
                                            <a href="#"><img src="images/1.png" alt=""></a>
                                            <a href="#"><img src="images/2.png" alt=""></a>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </div>
                                    <div class="col-md-7 app-image">
                                        <img src="images/apps.png" alt="">
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //app-->
            <!-- /w3l-agileits -->
            <!-- signup -->
            <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content modal-info">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <div class="modal-body modal-spa">
                            <div class="sign-grids">
                                <div class="sign">
                                    <div class="sign-left">
                                        <ul>
                                            <li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
                                            <li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
                                            <li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
                                        </ul>
                                    </div>
                                    <div class="sign-right">
                                        <form action="#" method="post">
                                            <h3>Create your account </h3>
                                            <input type="text" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Name';
                                                    }" required="">
                                            <input type="text" value="Mobile number" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Mobile number';
                                                    }" required="">
                                            <input type="text" value="Email id" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Email id';
                                                    }" required="">	
                                            <input type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                        this.value = 'Password';
                                                    }" required="">	

                                            <input type="submit" value="CREATE ACCOUNT" >
                                        </form>
                                    </div>
                                    <div class="clearfix"></div>								
                                </div>
                                <p>By logging in you agree to our <span>Terms and Conditions</span> and <span>Privacy Policy</span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //signup -->
            <!-- /w3l-agile-its -->
            <!-- main content start-->
            <div class="main-content">
                <!-- header-starts -->
                <div class="header-section">
                    <!--toggle button start-->
                    <a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
                    <!--toggle button end-->
                    <!--notification menu start -->
                    <div class="menu-right">
                        <div class="profile_details">		
                            <div class="col-md-4 serch-part">
                                <div id="sb-search" class="sb-search">
                                    <form action="#" method="post">
                                        <input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
                                        <input class="sb-search-submit" type="submit" value="">
                                        <span class="sb-icon-search"> </span>
                                    </form>
                                </div>
                            </div>
                            <!-- search-scripts -->
                            <script src="js/classie.js"></script>
                            <script src="js/uisearch.js"></script>
                            <script>
                                                new UISearch(document.getElementById('sb-search'));
                            </script>
                            <!-- //search-scripts -->
                            <!---->
                            <div class="col-md-4 player">
                                <div class="audio-player">
                                    <audio id="audio-player"  controls="controls">
                                        <source src="media/Blue Browne.ogg" type="audio/ogg"></source>
                                        <source src="media/Blue Browne.mp3" type="audio/mpeg"></source>
                                        <source src="media/Georgia.ogg" type="audio/ogg"></source>
                                        <source src="media/Georgia.mp3" type="audio/mpeg"></source></audio>
                                </div>
                                <!---->
                                <script type="text/javascript">
                                    $(function () {
                                        $('#audio-player').mediaelementplayer({
                                            alwaysShowControls: true,
                                            features: ['playpause', 'progress', 'volume'],
                                            audioVolume: 'horizontal',
                                            iPadUseNativeControls: true,
                                            iPhoneUseNativeControls: true,
                                            AndroidUseNativeControls: true
                                        });
                                    });
                                </script>
                                <!--audio-->
                                <link rel="stylesheet" type="text/css" media="all" href="css/audio.css">
                                <script type="text/javascript" src="js/mediaelement-and-player.min.js"></script>
                                <!---->

                                <!-- /w3layouts-agile -->
                                <!--//-->
                                <ul class="next-top">
                                    <li><a class="ar" href="#"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" href="#"><img src="images/arrow2.png" alt=""/></i></a></li>

                                </ul>	
                            </div>
                            <div class="col-md-4 login-pop">
                                <div id="loginpop"><a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                    <div id="loginBox">                
                                        <form action="#" method="post" id="loginForm">
                                            <fieldset id="body">
                                                <fieldset>
                                                    <label for="email">Email Address</label>
                                                    <input type="text" name="email" id="email">
                                                </fieldset>
                                                <fieldset>
                                                    <label for="password">Password</label>
                                                    <input type="password" name="password" id="password">
                                                </fieldset>
                                                <input type="submit" id="login" value="Sign in">
                                                <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                            </fieldset>
                                            <span><a href="#">Forgot your password?</a></span>
                                        </form>
                                    </div>
                                </div>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-------->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!--notification menu end -->
                <!-- //header-ends -->
                <!-- /wthree-agile -->
                <!-- //header-ends -->




                <div id="page-wrapper">

                    <div class="inner-content single container-fluid">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="playlist-details">
                                    <div class="playlist-image">
                                        <img src="images/songs_img/david_martin.jpg">
                                    </div>
                                    <div class="playlist-info">
                                        <h3 class="playlist-title">Playlist Name</h3>
                                        <div class="playlist-author">
                                            <span>Author Name</span>
                                        </div>
                                        <div class="playlist-action">
                                            <button class="btn btn-primary play-btn"><span class="fa fa-play" aria-hidden="true"></span><span class="padding-left-10">Play</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-8">
                                <div class="playlist-songs">
                                    <div class="media-header bg-warning">
                                        <div class="media-header-content">
                                            <i class="fa fa-music" ></i>
                                            <span class="padding-left-10">Songs</span>
                                        </div>
                                    </div>
                                    
                                    <div class="media-body bg-info">
                                        <div class="song-item">
                                            <div class="song-index">
                                                <span class>1</span>
                                            </div>

                                            <div class="song-thumb">
                                                <figure class="is40x40">
                                                    <img src="images/songs_img/frieren.png">
                                                </figure>
                                                <div class="song-action">
                                                    <button>
                                                        <i class="fa fa-play" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="song-info">
                                                <div class="song-name">
                                                    Song Name
                                                </div>
                                                <div class="song-author">
                                                    Song Author
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="media-bottom bg-gray">

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /w3l-agileits-->
                    <!--body wrapper start-->
                    <div class="review-slider">

                        <div class="tittle-head">
                            <h3 class="tittle">Featured Albums <span class="new"> New</span></h3>
                            <div class="clearfix"> </div>
                        </div>
                        <ul id="flexiselDemo1">
                            <li>
                                <a href="single.html"><img src="images/v1.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Adele21 </div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v2.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Adele21</h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v3.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Shomlock</h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v4.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Stuck on a feeling</h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v5.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Ricky Martine </h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v6.jpg" alt=""/></a>
                                <div class="slide-title"><h4>Ellie Goluding </h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="single.html"><img src="images/v6.jpeg" alt=""/></a>
                                <div class="slide-title"><h4>Fifty Shades </h4></div>
                                <div class="date-city">
                                    <h5>Jan-02-16</h5>
                                    <div class="buy-tickets">
                                        <a href="single.html">READ MORE</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <script type="text/javascript">
                                    $(window).load(function () {

                                        $("#flexiselDemo1").flexisel({
                                            visibleItems: 5,
                                            animationSpeed: 1000,
                                            autoPlay: true,
                                            autoPlaySpeed: 3000,
                                            pauseOnHover: false,
                                            enableResponsiveBreakpoints: true,
                                            responsiveBreakpoints: {
                                                portrait: {
                                                    changePoint: 480,
                                                    visibleItems: 2
                                                },
                                                landscape: {
                                                    changePoint: 640,
                                                    visibleItems: 3
                                                },
                                                tablet: {
                                                    changePoint: 800,
                                                    visibleItems: 4
                                                }
                                            }
                                        });
                                    });
                        </script>
                        <script type="text/javascript" src="js/jquery.flexisel.js"></script>	
                    </div>

                </div>
                <div class="clearfix"></div>
                <!--body wrapper end-->
                <!-- /w3layouts-agile -->
            </div>





            <!--body wrapper end-->           
            <!-- /w3layouts-agile -->
            <!--footer section start-->
            <footer>
                <p>&copy 2016 Mosaic. All Rights Reserved | Design by <a href="https://w3layouts.com/" target="_blank">w3layouts.</a></p>
            </footer>
            <!--footer section end-->

            <!-- main content end-->
        </section>

        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>
