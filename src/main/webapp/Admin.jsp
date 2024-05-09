
<%@page import="java.util.List"%>
<%@page import ="LibraryClass.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
    <head>
        <%  List<User> allUser = (List<User>) request.getAttribute("allUser"); %>

        <title>Mosaic a Entertainment Category Flat Bootstrap Responsive Website Template | Blogs :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
        <link href="css/style.css" rel='stylesheet' type='text/css' />
        <link href="css/font-awesome.css" rel="stylesheet"> 
        <link rel="stylesheet" href="css/icon-font.css" type='text/css' />
        <script src="js/jquery-2.1.4.js"></script>
        <script src="js/play_music_script.js"></script>
        <script>
            function passToModal(userID, name, password) {
                document.getElementById('userName').value = name;
                document.getElementById('userNameforSong').value = name;
                document.getElementById('userPassword').value = password;
                var inputElement = document.getElementById('userID');
                inputElement.value = userID;
                inputElement.setAttribute('value', userID);
                var inputElementforSong = document.getElementById('userIDforSong');
                inputElementforSong.value = userID;
                inputElementforSong.setAttribute('value', userID);
            }
        </script>
    </head> 
    <!-- /w3layouts -->
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
            <!-- /agileinfo -->
            <!-- /agile-its -->
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
                                        <form action="admin" method="post" enctype="multipart/form-data">
                                            <h3>Account Configured: </h3>
                                            <input type="hidden" name="action" value="configUser" >
                                            <input id="userID" type="hidden" name="userID" >
                                            <label>Name: </label><input id="userName" type="text" name="userName"  required>
                                            <label>Password: </label><input id="userPassword" type="password" name="userPass" required>	
                                            <input class="form-control-file" id="profilePhoto" type="file" name="userprofileforAdmin" accept="image/png, image/jpeg"/>
                                            <input type="submit" value="Accept" >
                                        </form>
                                    </div>
                                    <div class="clearfix"></div>								
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content modal-info">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
                        </div>
                        <div class="modal-body modal-spa">
                            <div class="sign-grids">
                                <div class="sign">
                                    <form method="post" action="admin" enctype="multipart/form-data">
                                        <div class="form-row">
                                            <input type="hidden" name="userIDforSong"
                                                   id="userIDforSong">
                                            <input type="hidden" name="action" value="addSongforUser">
                                            <div class="form-group col-md-6">
                                                <label for="name" >Song's name</label>
                                                <input type="text" class="form-control" name="musicName"
                                                       id="name" placeholder="Name">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="author">Author</label>
                                                <input id="userNameforSong" type="text" class="form-control"
                                                       name="musicAuthor"  disabled>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="image" class="custom-file-upload">Cover image</label>
                                                <input type="file" name= "imageFile"
                                                       class="form-control" id="image">                              
                                            </div>


                                            <div class="form-group col-md-6">
                                                <label for="category">Category</label>
                                                <select name="musicCategory" id="category" class="form-control">
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
                                            <div class="form-group col-md-6">
                                                <label for="musicFile">Song's file - accepts mp3 only</label>
                                                <input type="file" name="musicFile"
                                                       class="form-control" id="musicFile">
                                            </div>    
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-xs-12">
                                                <button type="submit" class="btn btn-primary">Upload</button>

                                            </div>
                                        </div>
                                    </form>
                                    <div class="clearfix"></div>								
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //signup -->
            <!-- /w3layouts-agile -->
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
                <!-- /w3l-agile -->
                <!--notification menu end -->
                <!-- //header-ends -->
                <div id="page-wrapper">
                    <div class="inner-content">
                        <!-- /blog -->

                        <div class="tittle-head">
                            <h3 class="tittle">Admin</h3>
                            <div class="clearfix"> </div>
                        </div>
                        <!-- /music-left -->
                        <div class="music-left">
                            <div class="widget-side">
                                <h4 class="widget-title">All accounts</h4>
                                <form action="admin"> 
                                    <button class="btn" type="submit" name="action" value="showAllMusic">All Music</button>
                                    <button class="btn" type="submit" name="action" value="showAllPlaylist">All Playlist</button>
                                </form>
                                <p>${message}</p>
                                <ul>
                                    <% for (int i = 1; i < allUser.size(); i++) {
                                            User u = allUser.get(i);
                                    %>
                                    <li>
                                        <div class="song-img">
                                            <a href="single.html"><img src="<%=u.getImage()%>" class="img-responsive" alt="" /></a>
                                        </div>
                                        <div class="song-text">
                                            <form action="admin" method="post">   
                                                <a href="single.html"><%=u.getName()%></a>
                                                <span class="post-date">Email: <%=u.getGmail()%></span><br>
                                                <span class="post-date">Password: <%=u.getPass()%></span><br>
                                                <span class="post-date"><%=u.getCreated()%></span>
                                                <input type="hidden" name="userID" value="<%=u.getUserID()%>">
                                                <button class="btn adminbtn" type="submit" name ="action" value="deleteUser">Delete</button>
                                                <button class="btn adminbtn"name ="action" value=""><a href="#" data-toggle="modal" data-target="#myModal5" style="text-decoration:none;" onclick="passToModal(<%=u.getUserID()%>, '<%=u.getName()%>', '<%=u.getPass()%>')">Config</a></button>
                                                <button class="btn adminbtn"name ="action" value=""><a href="#" data-toggle="modal" data-target="#myModal6" style="text-decoration:none;" onclick="passToModal(<%=u.getUserID()%>, '<%=u.getName()%>', '<%=u.getPass()%>')">Add Song</a></button>
                                            </form>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                    <% };
                                    %> 
                                </ul>
                            </div>

                        </div>
                        <!-- //music-left-->
                        <!-- /music-right-->
                        <div class="music-right">
                            <!-- //widget -->
                            <div class="widget-side second">
                                <h4 class="widget-title">Uploaded Songs</h4>  
                                <ul>


                                    <c:forEach items="${recentSong}" var="Song">
                                        <li>
                                            <div class="song-img">
                                                <img src="${Song.getImage()}" class="img-responsive" onclick="createNewPlaylist(${Song.getMusicID()}, '${Song.getName()}', '${Song.getAuthor().getName()}')"></div>
                                            <div class="song-text">
                                                <a>${Song.getName()}</a>
                                                <span class="post-date">${Song.getCreated()}</span>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- //widget -->
                        </div>
                        <div class="clearfix"></div>
                        <!-- //blog -->
                    </div>
                    <div class="clearfix"></div>
                    <!--body wrapper end-->
                    <!-- /w3l-agile -->
                </div>
                <!--body wrapper end-->
                <div class="footer two">
                    <div class="footer-grid">
                        <h3>Navigation</h3>
                        <ul class="list1">
                            <li><a href="index.html">Home</a></li>
                            <li><a href="radio.html">All Songs</a></li>
                            <li><a href="browse.html">Albums</a></li>
                            <li><a href="radio.html">New Collections</a></li>
                            <li><a href="blog.html">Blog</a></li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <div class="footer-grid">
                        <h3>Our Account</h3>
                        <ul class="list1">
                            <li><a href="#" data-toggle="modal" data-target="#myModal5">Your Account</a></li>
                            <li><a href="#">Personal information</a></li>
                            <li><a href="#">Addresses</a></li>
                            <li><a href="#">Discount</a></li>
                            <li><a href="#">Orders history</a></li>
                            <li><a href="#">Addresses</a></li>
                            <li><a href="#">Search Terms</a></li>
                        </ul>
                    </div>
                    <div class="footer-grid">
                        <h3>Our Support</h3>
                        <ul class="list1">
                            <li><a href="contact.html">Site Map</a></li>
                            <li><a href="#">Search Terms</a></li>
                            <li><a href="#">Advanced Search</a></li>
                            <li><a href="#">Mobile</a></li>
                            <li><a href="contact.html">Contact Us</a></li>
                            <li><a href="#">Mobile</a></li>
                            <li><a href="#">Addresses</a></li>
                        </ul>
                    </div>
                    <div class="footer-grid">
                        <h3>Newsletter</h3>
                        <p class="footer_desc">Nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat</p>
                        <div class="search_footer">
                            <form>
                                <input type="text" placeholder="Email...." required="">
                                <input type="submit" value="Submit">
                            </form>
                        </div>
                    </div>
                    <div class="footer-grid footer-grid_last">
                        <h3>About Us</h3>
                        <p class="footer_desc">Diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat enim ad minim veniam,.</p>
                        <p class="f_text">Phone:  &nbsp;&nbsp;&nbsp;00-250-2131</p>
                        <p class="email">Email : &nbsp;<span><a href="mailto:mail@example.com">info(at)mailing.com</a></span></p>	
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            <!-- /wthree-agile -->
            <!--footer section start-->
            <footer>
                <p>&copy 2023 Web programming project. Music Library  Reserved | Design by Group 2</p>
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