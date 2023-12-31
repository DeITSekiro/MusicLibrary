    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBUtil;

import java.util.Set;
import java.util.HashSet;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import LibraryClass.Playlist;
import LibraryClass.User;
import LibraryClass.Music;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

/**
 *
 * @author GIGABYTE
 */
public class PlaylistDB {

    public static void addPlaylist(Playlist playlist, long user) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        User owner = em.find(User.class, user);
        playlist.setUser(owner);
        trans.begin();
        try {
            em.persist(playlist);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static List<Playlist> selectPlaylist(User userID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        String qString = "Select u FROM Playlist u " + "WHERE u.user = :id";
        TypedQuery<Playlist> q = em.createQuery(qString, Playlist.class);
        q.setParameter("id", userID);
        List<Playlist> playlist = null;
        try {
            playlist = q.getResultList();
            return playlist;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static Playlist selectPlaylistByID(Long playlistID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();

        trans.begin();
        try {
            Playlist playlist = em.find(Playlist.class, playlistID);
            return playlist;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static void addSongsToPlaylist(Playlist playlistID, Set<Music> addedSongs) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        Playlist playlist = em.find(Playlist.class, playlistID.getPlaylistID());
        try {
            Set<Music> oldSongs = playlist.getSongs();
            Set<Music> newSongs = new HashSet<Music>(oldSongs);
            newSongs.addAll(addedSongs);
            playlist.setSongs(newSongs);
            em.merge(playlist);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void removeSongFromPlaylist(long playlistID, long musicID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        Playlist playlist = em.find(Playlist.class, playlistID);
        Music removedSong = em.find(Music.class, musicID);
        trans.begin();
        try {
            Set<Music> newSongList = playlist.getSongs();
            newSongList.remove(removedSong);
            playlist.setSongs(newSongList);
            em.merge(playlist);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static String selectPlaylistImage(long playlistID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        Playlist playlist = em.find(Playlist.class, playlistID);
        return playlist.getCover();
    }

    public static void deletePlaylist(long playlistID) {
        EntityManager em = DButil.getFactory().createEntityManager();
        Playlist removeplaylist = em.find(Playlist.class, playlistID);
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        try {
            em.remove(em.merge(removeplaylist));
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        } finally {
            em.close();
        }
    }

    public static void updatePlaylist(Playlist newPlaylist) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        Playlist oldPlaylist = em.find(Playlist.class, newPlaylist.getPlaylistID());
        try {
            oldPlaylist.setName(newPlaylist.getName());
            em.merge(oldPlaylist);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        }
        em.close();
    }

    public static void updatePlaylistCover(Playlist newPlaylist) {
        EntityManager em = DButil.getFactory().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        trans.begin();
        Playlist oldPlaylist = em.find(Playlist.class, newPlaylist.getPlaylistID());
        try {
            oldPlaylist.setCover(newPlaylist.getCover());
            em.merge(oldPlaylist);
            trans.commit();
        } catch (Exception e) {
            System.out.println(e);
            trans.rollback();
        }
        em.close();
    }

    public static List<Playlist> selectAllPlaylist() {
        EntityManager em = DButil.getFactory().createEntityManager();
        String qString = "Select u FROM Playlist u";
        TypedQuery<Playlist> q = em.createQuery(qString, Playlist.class);
        List<Playlist> playlist = null;
        try {
            playlist = q.getResultList();
            return playlist;
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }

    public static List<Playlist> findPlaylist(String find) throws UnsupportedEncodingException {
        String decodedFind = URLDecoder.decode(find, StandardCharsets.UTF_8.toString());
        EntityManager em = DButil.getFactory().createEntityManager();
        String queryString = "SELECT u FROM Playlist u WHERE u.name LIKE :search";
        TypedQuery<Playlist> query = em.createQuery(queryString, Playlist.class);
        query.setParameter("search", "%" + decodedFind + "%");
        List<Playlist> result = query.getResultList();
        return result;
    }
           public static List<Playlist> select8Playlist(){
        EntityManager em = DButil.getFactory().createEntityManager();
         String queryString = "SELECT u FROM Playlist u";
         TypedQuery<Playlist> query = em.createQuery(queryString, Playlist.class);
          List<Playlist> result = query.getResultList();
          Collections.shuffle(result);
          int count = Math.min(result.size(), 8);
          return result.subList(0, count);
    }
            public static List<Playlist> selectFirst8Playlist(){
        EntityManager em = DButil.getFactory().createEntityManager();
         String queryString = "SELECT u FROM Playlist u";
         TypedQuery<Playlist> query = em.createQuery(queryString, Playlist.class);
         query.setMaxResults(8);
          List<Playlist> result = query.getResultList();
          return result;
    }
}
