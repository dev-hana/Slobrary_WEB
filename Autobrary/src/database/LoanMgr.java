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

public class LoanMgr {
	private DBConnectionMgr pool = null;

    public LoanMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public String countLoaning(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    	String count = null;
    	
    	try {
            con = pool.getConnection();
            String strQuery = "select count(*) from book_loan where mem_id = ? and status = '대출' ";
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
    
    public String countLoaned(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
    	String count = null;
    	
    	try {
            con = pool.getConnection();
            String strQuery = "select count(*) from book_loan where mem_id = ? and status = '반납' ";
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

}
