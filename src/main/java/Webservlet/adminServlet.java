/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Webservlet;

import DBUtil.MusicDB;
import DBUtil.PlaylistDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBUtil.UserDB;
import LibraryClass.Music;
import LibraryClass.Playlist;
import LibraryClass.User;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.http.Cookie;

/**
 *
 * @author GIGABYTE
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 10 MB
        maxFileSize = 1024 * 1024 * 10, // 100 MB
        maxRequestSize = 1024 * 1024 * 100 // 1000 MB
)
public class adminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.addHeader("Content-Security-Policy", "default-src 'self'; "
//                + "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
//                + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
//                + "frame-ancestors 'self'; "
//                + "media-src 'self' http://localhost:8080/MusicLibrary/songs; "
//                + "font-src 'self' https://cdn.linearicons.com https://fonts.gstatic.com;");
//        response.setHeader("X-Frame-Options", "DENY");
        String action = request.getParameter("action");
        String url = "/Admin.jsp";
        User user = (User) request.getSession().getAttribute("loggeduser");
        try {
            if (user != null) {
                List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
                request.setAttribute("userPlaylists", userPlaylists);
            }
            if (action != null) {
                if (action.equals("showAllMusic")) {
                    url = "/allMusic.jsp";
                    List<Music> music = MusicDB.selectAllMusic();
                    request.setAttribute("allMusic", music);
                }
                if (action.equals("showAllPlaylist")) {
                    List<Playlist> playlist = PlaylistDB.selectAllPlaylist();
                    request.setAttribute("allPlaylists", playlist);
                    url = "/allPlaylist.jsp";
                }
                if (action.equals("showAllArtist")) {
                    List<User> allUsers = UserDB.selectAllUserExceptAdmin();
                    request.setAttribute("allArtists", allUsers);
                    url = "/allArtist.jsp";
                }
                if (action.equals("deleteSongAdmin")) {
                    deleteSongAdmin(request, response);
                    url = "/allMusic.jsp";
                    List<Music> music = MusicDB.selectAllMusic();
                    request.setAttribute("allMusic", music);
                }
                if (action.equals("deletePlaylistAdmin")) {
                    deletePlaylistAdmin(request, response);
                    url = "/allPlaylist.jsp";
                    List<Playlist> playlist = PlaylistDB.selectAllPlaylist();
                    request.setAttribute("allPlaylists", playlist);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.addHeader("Content-Security-Policy", "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
                + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
                + "frame-ancestors 'self'; connect-src 'self'; img-src 'self'; frame-src 'self'; "
                + "media-src 'self' http://localhost:8080/MusicLibrary/songs; object-src 'self'; manifest-src 'self'; "
                + "form-action 'self'; "
                + "font-src 'self' https://cdn.linearicons.com/free/1.0.0/Linearicons-Free.woff2 https://cdn.linearicons.com/free/1.0.0/Linearicons-Free.ttf https://cdn.linearicons.com/free/1.0.0/Linearicons-Free.woff;");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        String url = "/Admin.jsp";
        String message = null;
        String action = request.getParameter("action");
        List<Music> music = MusicDB.select12Songs();
        request.setAttribute("recentSong", music);

        // get the CSRF cookie
        String csrfCookie = null;
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("csrf")) {
                csrfCookie = cookie.getValue();
            }
        }

        // get the CSRF form field
        String csrfField = request.getParameter("csrf_token");

        // validate CSRF
        if (csrfCookie == null || csrfField == null || !csrfCookie.equals(csrfField)) {
            try {
                //response.sendError(401);
                url = "/index.jsp";
                message = "Something went wrong.";
                request.setAttribute("message", message);
                action = null;
            } catch (Exception e) {
                // ...
            }
        }

        try {
            if (action != null) {
                if (action.equals("deleteUser")) {
                    deleteUser(request, response);
                }
                if (action.equals("configUser")) {
                    if (configUser(request, response)) {
                        message = "Update account successfully";
                    } else {
                        message = "Failed to update";
                    }
                }
                if (action.equals("addSongforUser")) {
                    message = addMusicforAdmin(request, response);
                }
                if (action.equals("deleteSongAdmin")) {
                    deleteSongAdmin(request, response);
                }
            }
            List<User> allUser = UserDB.selectAllUser();
            request.setAttribute("allUser", allUser);
            request.setAttribute("message", message);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ID = request.getParameter("userID");
            User u = new User();
            long userID = Long.parseLong(ID);
            u.setUserID(userID);
            UserDB.deleteUser(u);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private boolean configUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ID = request.getParameter("userID");
            String name = request.getParameter("userName");
            String pass = request.getParameter("userPass");
            boolean IDcheck = ID.matches(".*[=;()'\"].*");
            boolean NameInvalid = name.matches(".*[=;()'\"].*");
            int NameLoginLength = name.length();
            boolean PassInvalid = pass.matches(".*[=;()'\"\\s].*");
            int PassLoginLength = pass.length();
            if (NameInvalid || PassInvalid || IDcheck || NameLoginLength > 30 || PassLoginLength > 30) {
                return false;
            }

            long userID = Long.parseLong(ID);
            User user = UserDB.selectUserforAdmin(userID);
            String imgPath = user.getImage();
            try {
                Part userfile = request.getPart("userprofileforAdmin");
                String type = userfile.getContentType();
                if (type != null) {
                    if (type.equals("image/jpeg") || type.equals("image/png")) {
                        String rename = "user" + ID + ".jpg";
                        imgPath = "images/users_img/" + rename;
                        String absolutePath = request.getServletContext().getRealPath(imgPath);
                        userfile.write(absolutePath);
                    }
                }
            } catch (IOException | ServletException ex) {
                return false;
            }
            User u = new User();
            u.setUserID(userID);
            u.setName(name);
            u.setPass(pass);
            u.setImage(imgPath);
            boolean i = UserDB.updateUserbyAdmin(u);
            return i;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }

    private String addMusicforAdmin(HttpServletRequest request, HttpServletResponse response) {
        try {
            String name = request.getParameter("musicName");
            boolean AddNameInvalid = name.matches(".*[=;'\"].*");
            int AddNameLoginLength = name.length();
            String ID = request.getParameter("userIDforSong");
            boolean IDcheck = ID.matches(".*[=;'()\"].*");
            long userID = Long.parseLong(ID);
            User author = UserDB.selectUserforAdmin(userID);
            if (name.isEmpty() || AddNameInvalid || AddNameLoginLength > 30 || IDcheck) {
                return "Invalid Song Name or ID";
            }

            String category = request.getParameter("musicCategory");
            int liked = 0;
            int listen = 0;
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);

            String imgPath = "images/songs_img/default-song.png";

            Music music = new Music(name, author, category, liked, listen, imgPath, date);
            if (MusicDB.insertMusic(music)) {
                //get song file
                //if song file is not in the correct format, return error message
                //and delete the inserted music in database
                try {
                    Part songFile = request.getPart("musicFile");
                    String type = songFile.getContentType();
                    //mpeg is mp3
                    if (type != null) {
                        String rename;
                        if (type.equals("audio/mpeg")) {
                            rename = "song" + music.getMusicID() + ".mp3";
                        } else if (type.equals("audio/wav")) {
                            rename = "song" + music.getMusicID() + ".wav";
                        } else {
                            MusicDB.deleteMusic(music.getMusicID());
                            return "Song File is not in the correct format!";
                        }

                        String songPath = "songs/" + rename;
                        String absolutePath = request.getServletContext().getRealPath(songPath);
                        songFile.write(absolutePath);
                    } else {
                        MusicDB.deleteMusic(music.getMusicID());
                        return "Song file is empty!";
                    }
                } catch (IOException | ServletException ex) {
                    MusicDB.deleteMusic(music.getMusicID());
                    return "Failed to read Song File! Error: " + ex.toString();
                }

                //get image file
                try {

                    Part imageFile = request.getPart("imageFile");
                    String type = imageFile.getContentType();
                    if (type != null && (type.equals("image/jpeg") || type.equals("image/png"))) {
                        String rename = "song" + music.getMusicID() + ".jpg";
                        imgPath = "images/songs_img/" + rename;
                        String absolutePath = request.getServletContext().getRealPath(imgPath);
                        imageFile.write(absolutePath);
                    } else {
                        return "Song Uploaded but Image must be a JPG or PNG";
                    }
                } catch (IOException | ServletException ex) {
                    return "Song Uploaded but Failed to upload Song Image! Error: " + ex.toString();
                }

                music.setImage(imgPath);
                MusicDB.updateMusic(music);
                return "Upload song to " + author.getName() + " successfully";
            }

            return "Failed to upload song to " + author.getName();
        } catch (Exception ex) {
            ex.printStackTrace();
            return "Failed to upload song to ";
        }

    }

    private static void deleteSongAdmin(HttpServletRequest request, HttpServletResponse response) {
        try {
            String songId = request.getParameter("deletingSongID");
            long ID = Long.parseLong(songId);
            MusicDB.setMusicExistenceFalse(ID);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private static void deletePlaylistAdmin(HttpServletRequest request, HttpServletResponse response) {
        try {
            String playlistID = request.getParameter("playlistID");
            long ID = Long.parseLong(playlistID);
            PlaylistDB.deletePlaylist(ID);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
