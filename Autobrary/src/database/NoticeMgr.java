package database;

import java.sql.Connection;
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
}
