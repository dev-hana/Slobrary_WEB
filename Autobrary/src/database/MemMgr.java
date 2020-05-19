package database;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.*;
import java.util.Vector;
import encryption.PBKDF2_Encryption;
import database.MemBean;
import database.DBConnectionMgr;

public class MemMgr {
	
	private DBConnectionMgr pool = null;

    public MemMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public boolean loginCheck(String mem_id, String passwd) {
    	 Connection con = null;
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         boolean flag = false;
         try {
             con = pool.getConnection();
             String strQuery = "select mem_id, passwd from member where mem_id = ? ";
             pstmt = con.prepareStatement(strQuery);
             pstmt.setString(1, mem_id);
             rs = pstmt.executeQuery();
             if(rs.next()) {
             	String hashData = rs.getString("passwd");
             	if(PBKDF2_Encryption.validatePassword(passwd, hashData)){
             		return true;
             	}
             }
         } catch (Exception ex) {
             System.out.println("Exception" + ex);
         } finally {
             pool.freeConnection(con, pstmt, rs);
         }
         
         return flag;
    }
    
    public boolean emailCheck(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "select email, withdrawal from member where email=?;";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()){
            	if(rs.getString("withdrawal")==null){
                	if(rs.getString("email")==null)
                		return false;
                	else 
                    	return true;
                } else {
                	return false;
                }
            }
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return flag;
    }
    
    public boolean IdCheck(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        
        try {
        	con = pool.getConnection();
        	String strQuery = "select count(mem_id) from member where mem_id = ? ";
        	pstmt = con.prepareStatement(strQuery);
        	pstmt.setString(1, mem_id);
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
    
    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select mem_id, name, gender, birth, phone, address, email, loan_status, add_date, withdrawal from member";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                MemBean memBean = new MemBean();
                if(rs.getString("withdrawal")==null) {
                	memBean.setMem_id(rs.getString("mem_id"));
                	memBean.setMem_name(rs.getString("name"));
                	memBean.setMem_gender(rs.getString("gender"));
                	memBean.setMem_phone(rs.getString("phone"));
                	memBean.setMem_birth(rs.getString("birth"));
                	memBean.setMem_date(rs.getString("add_date"));
                	memBean.setLoan_status(rs.getString("loan_status"));
                	vecList.add(memBean);
                }
            }
        }catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public MemBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemBean memBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from member where mem_id=?;";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();
            if (rs.next()){
            	if(rs.getString("withdrawal")==null){
                	memBean = new MemBean();
                	
                	memBean.setRFID(rs.getString("RFID"));
                	memBean.setMem_id(rs.getString("mem_id"));
                	memBean.setMem_name(rs.getString("name"));
                	memBean.setMem_gender(rs.getString("gender"));
                	memBean.setMem_phone(rs.getString("phone"));    	 
                	memBean.setMem_birth(rs.getString("birth"));
                    memBean.setMem_address(rs.getString("address"));
                	memBean.setMem_mail(rs.getString("email"));
                	memBean.setLoan_status(rs.getString("loan_status"));
                	memBean.setMem_date(rs.getString("add_date"));
                }
            }
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return memBean;
    }
    
  
    
    public String findId(String name, String birth, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String mem_id = null;

        try {
            con = pool.getConnection();
            String strQuery = "select mem_id, withdrawal from member where name = ? and birth = ? and email = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, name);
            pstmt.setString(2, birth);
            pstmt.setString(3, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	if(rs.getString("withdrawal")==null) {
            		mem_id = rs.getString("mem_id");
            	}
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return mem_id;
    }
    
    public String checkIdpw(String mem_id, String name, String birth, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String check = null;

        try {
            con = pool.getConnection();
            String strQuery = "select mem_id, withdrawal from member where mem_id = ? and name = ? and birth = ? and email = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, name);
            pstmt.setString(3, birth);
            pstmt.setString(4, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
            	if(rs.getString("withdrawal")==null) {
            		check = rs.getString("mem_id");
            	}
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return check;
    }
    
    public boolean updatepwd(String mem_id, String newpwd) throws NoSuchAlgorithmException, InvalidKeySpecException {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String pwd = PBKDF2_Encryption.createHash(newpwd);
        String sql = "update member set passwd = ? where mem_id = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, pwd);
        	pstmt.setString(2, mem_id);
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
    
    public boolean deleteMember(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "update member set withdrawal = now() where mem_id = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, mem_id);
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
    
    public boolean insertMember(String mem_id, String passwd, String name, String gender, String birth, String phone, String address, String email) throws NoSuchAlgorithmException, InvalidKeySpecException {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String pwd = PBKDF2_Encryption.createHash(passwd);
        String sql = "insert into member(mem_id, passwd, name, gender, birth, phone, address, email) values (?, ?, ?, ?, ?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, mem_id);
        	pstmt.setString(2, pwd);
        	pstmt.setString(3, name);
        	pstmt.setString(4, gender);
        	pstmt.setString(5, birth);
        	pstmt.setString(6, phone);
        	pstmt.setString(7, address);
        	pstmt.setString(8, email);
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
    
    
    public boolean memberUpdate(MemBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update member set phone=?, address=?, email =? where mem_id =? ";
            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_phone());
            pstmt.setString(2, regBean.getMem_address());
            pstmt.setString(3, regBean.getMem_mail());
            pstmt.setString(4, regBean.getMem_id());
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
    public Vector getMemberListS(String t, String r) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery;
            if(t.equals("all")) {
            	strQuery = "select mem_id, name, gender, birth, phone, address, email, loan_status, add_date, withdrawal from member"
            		+ " where mem_id = ? or rfid = ? or name = ?";
            	pstmt = con.prepareStatement(strQuery);
                pstmt.setString(1, r);
                pstmt.setString(2, r);
                pstmt.setString(3, r);
                rs = pstmt.executeQuery();
            }
            
            else if(t.equals("rfid")) { 
            	strQuery = "select mem_id, name, gender, birth, phone, address, email, loan_status, add_date, withdrawal from member"
            		+ " where rfid = ? ";
            	pstmt = con.prepareStatement(strQuery);
            	pstmt.setString(1, r);
            	rs = pstmt.executeQuery();
            }
            
            else if (t.equals("mem_id")) { 
            	strQuery = "select mem_id, name, gender, birth, phone, address, email, loan_status, add_date, withdrawal from member"
            		+ " where mem_id = ? ";
            	pstmt = con.prepareStatement(strQuery);
            	pstmt.setString(1, r);
            	rs = pstmt.executeQuery();
            }
            
            else if (t.equals("name")) { 
            	strQuery = "select mem_id, name, gender, birth, phone, address, email, loan_status, add_date, withdrawal from member"
            		+ " where name = ? ";
            	pstmt = con.prepareStatement(strQuery);
            	pstmt.setString(1, r);
            	rs = pstmt.executeQuery();
            }

            while (rs.next()) {
                MemBean memBean = new MemBean();
                if(rs.getString("withdrawal")==null) {
                	memBean.setMem_id(rs.getString("mem_id"));
                	memBean.setMem_name(rs.getString("name"));
                	memBean.setMem_gender(rs.getString("gender"));
                	memBean.setMem_phone(rs.getString("phone"));
                	memBean.setMem_birth(rs.getString("birth"));
                	memBean.setMem_date(rs.getString("add_date"));
                	memBean.setLoan_status(rs.getString("loan_status"));
                	vecList.add(memBean);
                }
            }
        }catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }

}
