<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import ="LibraryClass.Music" %>
<%@page import ="DBUtil.MusicDB" %>
<%@page import ="Utils.CSRF" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
    <head>
        <%
            // generate a random CSRF token
            String csrf_token = CSRF.getToken();

            // place the CSRF token in a cookie
            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("csrf", csrf_token);
            response.addCookie(cookie);
        %>

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
        <link rel="stylesheet" href="css/profile-style.css" type ='text/css'/>
        <!-- //lined-icons -->
        <!-- Meters graphs -->
        <script src="js/jquery-2.1.4.js"></script>
        <script src="js/play_music_script.js"></script>
        <script>
            function passSongNameAndIDToModal(name, ID) {
                var inputElement = document.getElementById('deletingSongID');
                inputElement.value = ID;
                inputElement.setAttribute('value', ID);
                document.getElementById("modelSongName").innerText = "Are you sure you want to delete " + name;
            }
        </script>
        <script>
            function passIDToModal(ID) {
                var inputElement = document.getElementById('songID');
                inputElement.value = ID;
                inputElement.setAttribute('value', ID);
                document.getElementById('my_form').submit()
            }
        </script>

        <script>
            function setToArtistID_SubmitForm(ID) {
                var inputElement = document.getElementById('toArtistID');
                inputElement.value = ID;
                inputElement.setAttribute('value', ID);
                document.getElementById('toArtistProfileForm').submit();
            }
        </script>
    </head>
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
                        <li  class="active"><a href="admin?action=showAllMusic"><i class="lnr lnr-music-note"></i> <span>Songs</span></a></li>
                        <li><a href="admin?action=showAllArtist"><i class="lnr lnr-users"></i> <span>Artists</span></a></li>
                        <li><a href="admin?action=showAllPlaylist"><i class="lnr lnr-text-align-justify"></i> <span>Albums</span></a></li>						
                    </ul>
                    <!--sidebar nav end-->
                </div>
            </div>
            <!-- left side end-->
            <!-- app-->
            <!-- //app-->
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
                                    <div class="sign-right">
                                        <form action="login" method="post" onsubmit="return validateForm()">
                                            <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
                                            <h3>Create your account </h3>
                                            <input type="hidden" name="action" value="registerUser">
                                            <label>Name</label><br>
                                            <input type="text" name="Name"  required>
                                            <label>Phone number</label><br>
                                            <input type="number" name="Number"  required>
                                            <label>Email</label><br>
                                            <input type="text" name="Email" required>	
                                            <label>Password</label><br>
                                            <input type="password" name="Password" required>	

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
                                        <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
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
                                    <li><a class="ar" onclick="playPrevious()"> <img src="images/arrow.png" alt=""/></a></li>
                                    <li><a class="ar2" onclick="playNext()"><img src="images/arrow2.png" alt=""/></a></li>
                                </ul>	
                            </div>
                            <div class="col-md-4 login-pop">
                                <c:choose>
                                    <c:when test="${loggeduser == null}">
                                        <div id="loginpop"> <a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                            <div id="loginBox">  
                                                <form action="login" method="post" id="loginForm">
                                                    <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
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
                                                        <input type="submit" id="login" value="Sign in" onclick="showPopup()">
                                                        <label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
                                                    </fieldset>
                                                    <span><a href="#">Forgot your password?</a></span>
                                                </form>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${loggeduser.getUserID()!=1}">
                                            <div id="loginpop"> <a href="#" id="loginButton"><img class="miniprofile" src="${loggeduser.getImage()}"/></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"></a>
                                                <div id="loginBox" style="margin-top:10px">  
                                                    <form action="login" method="post" id="loginForm">
                                                        <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
                                                        <fieldset id="body">
                                                            <fieldset>
                                                                <label>Username = ${loggeduser.getName()}</label>
                                                            </fieldset>
                                                            <fieldset>
                                                                <label>Email = ${loggeduser.getGmail()}</label>
                                                            </fieldset>
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
                                                        <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
                                                        <fieldset id="body">
                                                            <fieldset>
                                                                <label>Username = ${loggeduser.getName()}</label>
                                                            </fieldset>
                                                            <fieldset>
                                                                <label>Email = ${loggeduser.getGmail()}</label>
                                                            </fieldset>
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
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <!-------->
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal fade" id="addToPlaylist" tabindex="-1" role="dialog" aria-labelledby="modalLabelLarge" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h4 class="modal-title" id="modalLabelLarge">Add song to playlist:</h4>
                            </div>
                            <form action="search" method="post">
                                <div class="modal-body">

                                    <select class="form-control input-lg" name="addPlaylistID">
                                        <c:forEach items="${loggedUserPlaylists}" var="userPlaylist">
                                            <option value="${userPlaylist.getPlaylistID()}">${userPlaylist.getName()} playlist</option>
                                        </c:forEach>
                                    </select>

                                </div>
                                <div class="modal-footer">
                                    <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
                                    <input type="hidden" id="songID" name="songID">
                                    <input type="hidden" name="songSearch" value ="${pattern}">
                                    <input type="submit" name="action" value="Add Song to Playlist" class="btn btn-secondary">
                                </div>
                            </form>
                        </div>
                    </div>
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
                                    <h3 class="tittle"> Featured Artists </h3>
                                    <div class="clearfix"> </div>
                                </div>

                                <div id="myTabContent" class="tab-content">
                                    <form method="post" action="login" id="toArtistProfileForm">
                                        <input type="hidden" name="csrf_token" value="<%= csrf_token%>"/>
                                        <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                                            <%--<c:forEach items="${allArtists}" begin="0" step="6" var="artist" varStatus="status">--%>
                                            <div class="browse-inner">
                                                <div class="row justify-content-center equal-height">

                                                    <c:forEach items="${allArtists}" var="artist" >
                                                        <div class="col-xs-4 col-lg-2 max-height-col padding-bottom">
                                                            <a id="toArtistSubmitBtn" onclick="setToArtistID_SubmitForm(${artist.getUserID()})">
                                                                <div class="thumbnail artist-thumbnail">

                                                                    <img src="${artist.getImage()}" alt="${artist.getName()} image"
                                                                         class="img-rounded img-responsive"       

                                                                         <div class="caption music-info">
                                                                        <div class="artist-info">
                                                                            <span class="art" href="#">${artist.getName()}</span>
                                                                        </div>
                                                                    </div>
                                                            </a>
                                                        </div>

                                                    </c:forEach>
                                                    <input type="hidden" name="toArtistID" id="toArtistID">
                                                    <input type="hidden" name="action" value="toArtistProfile">

                                                </div>

                                            </div>

                                            <!-- /agileits -->
                                            <%--<c:forEach items="${allArtists}" begin="${(status.count - 1) * 6}" end="${(status.count - 1) * 6 + 6}" var="artist" >--%>

                                            <%--<c:forEach items="${allArtists}" var="artist" >--%>

                                            <!--                                                    <div class="col-md-3 artist-grid">
                                                                                                    <div class="album-img-container">
                                                                                                        <div>
                                            
                                                                                                        </div>
                                                                                                        <a  href="#"><img src="${artist.getImage()}" title="allbum-name"></a> 
                                                                                                    </div>
                                                                                                    <div class="artist-info">
                                                                                                        <a class="art" href="#">${artist.getName()}</a>
                                                                                                    </div>
                                                                                                </div>-->
                                            <%--</c:forEach>--%>

                                            <%--</c:forEach>--%>
                                            <div class="clearfix"> </div>
                                        </div>
                                    </form
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="clearfix"> </div>              
                    <!--//discover-view-->
                    <!--//music-left-->

                    <!--body wrapper start-->
                </div>
                <div class="clearfix"></div>
                <!--body wrapper end-->
                <div class = "modal fade" id = "deleteSongModal" tabindex = "-1" role = "dialog" aria-labelledby = "exampleModalLabel"
                     aria-hidden="true">
                    <div class = "modal-dialog" role = "document">
                        <div class = "modal-content">
                            <form action="admin">
                                <div class = "modal-header">
                                    <button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close">
                                        <span aria-hidden = "true"> × </span>
                                    </button>
                                    <h4 class = "modal-title" id = "exampleModalLabel"> Deleting song </h4>
                                </div>
                                <div class = "modal-body"><span id="modelSongName"></span></div>
                                <div class = "modal-footer">
                                    <input type="hidden" name="csrf_token" value="<%= csrf_token %>"/>
                                    <input type="hidden" id="deletingSongID" name="deletingSongID">
                                    <button type = "button" class = "btn btn-secondary" data-dismiss = "modal"> Cancel </button>
                                    <button type = "submit" name="action" value="deleteSongAdmin" class = "btn btn-primary"> Confirm </button>
                                </div>
                            </form

                        </div>
                    </div>
                </div>
                <!-- /w3l-agile-info -->
            </div>
            <!--body wrapper end-->
            <div class="footer">
                <div class="footer-grid">
                    <h3>Group members:</h3>
                </div>
                <div class="footer-grid">
                    <h3>Trần Mạnh Tiến</h3>
                </div>
                <div class="footer-grid">
                    <h3>Dương Đức Khải</h3>

                </div>
                <div class="footer-grid">
                    <h3>Mai Trọng Vũ</h3>
                </div>
            </div>
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
