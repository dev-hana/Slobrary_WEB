package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
    
    
    public Vector searchBookList(String keyoption,String keyword,String category,String area,String type) {
		Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookBean bookBean=null;
        Vector bookList = new Vector();
        String strQuery;

        try {
            con = pool.getConnection();
           
            if(type.equals("all")) {
            	if(keyoption.equals("all")) {
            		if(area.equals("전체")) {
                		strQuery = "select * from book_info where name Like ? or author Like ? or publisher Like ?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, "%"+keyword+"%");
                        pstmt.setString(3, "%"+keyword+"%");
                	}
            		else {
                		strQuery = "select * from book_info where ( name Like ? or author Like ? or publisher Like ? ) and language=?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, "%"+keyword+"%");
                        pstmt.setString(3, "%"+keyword+"%");
                        pstmt.setString(4, "한국어");
                	} 
            	}else {
            		if(keyoption.equals("title")) {
            			if(area.equals("전체")) {
                    		strQuery = "select * from book_info where name Like ?;";
                    		pstmt = con.prepareStatement(strQuery);
                            pstmt.setString(1, "%"+keyword+"%");
        
                    	}else {
                    		strQuery = "select * from book_info where name Like ? and language=?;";
                    		pstmt = con.prepareStatement(strQuery);
                            pstmt.setString(1, "%"+keyword+"%");
                            pstmt.setString(2, "한국어");
                    	}                
            		}else if(keyoption.equals("author")) {
            			strQuery = "select * from book_info where author Like ?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
            		}else {
            			strQuery = "select * from book_info where publisher Like ?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
            		}
            	}
            }else {
            	if(keyoption.equals("all")) {
            		if(area.equals("전체")) {
                		strQuery = "select * from book_info where name (Like ? or author Like ? or publisher Like ?) and type=?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, "%"+keyword+"%");
                        pstmt.setString(3, "%"+keyword+"%");
                        pstmt.setString(4, type);
            
                	}
            		else {
                		strQuery = "select * from book_info where ( name Like ? or author Like ? or publisher Like ? ) and language=? and type=?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, "%"+keyword+"%");
                        pstmt.setString(3, "%"+keyword+"%");
                        pstmt.setString(4, "한국어");
                        pstmt.setString(5, type);
                	} 
            		
            	}else if(keyoption.equals("title")) {
            			if(area.equals("전체")) {
                    		strQuery = "select * from book_info where name Like ? and type=?;";
                    		pstmt = con.prepareStatement(strQuery);
                            pstmt.setString(1, "%"+keyword+"%");
                            pstmt.setString(2, type);
        
                    	}else {
                    		strQuery = "select * from book_info where name Like ? and language=? and type=?;";
                    		pstmt = con.prepareStatement(strQuery);
                            pstmt.setString(1, "%"+keyword+"%");
                            pstmt.setString(2, "한국어");
                            pstmt.setString(3, type);
                    	}                
            		}else if(keyoption.equals("author")) {
            			strQuery = "select * from book_info where author Like ? and type=?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, type);
            		}else {
            			strQuery = "select * from book_info where publisher Like ? and type=?;";
                		pstmt = con.prepareStatement(strQuery);
                        pstmt.setString(1, "%"+keyword+"%");
                        pstmt.setString(2, type);
            		}
            	}
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	
            	bookBean = new BookBean();
            	
            	bookBean.setId_num(rs.getString("id_num"));
            	bookBean.setType(rs.getString("type"));
            	bookBean.setName(rs.getString("name"));
            	bookBean.setAuthor(rs.getString("author"));
            	bookBean.setPublisher(rs.getString("publisher"));
            	bookBean.setIssue(rs.getString("issue"));
            	bookBean.setForm(rs.getString("form"));
            	bookBean.setIsbn(rs.getString("ISBN"));
            	bookBean.setClass_id(rs.getString("class_id"));
            	bookBean.setLanguage(rs.getString("language"));
            	bookBean.setCollector(rs.getString("collector"));
            	bookBean.setSign(rs.getString("sign"));
            	bookBean.setStatus(rs.getString("status"));
            	
            	bookList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return bookList;
    }
    
    public BookBean getBook(String id_num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookBean bookBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from book_info where id_num=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	bookBean = new BookBean();
            	
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
                 bookBean.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return bookBean;
    }
    
    public boolean BookUpdate(HttpServletRequest req) {
    	 Connection con = null;
         PreparedStatement pstmt = null;
         boolean result = false;
         String uploadDir =this.getClass().getResource("").getPath();
         uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"Autobrary/WebContent/data";
      	try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

                String query = "update book_info set type = ?, name = ?, author = ?, publisher = ?, issue = ?,"
                		+ "form = ?, isbn = ?, class_id = ?, language = ?, collector = ?, sign = ?, status = ?"
                		+ "image = ? where id_num = ? ";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("type"));
                pstmt.setString(2, multi.getParameter("name"));
                pstmt.setString(3, multi.getParameter("author"));
                pstmt.setString(4, multi.getParameter("publisher"));
                pstmt.setString(5, multi.getParameter("issue"));
                pstmt.setString(6, multi.getParameter("form"));
                pstmt.setString(7, multi.getParameter("isbn"));
                pstmt.setString(8, multi.getParameter("class_id"));
                pstmt.setString(9, multi.getParameter("language"));
                pstmt.setString(10, multi.getParameter("collector"));
                pstmt.setString(11, multi.getParameter("sign"));
                pstmt.setString(12, multi.getParameter("status"));
                pstmt.setString(13, multi.getFilesystemName("image"));
                pstmt.setString(14, multi.getParameter("id_num"));
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
      	
         return result;
    }

}
