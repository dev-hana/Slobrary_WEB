package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
