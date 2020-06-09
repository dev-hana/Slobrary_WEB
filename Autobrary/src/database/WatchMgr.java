package database;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bucketConnector.BucketManager;
import database.DBConnectionMgr;

public class WatchMgr {
	private DBConnectionMgr pool = null;

    public WatchMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public String countWatch(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    	String count = null;
    	
    	try {
            con = pool.getConnection();
            String strQuery = "select count(*) from watch_list where mem_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            if (rs.next()){
            	count = rs.getString("count(*)");
            }
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
    	
    	return count;
    }
    
    public Vector getWatch3(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select book_id, watch_date " + 
            		"from watch_list " + 
            		"where mem_id = ? order by watch_date desc LIMIT 3 ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 WatchBean watchBean = new WatchBean();
            	 watchBean.setBook_id(rs.getString("book_id"));
            	 watchBean.setDate(rs.getString("watch_date"));           

                 vecList.add(watchBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }
    
    public Vector getWatch(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select book_id " + 
            		"from watch_list " + 
            		"where mem_id = ? order by watch_date desc ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 WatchBean watchBean = new WatchBean();
            	 watchBean.setBook_id(rs.getString("book_id"));         

                 vecList.add(watchBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }

}
