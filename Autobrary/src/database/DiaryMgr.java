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
    
    //회원별 다이어리
    public Vector getDiary(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * " + 
            		"from diary " + 
            		"where mem_id = ? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	DiaryBean diaryBean = new DiaryBean();
            	diaryBean.setDiary_id(rs.getString("diary_id"));
            	diaryBean.setMem_id(rs.getString("mem_id"));
            	diaryBean.setBook_id(rs.getString("book_id"));
            	diaryBean.setPage(rs.getString("page"));
            	diaryBean.setSentence(rs.getString("sentence"));
            	diaryBean.setContent(rs.getString("content"));
            	diaryBean.setDiary_date(rs.getString("diary_date"));
            	vecList.add(diaryBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
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
