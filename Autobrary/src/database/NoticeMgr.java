package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import database.NoticeBean;

public class NoticeMgr {
	private DBConnectionMgr pool = null;

    public NoticeMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public Vector getNoticeList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from notice";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                NoticeBean ntBean = new NoticeBean();
                ntBean.setNum(rs.getString("num"));
                ntBean.setAdmin_id(rs.getString("admin_id"));
                ntBean.setName(rs.getString("name"));
                ntBean.setDate(rs.getString("date"));
                ntBean.setContent(rs.getString("content"));
                
                vecList.add(ntBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public Vector getNoticeList5() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from notice order by date desc LIMIT 5 ";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                NoticeBean ntBean = new NoticeBean();
                ntBean.setNum(rs.getString("num"));
                ntBean.setAdmin_id(rs.getString("admin_id"));
                ntBean.setName(rs.getString("name"));
                ntBean.setDate(rs.getString("date"));
                ntBean.setContent(rs.getString("content"));
                
                vecList.add(ntBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public Vector getMyList(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from notice where admin_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	NoticeBean ntBean = new NoticeBean();
                ntBean.setNum(rs.getString("num"));
                ntBean.setAdmin_id(rs.getString("admin_id"));
                ntBean.setName(rs.getString("name"));
                ntBean.setDate(rs.getString("date"));
                ntBean.setContent(rs.getString("content"));
                
                vecList.add(ntBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return vecList;
    }
    
    public boolean inserNotice(String id, String name, String content) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "INSERT INTO notice(admin_id, name, content) "
        		+ "VALUES (?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, name);
        	pstmt.setString(3, content);
            int count = pstmt.executeUpdate();
            if (count == 1) {
                flag = true;
            }
        }catch (Exception ex) {//
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public NoticeBean getNotice(String num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        NoticeBean ntBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from notice where num=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	 ntBean = new NoticeBean();
            	
            	 ntBean.setNum(rs.getString("num"));
            	 ntBean.setAdmin_id(rs.getString("admin_id"));
            	 ntBean.setName(rs.getString("name"));
            	 ntBean.setContent(rs.getString("content"));
            	 ntBean.setDate(rs.getString("date"));

            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return ntBean;
    }
    
    
    
    public String searchId(String num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String id = "";
        
        try {
            con = pool.getConnection();
            String strQuery = "select admin_id from notice where num=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	 id = rs.getString("admin_id");          	
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return id;
    }
    
    public boolean updateNotice(String num, String name, String content) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "update notice set name = ?, content = ?, date=now() where num = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, name);
        	pstmt.setString(2, content);
        	pstmt.setString(3, num);
            int count = pstmt.executeUpdate();
            if (count == 1) {
                flag = true;
            }
        }catch (Exception ex) {//
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public boolean deleteNotice(String num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "delete from notice where num = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, num);
       
            int count = pstmt.executeUpdate();
            if (count == 1) {
                flag = true;
            }
        }catch (Exception ex) {//
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
}
