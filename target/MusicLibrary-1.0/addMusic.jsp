<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-control" content="no-cache">
        <title>Profile</title>
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

        <link rel="stylesheet" href="css/addMusic-style.css" type ='text/css'/>

        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>
    </head>
    <body class="sticky-header left-side-collapsed"  onload="initMap()">
        <main>
            <div class="left-side sticky-left-side">

                <!--logo and iconic logo start-->
                <div class="logo">
                    <h1><a href="index.jsp">Mosai<span>c</span></a></h1>
                </div>
                <div class="logo-icon text-center">
                    <a href="index.jsp">M </a>
                </div>

                <div class="left-side-inner">

                    <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <li><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
                        <li><a href="#"><i class="camera"></i> <span>Radio</span></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-th"></i><span>Apps</span></a></li>
                        <li><a href="#"><i class="lnr lnr-users"></i> <span>Artists</span></a></li> 
                        <li><a href="#"><i class="lnr lnr-music-note"></i> <span>Albums</span></a></li>						
                        <li class="menu-list"><a href="#"><i class="lnr lnr-indent-increase"></i> <span>Browser</span></a>  
                            <ul class="sub-menu-list">
                                <li><a href="#">Artists</a> </li>
                                <li><a href="#">Services</a> </li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="lnr lnr-book"></i><span>Blog</span></a></li>
                        <li><a href="#"><i class="lnr lnr-pencil"></i> <span>Typography</span></a></li>
                        <li class="menu-list"><a href="#"><i class="lnr lnr-heart"></i>  <span>My Favourities</span></a> 
                            <ul class="sub-menu-list">
                                <li><a href="#">All Songs</a></li>
                            </ul>
                        </li>
                        <li class="menu-list"><a href="#"><i class="fa fa-thumb-tack"></i><span>Contact</span></a>
                            <ul class="sub-menu-list">
                                <li><a href="#">Location</a> </li>
                            </ul>
                        </li>
                        <li class="active"><a href="profile.jsp"><i class="lnr lnr-user"></i><span>Profile: ${loggeduser.name}</span></a></li>
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>

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


                                <!--//-->
                                <ul class="next-top">
                                    <li><a class="ar" href="#"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" href="#"><img src="images/arrow2.png" alt=""/></i></a></li>

                                </ul>	
                            </div>
                            <div class="col-md-4 login-pop">
                                <c:choose>
                                    <c:when test="${loggeduser == null}">
                                        <div id="loginpop"> <a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                            <div id="loginBox">  
                                                <form action="login" method="post" id="loginForm">
                                                    <p>${message}</p>
                                                    <input type="hidden" name="action" value="loginUser">

                                                    <fieldset id="body">
                                                        <fieldset>
                                                            <label for="email">Email Address</label>
                                                            <input type="text" name="loginEmail" id="email">
                                                        </fieldset>
                                                        <fieldset>
                                                            <label for="password">Password</label>
                                                            <input type="password" name="loginPass" id="password">
                                                        </fieldset>
                                                        <input type="submit" id="login" value="Sign in">
                                                        <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                                    </fieldset>
                                                    <span><a href="#">Forgot your password?</a></span>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div id="loginpop"> <a href="#" id="loginButton"><span>Signed in</span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                            <div id="loginBox">  
                                                <form action="login" method="post" id="loginForm">


                                                    <fieldset id="body">
                                                        <fieldset>
                                                            <label>Username = ${loggeduser.getName()}</label>

                                                        </fieldset>
                                                        <fieldset>
                                                            <label>Email = ${loggeduser.getGmail()}</label>

                                                        </fieldset>

                                                    </fieldset>
                                                    <input type="submit" name="action" value="Playlist" > 
                                                    <input type="submit" name ="action" id="My profile" value="My profile">
                                                    <input type="submit" name ="action" id="setting" value="Setting">
                                                    <input type="submit" name="action" value="Log out" id="login">

                                                </form>

                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-------->
                    </div>
                    <div class="clearfix"></div>
                </div>





                <div id="page-wrapper">
                    <section class="container-fluid" id="user-deatails-MW">
                        <!--user profile-->
                        <form method="post" action="music">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="musicName">Song's name</label>
                                    <input type="text" class="form-control" id="musicName" placeholder="Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="author">Author</label>
                                    <input type="text" class="form-control" id="author" 
                                           value="${loggeduser.getName()}" disabled>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="image">Cover image</label>
                                    <input type="text" class="form-control" id="image">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="category">Category</label>
                                    <select id="category" class="form-control">
                                        <option selected>UK-Pop</option>
                                        <option>V-Pop</option>
                                        <option>J-Pop</option>
                                        <option>K-Pop</option>
                                        <option>Rock</option>
                                        <option>Jazz</option>
                                        <option>Rhythm and blues</option>
                                        <option>Country</option>
                                        <option>Funk</option>
                                        <option>Electronic</option>
                                        <option>Folk</option>
                                        <option>Rock and roll</option>
                                        <option>Rock</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="musicFile">Song's file</label>
                                    <input type="text" class="form-control" id="musicFile">
                                </div>    
                            </div>
                            <button type="submit" class="btn btn-primary">Upload</button>
                        </form>
                        <!--End user profile-->  


                        <div class="row justify-content-center bg-success recent-play-song-row">
                            <div class="col-xs-12 ">
                                <h2>Recent played songs</h2>
                            </div>                          
                        </div>

                        <div class="row justify-content-center bg-info playlist-row">
                            <div class="col-xs-12 ">
                                <h2>Playlists</h2>
                            </div>                          
                        </div>
                    </section>

                    <div class="clearfix"></div>
                    <!--body wrapper end-->		
                </div>







            </div>
        </main>

        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>
