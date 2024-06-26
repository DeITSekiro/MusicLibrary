
<%@page import="java.util.List"%>
<%@page import="LibraryClass.Playlist"%>
<%@page import="LibraryClass.User"%>
<%@page import ="Utils.CSRF" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
    <%
        List<Playlist> playlist = (List<Playlist>) request.getAttribute("playlist");
    %>
    
    <%
            // generate a random CSRF token
            String csrf_token = CSRF.getToken();

            // place the CSRF token in a cookie
            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("csrf", csrf_token);
            response.addCookie(cookie);
        %>
    <head>
        <title>Mosaic a Entertainment Category Flat Bootstrap Responsive Website Template | Browse :: w3layouts</title>
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
        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>
        <script>
            function reloadPage() {
                document.location = document.location.href;
            }
        </script>
        <script>
            function passIDToModal(ID) {
                var inputElement = document.getElementById('PlaylistID');
                inputElement.value = ID;
                inputElement.setAttribute('value', ID);
            }
        </script>
    </head> 
    <!-- /w3layouts-agile -->
    <body class="sticky-header left-side-collapsed"  onload="initMap()">
        <section>
            <!-- left side start-->
            <div class="left-side sticky-left-side">

                <!--logo and iconic logo start-->
                <div class="logo">
                    <h1><a href="index.jsp">Mosai<span>c</span></a></h1>
                </div>
                <div class="logo-icon text-center">
                    <a href="index.jsp">M </a>
                </div>
                <!-- /w3l-agile -->
                <!--logo and iconic logo end-->
                <div class="left-side-inner">

                    <!--sidebar nav start-->
                    <ul class="nav nav-pills nav-stacked custom-nav">
                        <li><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
                        <li><a href="admin?action=showAllMusic"><i class="lnr lnr-music-note"></i> <span>Songs</span></a></li>
                        <li><a href="admin?action=showAllArtist"><i class="lnr lnr-users"></i> <span>Artists</span></a></li>
                        <li><a href="admin?action=showAllPlaylist"><i class="lnr lnr-text-align-justify"></i> <span>Albums</span></a></li>						
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>
            <!-- left side end-->
            <!-- /w3l-agile -->
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
                                    <div class="sign-right" style="width:85%">
                                        <form action="playlist" method="post">
                                            <input type="hidden" name="action" value="addPlaylist">
                                            <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                            <h3>Create a new playlist </h3>
                                            <label>Playlist's name:</label>
                                            <input type="text" name="playlistName">
                                            <input onclick="reloadPage()" type="submit" value="Create playlist" >
                                        </form>
                                    </div>
                                    <div class="clearfix"></div>								
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- //signup -->
            <!-- /agileits -->
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
                                    <form action="search" method="post">
                                        <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                        <input class="sb-search-input" placeholder="Search" type="search" name="songSearch" id="search">
                                        <input class="sb-search-submit" type="submit" name="action" value="search">
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
                                        <source src="" type="audio/ogg"></source>
                                        <source src="" type="audio/mpeg"></source>
                                        <source src="" type="audio/ogg"></source>
                                        <source src="" type="audio/mpeg"></source></audio>
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
                                    <li><div class="audio-info">
                                            <span id="songName"></span>
                                            <span id="songAuthor"></span> 
                                        </div></li>
                                    <li><a class="ar" href="#"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" href="#"><img src="images/arrow2.png" alt=""/></a></li>
                                </ul>	
                            </div>
                            <div class="col-md-4 login-pop">
                                <c:if test="${loggeduser.getUserID()!=1}">
                                    <div id="loginpop"> <a href="#" id="loginButton"><img class="miniprofile" src="${loggeduser.getImage()}"/></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                        <div id="loginBox" style="margin-top:10px">  
                                            <form action="login" method="post" id="loginForm">
                                                <fieldset id="body">
                                                    <fieldset>
                                                        <label>Username = ${loggeduser.getName()}</label>
                                                    </fieldset>
                                                    <fieldset>
                                                        <label>Email = ${loggeduser.getGmail()}</label>
                                                    </fieldset>
                                                    <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                                    <input type="submit" name="action" value="Playlist" > 
                                                    <input type="submit" name ="action" id="My profile" value="My profile">
                                                    <input type="submit" name ="action" id="setting" value="Setting">
                                                    <input type="submit" name="action" value="Log out" id="login" style="margin-top: 10px">
                                                </fieldset>   
                                            </form>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${loggeduser.getUserID() ==1}" >
                                    <div id="loginpop"> <a href="#" id="loginButton"><img class="miniprofile" src="${loggeduser.getImage()}"/></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                        <div id="loginBox">  
                                            <form action="login" method="post" id="loginForm">
                                                <fieldset id="body">
                                                    <fieldset>
                                                        <label>Username = ${loggeduser.getName()}</label>
                                                    </fieldset>
                                                    <fieldset>
                                                        <label>Email = ${loggeduser.getGmail()}</label>
                                                    </fieldset>
                                                    <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                                    <input type="submit" name ="action" value="Account Manager">
                                                    <input type="submit" name="action" value="Playlist" > 
                                                    <input type="submit" name ="action" id="My profile" value="My profile">
                                                    <input type="submit" name ="action" id="setting" value="Setting">
                                                    <input type="submit" name="action" value="Log out" id="login" style="margin-top: 10px">
                                                </fieldset>   
                                            </form>

                                        </div>
                                    </div>
                                </c:if>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-------->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!--notification menu end -->
                <!-- //header-ends -->
                <!-- /agileinfo -->
                <!-- //header-ends -->
                <div id="page-wrapper">
                    <div class="inner-content">
                        <div class="music-browse">
                            <!--albums-->
                            <!-- pop-up-box --> 
                            <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all">
                            <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
                            <script>
       $(document).ready(function () {
           $('.popup-with-zoom-anim').magnificPopup({
               type: 'inline',
               fixedContentPos: false,
               fixedBgPos: true,
               overflowY: 'auto',
               closeBtnInside: true,
               preloader: false,
               midClick: true,
               removalDelay: 300,
               mainClass: 'my-mfp-zoom-in'
           });
       });
                            </script>		
                            <!--//pop-up-box -->

                            <div class="browse">
                                <div class="tittle-head two">
                                    <h3 class="tittle">${loggeduser.getName()}'s Playlist</h3> <p><i>${message}</i></p>
                                    <a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><button class="btn">Create a new playlist</button></a>
                                    <a class="top-sign" href="admin?action=showAllPlaylist"><button class="btn">See all playlist</button></a>
                                    <div class="clearfix"> </div>

                                </div>
                                <% for (int i = 0; i < playlist.size(); i++) {
                                                                                 Playlist showplaylist = new Playlist();
                                                                                 showplaylist = playlist.get(i);%>
                                <div class="col-md-3 browse-grid">
                                    <form action="playlist" method="post"> 
                                        <input type="hidden" value="<%=showplaylist.getPlaylistID()%>" name="playlistID">
                                        <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                        <button name="action" value="View playlist" type="submit">
                                            <img src="<%=showplaylist.getCover()%>" style="width:215px;height:215px" ></button>
                                        <a class="sing" href="single.html"><%=showplaylist.getName()%></a>
                                        <a class="setting-button" data-toggle="modal" data-target="#myModal6" style="text-decoration:none;" onclick="passIDToModal(<%=showplaylist.getPlaylistID()%>)"><i class="fa fa-gear" style="font-size:24px"></i></a>
                                        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    </form> 
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content modal-info">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                                            </div>
                                            <div class="modal-body modal-spa">
                                                <div class="sign-grids">
                                                    <div class="sign">
                                                        <div class="sign-right" style="width:85%">
                                                            <form action="playlist" method="post" enctype="multipart/form-data">
                                                                <input id="PlaylistID" type="hidden" name="playlistID">
                                                                <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                                                <h3>Playlist Setting</h3>
                                                                <input type="file" name="cover">
                                                                <label>Playlist's new name:</label>
                                                                <input type="text" name="renamePlaylist" value="" >
                                                                <input  type="submit" name="action" value="Rename playlist" >
                                                                <input  type="submit" name="action" value="Change cover" >
                                                                <input type="submit" name="action" value="Delete playlist">
                                                            </form>
                                                        </div>
                                                        <div class="clearfix"></div>								
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%
                                };
                            %>
                            <!--//End-albums-->
                            <!--//discover-view-->
                            <!--//music-left-->
                        </div>

                        <!--body wrapper start-->
                    </div>
                    <div class="clearfix"></div>
                    <!--body wrapper end-->
                    <!-- /w3l-agile-info -->
                </div>
                <!--body wrapper end-->
            </div>
            <!--footer section start-->
            <footer>
                <p>&copy 2023 Web programming project. Music Library  Reserved | Design by Group 2</p>
            </footer>
            <!--footer section end-->
            <!-- /wthree-agile -->
            <!-- main content end-->
        </section>
        <!-- /wthree-agile -->
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/scripts.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.js"></script>
    </body>
</html>