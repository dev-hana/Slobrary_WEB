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

public class BoardMgr {
	private DBConnectionMgr pool = null;

    public BoardMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public Vector getBoardList(String mem_id, String type) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String strQuery = "";
     
        try {
            con = pool.getConnection(); 
            if(type.equals("all")) {
            	strQuery = "select * from free_board ";
            	pstmt = con.prepareStatement(strQuery);
            }else if(type.equals("mem")) {
            	strQuery = "select * from free_board where mem_id = ? ";
            	pstmt = con.prepareStatement(strQuery);
            	pstmt.setString(1, mem_id);
            }
            
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	BoardBean boardBean = new BoardBean();
            	boardBean = new BoardBean();
             	boardBean.setBoard_id(rs.getString("board_id"));
             	boardBean.setMem_id(rs.getString("mem_id"));
             	boardBean.setTitle(rs.getString("title"));
             	boardBean.setContent(rs.getString("content"));
             	boardBean.setBoard_date(rs.getString("board_date"));
             	boardBean.setScope(rs.getString("scope"));

                 vecList.add(boardBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    
    public BoardBean getBoard(String board_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardBean boardBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * " + 
            		"from free_board " + 
            		"where board_id = ? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, board_id);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	boardBean = new BoardBean();
            	boardBean.setBoard_id(rs.getString("board_id"));
            	boardBean.setMem_id(rs.getString("mem_id"));
            	boardBean.setTitle(rs.getString("title"));
            	boardBean.setContent(rs.getString("content"));
            	boardBean.setBoard_date(rs.getString("board_date"));
            	boardBean.setScope(rs.getString("scope")); 
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return boardBean;
    }
    
    
    public boolean insertBoard(String mem_id, String title, String content, String scope) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "INSERT INTO free_board(mem_id, title, content, scope) "
        		+ "VALUES (?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, mem_id);
        	pstmt.setString(2, title);
        	pstmt.setString(3, content);
        	pstmt.setString(4, scope);
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
