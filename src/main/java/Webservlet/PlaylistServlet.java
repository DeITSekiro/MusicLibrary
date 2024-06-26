/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Webservlet;

import DBUtil.MusicDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

import LibraryClass.Playlist;
import LibraryClass.Music;
import DBUtil.PlaylistDB;
import DBUtil.UserDB;
import LibraryClass.User;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.Part;
import org.owasp.encoder.Encode;

/**
 *
 * @author GIGABYTE
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 10 MB
        maxFileSize = 1024 * 1024 * 10, // 100 MB
        maxRequestSize = 1024 * 1024 * 100 // 1000 MB
)
public class PlaylistServlet extends HttpServlet {

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
        showAllPlaylist(request, response);
        String url = "/allPlaylist.jsp";
        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.addHeader("Content-Security-Policy", "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; "
                + "script-src 'self' 'unsafe-inline' https://code.jquery.com; "
                + "frame-ancestors 'self'; connect-src 'self'; img-src 'self'; frame-src 'self'; "
                + "media-src 'self' http://localhost:8080/MusicLibrary/songs; object-src 'self'; manifest-src 'self'; "
                + "form-action 'self'; "
                + "font-src 'self' https://cdn.linearicons.com https://fonts.gstatic.com;");
        response.setHeader("X-Frame-Options", "SAMEORIGIN");
        request.setCharacterEncoding("UTF-8");
        String url = "/Playlist.jsp";
        String message = "";
        String action = request.getParameter("action");

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
            User user = (User) request.getSession().getAttribute("loggeduser");
            long ID = user.getUserID();
            List<Playlist> playlist = PlaylistDB.selectPlaylist(user);
            request.setAttribute("playlist", playlist);
            //System.out.println(action);
            if (action != null) {
                if (action.equals("addPlaylist")) {
                    createPlaylist(request, response, ID);
                    message = "Playlist added";
                    playlist = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("playlist", playlist);
                    if (ID != 1) {
                        request.getSession().setAttribute("loggedUserPlaylists", playlist);
                    }
                    url = "/Playlist.jsp";
                }
                if (action.equals("Change cover")) {
                    updateCover(request, response, user);
                    message = "Cover changed";
                    request.setAttribute("message", message);
                    playlist = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("playlist", playlist);
                    url = "/Playlist.jsp";
                }
                if (action.equals("Delete playlist")) {
                    deletePlaylist(request, response);
                    message = "Playlist deleted";
                    request.setAttribute("message", message);
                    playlist = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("playlist", playlist);
                    url = "/Playlist.jsp";
                }
                if (action.equals("Rename playlist")) {
                    updatePlaylist(request, response);
                    playlist = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("playlist", playlist);
                    url = "/Playlist.jsp";
                }

                if (action.equals("Add Song to Playlist")) {
                    Long playlistID = Long.parseLong(request.getParameter("playlistID"));
                    Long songID = Long.parseLong(request.getParameter("songID"));
                    addSongToPlaylist(playlistID, songID);
                    String updateFlag = request.getParameter("updateUserInfo");
                    url = request.getParameter("currentURL");
                    if (updateFlag.equals("Yes")) {
                        message = "Added song to playlist!";
                        request.setAttribute("message", message);
                        //get user's uploaded songs
                        List<Music> userUploadedSongs = MusicDB.selectMusicbyUserID(user);
                        request.getSession().setAttribute("userUploadedSongs", userUploadedSongs);
                        //get user's playlists
                        List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
                        request.getSession().setAttribute("userPlaylists", userPlaylists);
                    }
                }
                if (action.equals("Add Song to Playlist Index")) {
                    Long playlistID = Long.parseLong(request.getParameter("playlistID"));
                    Long songID = Long.parseLong(request.getParameter("songID"));
                    addSongToPlaylist(playlistID, songID);
                    message = "Added song to playlist!";
                    request.setAttribute("message", message);
                    url = "/index.jsp";
                    //get user's playlists
                    List<Playlist> userPlaylists = PlaylistDB.selectPlaylist(user);
                    request.setAttribute("userPlaylists", userPlaylists);
                }
                if (action.equals("View playlist")) {
                    List<Playlist> randPlaylist = PlaylistDB.select8Playlist();
                    request.setAttribute("randPlaylist", randPlaylist);
                    Long playlistID = Long.parseLong(request.getParameter("playlistID"));
                    //get the selected playlist
                    Playlist selectedPlaylist = PlaylistDB.selectPlaylistByID(playlistID);
                    request.setAttribute("selectedPlaylist", selectedPlaylist);
                    //get the songs in the playlist
                    Set<Music> selectedPlaylistSongs = MusicDB.selectMusicInPlaylist(playlistID);
                    request.setAttribute("selectedPlaylistSongs", selectedPlaylistSongs);
                    //get playlist owner's name
//            User playlistOwner = selectedPlaylist.getUser();
//            String playlistOwnerName = UserDB.selectUserNameFromID(playlistOwner.getUserID());
//            request.setAttribute("playlistOwnerName", playlistOwnerName);
                    url = "/playlistDetails.jsp";
                }
                if (action.equals("Remove song from playlist")) {
                    Long playlistID = Long.parseLong(request.getParameter("selectedPlaylistID"));
                    Long songID = Long.parseLong(request.getParameter("deletingSongID"));
                    PlaylistDB.removeSongFromPlaylist(playlistID, songID);

                    //get data again to refresh the changes
                    Playlist selectedPlaylist = PlaylistDB.selectPlaylistByID(playlistID);
                    request.setAttribute("selectedPlaylist", selectedPlaylist);
                    //get the songs in the playlist
                    Set<Music> selectedPlaylistSongs = MusicDB.selectMusicInPlaylist(playlistID);
                    request.setAttribute("selectedPlaylistSongs", selectedPlaylistSongs);

                    url = "/playlistDetails.jsp";
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            url = "/index.jsp";
            request.setAttribute("Something went wrong.", message);
        } finally {
            getServletContext()
                    .getRequestDispatcher(url)
                    .forward(request, response);
        }
    }

    private void createPlaylist(HttpServletRequest request, HttpServletResponse response, long ID) {
        try {
            String playlistName = Encode.forHtml(request.getParameter("playlistName")); //XSS
            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            int PlaylistNameLength = playlistName.length();
            boolean playlistNameInvalid = playlistName.matches(".*[-;'\"].*");
            if (PlaylistNameLength > 30 || playlistNameInvalid) {
                String message = "Invalid PlaylistName";
                request.setAttribute("message", message);
                return;
            }
            Playlist playlist = new Playlist();
            playlist.setCreated(date);
            playlist.setCover("images/cover/default-cover.jpg");
            playlist.setName(playlistName);
            playlist.setCreated(date);
            PlaylistDB.addPlaylist(playlist, ID);
            String message = "Playlist created";
            request.setAttribute("message", message);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void deletePlaylist(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ID = request.getParameter("playlistID");
            long playlistID = Long.parseLong(ID);

            PlaylistDB.deletePlaylist(playlistID);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void updatePlaylist(HttpServletRequest request, HttpServletResponse response) {
        try {
            String ID = Encode.forHtml(request.getParameter("playlistID"));
            long playlistID = Long.parseLong(ID);
            String Name = request.getParameter("renamePlaylist");
            int PlaylistNameLength = Name.length();
            boolean playlistNameInvalid = Name.matches(".*[-;'\"].*");
            if (PlaylistNameLength > 30 || playlistNameInvalid) {
                String message = "Invalid PlaylistName";
                request.setAttribute("message", message);
                return;
            }
            Playlist playlist = new Playlist();
            playlist.setName(Name);
            playlist.setPlaylistID(playlistID);
            PlaylistDB.updatePlaylist(playlist);
            String message = "Platlist name renamed";
            request.setAttribute("message", message);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void addSongToPlaylist(long playlistID, Long songID) {
        try {
            Playlist playlist = new Playlist();
            playlist.setPlaylistID(playlistID);

            Set<Music> songs = new HashSet<>();
            Music song = new Music();
            song.setMusicID(songID);
            songs.add(song);

            PlaylistDB.addSongsToPlaylist(playlist, songs);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void updateCover(HttpServletRequest request, HttpServletResponse response, User user) {
        try {
            String ID = request.getParameter("playlistID");
            long playlistID = Long.parseLong(ID);
            String imgPath = PlaylistDB.selectPlaylistImage(playlistID);
            try {

                Part coverfile = request.getPart("cover");
                String type = coverfile.getContentType();
                if (type != null && (type.equals("image/jpeg") || type.equals("image/png"))) {
                    String rename = user.getUserID() + "playlist" + ID + ".jpg";
                    imgPath = "images/cover/" + rename;
                    String absolutePath = request.getServletContext().getRealPath(imgPath);
                    coverfile.write(absolutePath);
                } else {
                    imgPath = PlaylistDB.selectPlaylistImage(playlistID);
                }
            } catch (IOException | ServletException ex) {
                imgPath = PlaylistDB.selectPlaylistImage(playlistID);
                return;
            }
            Playlist playlist = new Playlist();
            playlist.setCover(imgPath);
            playlist.setPlaylistID(playlistID);
            PlaylistDB.updatePlaylistCover(playlist);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void showAllPlaylist(HttpServletRequest request, HttpServletResponse response) {
        try {
            List playlist = PlaylistDB.selectAllPlaylist();
            //Buffer overflow
            if (playlist != null) {
                request.setAttribute("allPlaylists", playlist);
            } else {
                // Nếu danh sách là null, tạo một danh sách rỗng
                List emptyList = Collections.emptyList();
                // Gán danh sách rỗng vào thuộc tính của request
                request.setAttribute("allPlaylists", emptyList);
            }
        } catch (Exception ex) {
            // Xử lý ngoại lệ một cách cẩn thận, ví dụ: ghi log lỗi
            ex.printStackTrace();
        }
    }
}
