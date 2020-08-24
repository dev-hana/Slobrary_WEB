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

public class DiaryMgr {
	private DBConnectionMgr pool = null;

    public DiaryMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public ReportBean getReport(String report_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReportBean reportBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * " + 
            		"from book_report " + 
            		"where report_id = ? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, report_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	reportBean = new ReportBean();
            	reportBean.setBook_id(rs.getString("book_id"));
            	reportBean.setMem_id(rs.getString("mem_id"));
            	reportBean.setReport_id(rs.getString("report_id"));
            	reportBean.setName(rs.getString("name"));
            	reportBean.setContent(rs.getString("content"));
            	reportBean.setReport_date(rs.getString("report_date"));
            	reportBean.setLocked(rs.getString("locked"));
            	          

                 
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return reportBean;
    }
    
    
    public boolean insertDiary(String mem_id, String book_id, String page, String content, String sentence) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "INSERT INTO diary(mem_id, book_id, page, sentence, content) "
        		+ "VALUES (?, ?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, mem_id);
        	pstmt.setString(2, book_id);
        	pstmt.setString(3, page);
        	pstmt.setString(4, sentence);
        	pstmt.setString(5, content);
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
