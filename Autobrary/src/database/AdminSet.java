package database;

import java.sql.*;
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
}
