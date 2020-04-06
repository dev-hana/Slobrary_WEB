package db;

import java.sql.*;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import beans.ReviewBean;
import beans.SignUpBean;


public class UserMgr {

    private DBConnectionMgr pool = null;

    public UserMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    

    public boolean checkEmail(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            
            String strQuery = "select email from user where email = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }


    public boolean insertUser(SignUpBean suBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            
            String strQuery = "insert into user values(?,?,?)";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1,suBean.getMem_email());
			pstmt.setString(2, suBean.getMem_passwd());
			pstmt.setString(3,"DefaultUserImg.png");
            int count = pstmt.executeUpdate();
            
            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
    
    public boolean loginCheck(String email, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select email, password from user where email = ? and password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
    
    public boolean setProfile(HttpServletRequest req) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
    	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"3_JspProject/WebContent/image/UserDB";
        
    	
        try {
        	con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
            
            String query = "update user set image = ? where email = ?";

            if (multi.getFilesystemName("image") == null) {
            	pstmt = con.prepareStatement(query);
                pstmt.setString(1, "DefaultUserImg.png");
                pstmt.setString(2, multi.getParameter("email"));
            } else {
            	pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getFilesystemName("image"));
                pstmt.setString(2, multi.getParameter("email"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public SignUpBean getUser(String email) {
    	System.out.println(email);
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        SignUpBean suBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from user where email=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                suBean = new SignUpBean();
                suBean.setMem_email(rs.getString("email"));
                suBean.setMem_passwd(rs.getString("password"));
                suBean.setMem_image(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return suBean;
    }
    
    public Vector getUserList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vUser = new Vector();
     

        try {
            con = pool.getConnection();
            String query = "select * from user order by email desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                SignUpBean signUpBean = new SignUpBean();
                
                signUpBean.setMem_email(rs.getString("email"));
                signUpBean.setMem_passwd(rs.getString("password"));
                
                vUser.add(signUpBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vUser;
    }
    
    public boolean updateUser(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
     	uploadDir =uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"3_JspProject/WebContent/image/UserDB";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update user set email = ?, password = ?, image = ? where email = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("mem_email"));
                pstmt.setString(2, multi.getParameter("mem_passwd"));
                pstmt.setString(3, "DefaultUserImg.png");
                pstmt.setString(4, multi.getParameter("current_email"));
            } else {
            	String query = "update user set email = ?, password = ?, image = ? where email = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("mem_email"));
                pstmt.setString(2, multi.getParameter("mem_passwd"));
                pstmt.setString(3, multi.getParameter("mem_image"));
                pstmt.setString(4, multi.getParameter("current_email"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public boolean deleteUser(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from user where email = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public boolean adminCheck(String admin_id, String admin_passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id, password from admin where id = ? and password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, admin_id);
            pstmt.setString(2, admin_passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }
   
}
