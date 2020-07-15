package database;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;
import java.util.Vector;

import database.AdminBean;
import encryption.PBKDF2_Encryption;

/*
 * 작성자: 장지은
 * 파일 이름: AdminSet.java
 * 목적: 관리자 로그인 확인
 */

public class AdminSet {
	private DBConnectionMgr pool = null;

    public AdminSet() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
 
    public boolean adminCheck(String admin_id, String admin_passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id, passwd from admin_info where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	/**
            	 * PBKDF2_Encryption.validatePassword 함수를통해 비밀번호를 검증 및 결과 리턴. 2020.04.02 수정.
            	 * @수정 devstar1224
            	 */
            	String hashData = rs.getString("passwd");
            	if(PBKDF2_Encryption.validatePassword(admin_passwd, hashData)){
            		return true;
            	}
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    
    public boolean masterCheck(String admin_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String rank="";
        try {
            con = pool.getConnection();
            String strQuery = "select a_rank from admin_info where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	rank = rs.getString("a_rank");
            	if(rank.contentEquals("master")) return true;
            }
            	
            	
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return flag;
    }
    
  

    
    public AdminBean getName(String admin_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        AdminBean adBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select id, name from admin_info where id=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	adBean = new AdminBean();
            	adBean.setAdmin_id(rs.getString("id"));
            	adBean.setName(rs.getString("name"));
            }
            	
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return adBean;
    }
    
    public Vector getAdminList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select id, name, phone, add_date, a_rank from admin_info ";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                AdminBean adBean = new AdminBean();
                adBean.setAdmin_id(rs.getString("id"));
                adBean.setName(rs.getString("name"));
                adBean.setPhone(rs.getString("phone"));
                adBean.setDate(rs.getString("add_date"));
                adBean.setRank(rs.getString("a_rank"));
                
                vecList.add(adBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public Vector getRequList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from admin_request ";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                ArequestBean aqBean = new ArequestBean();
                aqBean.setId(rs.getString("id"));
                aqBean.setName(rs.getString("name"));
                aqBean.setPhone(rs.getString("phone"));
                aqBean.setDate(rs.getString("req_date"));
                aqBean.setPasswd(rs.getString("passwd"));
                aqBean.setRank(rs.getString("a_rank"));
                vecList.add(aqBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public ArequestBean getArequest(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArequestBean aqBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from admin_request where id=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	aqBean = new ArequestBean();
                aqBean.setId(rs.getString("id"));
                aqBean.setName(rs.getString("name"));
                aqBean.setPhone(rs.getString("phone"));
                aqBean.setDate(rs.getString("req_date"));
                aqBean.setPasswd(rs.getString("passwd"));
                aqBean.setPasswd(rs.getString("passwd"));
                aqBean.setRank(rs.getString("a_rank"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return aqBean;
    }
    
    
    public boolean IdCheck(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        
        try {
        	con = pool.getConnection();
        	String strQuery = "select count(id) from admin_info where id = ? ";
        	pstmt = con.prepareStatement(strQuery);
        	pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	int count = rs.getInt(1);
            	if(count == 0) return true;
            }
        }catch (Exception ex) {//
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public boolean IdRequCheck(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        
        try {
        	con = pool.getConnection();
        	String strQuery = "select count(id) from admin_request where id = ? ";
        	pstmt = con.prepareStatement(strQuery);
        	pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	int count = rs.getInt(1);
            	if(count == 0) return true;
            }
        }catch (Exception ex) {//
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
   
    
    public boolean insertAdminRequ(String id, String pwd, String name, String phone, String rank) throws NoSuchAlgorithmException, InvalidKeySpecException {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String pwd_ = PBKDF2_Encryption.createHash(pwd);
        String sql = "insert into admin_request(id, passwd, name, phone, a_rank) values (?, ?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id);
        	pstmt.setString(2, pwd_);
        	pstmt.setString(3, name);
        	pstmt.setString(4, phone);
        	pstmt.setString(5, rank);
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
    
    public boolean confirmAdmin(ArequestBean reqBean){
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "insert into admin_info(id, passwd, name, phone, a_rank) values (?, ?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, reqBean.getId());
        	pstmt.setString(2, reqBean.getPasswd());
        	pstmt.setString(3, reqBean.getName());
        	pstmt.setString(4, reqBean.getPhone());
        	pstmt.setString(5, reqBean.getRank());
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
    
    public boolean deleteArequest(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "delete from admin_request where id = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id);
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
