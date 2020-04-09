package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import database.BookBean;
import database.DBConnectionMgr;

public class BookMgr {
	private DBConnectionMgr pool = null;

    public BookMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public Vector getBookList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from book_info";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                BookBean bookBean = new BookBean();
                bookBean.setId_num(rs.getString("id_num"));
                bookBean.setType(rs.getString("type"));
                bookBean.setName(rs.getString("name"));
                bookBean.setAuthor(rs.getString("author"));
                bookBean.setPublisher(rs.getString("publisher"));
                bookBean.setIssue(rs.getString("issue"));
                bookBean.setForm(rs.getString("form"));
                bookBean.setIsbn(rs.getString("isbn"));
                bookBean.setClass_id(rs.getString("class_id"));
                bookBean.setLanguage(rs.getString("language"));
                bookBean.setCollector(rs.getString("collector"));
                bookBean.setSign(rs.getString("sign"));
                bookBean.setStatus(rs.getString("status"));
                vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

}
