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
import database.BookBean;
import database.WishBean;
import database.BestBean;
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
                bookBean.setDate(rs.getString("add_date"));
                vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public Vector getBestList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from bestseller";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                BestBean bestBean = new BestBean();
                bestBean.setBest_id(rs.getString("best_id"));
                bestBean.setAdmin_id(rs.getString("admin_id"));
                bestBean.setId_num(rs.getString("book_id"));
                bestBean.setAdd_date(rs.getString("best_date"));
                vecList.add(bestBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    public Vector getBestList6() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from bestseller order by best_date desc LIMIT 6 ";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                BestBean bestBean = new BestBean();
                bestBean.setBest_id(rs.getString("best_id"));
                bestBean.setAdmin_id(rs.getString("admin_id"));
                bestBean.setId_num(rs.getString("book_id"));
                bestBean.setAdd_date(rs.getString("best_date"));
                vecList.add(bestBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
 
    public Vector getNewList(int limit) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String strQuery = "";
        if(limit == 3) {
        	strQuery = "select distinct * from book_info order by add_date LIMIT 3 ";
        }else if(limit == 6) {
        	strQuery = "select distinct * from book_info order by add_date LIMIT 6 ";
        }else if(limit == 10) {
        	strQuery = "select distinct * from book_info order by add_date LIMIT 10 ";
        }
        

        try {
            con = pool.getConnection();
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
                bookBean.setDate(rs.getString("add_date"));
                bookBean.setImage(rs.getString("image"));
                vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }
    
    
    
    public Vector getWishList(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from wish_list where mem_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	 WishBean wishBean = new WishBean();
                 wishBean.setWish_id(rs.getString("wish_id"));
                 wishBean.setMem_id(rs.getString("mem_id"));
                 wishBean.setName(rs.getString("book_name"));
                 wishBean.setAuthor(rs.getString("book_author"));
                 wishBean.setPublisher(rs.getString("publish"));
                 wishBean.setWish_date(rs.getString("wish_date"));
                 wishBean.setStatus(rs.getString("status"));
                 vecList.add(wishBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return vecList;
    }
    
    public Vector getWishListall() {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from wish_list ";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();

            while (rs.next()) {
            	 WishBean wishBean = new WishBean();
                 wishBean.setWish_id(rs.getString("wish_id"));
                 wishBean.setMem_id(rs.getString("mem_id"));
                 wishBean.setName(rs.getString("book_name"));
                 wishBean.setAuthor(rs.getString("book_author"));
                 wishBean.setPublisher(rs.getString("publish"));
                 wishBean.setWish_date(rs.getString("wish_date"));
                 wishBean.setStatus(rs.getString("status"));
                 vecList.add(wishBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return vecList;
    }
    
    public WishBean getWish(String wish_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        WishBean wishBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from wish_list where wish_id=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, wish_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	wishBean = new WishBean();
            	
            	wishBean.setWish_id(rs.getString("wish_id"));
            	wishBean.setMem_id(rs.getString("mem_id"));
            	wishBean.setName(rs.getString("book_name"));
            	wishBean.setAuthor(rs.getString("book_author"));
            	wishBean.setPublisher(rs.getString("publish"));
            	wishBean.setStatus(rs.getString("status"));
            	wishBean.setWish_date(rs.getString("wish_date"));
            	
            	
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return wishBean;
    }
    
    public boolean updateWish(String wish_id, String status) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        
        try {
            con = pool.getConnection();
            String strQuery = "update wish_list set status = ? where wish_id=? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, status);
            pstmt.setString(2, wish_id);

            int count = pstmt.executeUpdate();
            if (count == 1) flag = true;
            	
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return flag;
    }
    
    public Vector getReturnForandroid(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String status = "반납";
        
        try {
            con = pool.getConnection();
            String strQuery = "select id_num, loan_date, return_date, return_type " + 
            		"from book_loan " + 
            		"where mem_id = ? and status = ? order by return_date desc ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 LoanBean loanBean = new LoanBean();
            	 loanBean.setId_num(rs.getString("id_num"));
                 loanBean.setLoan_date(rs.getString("loan_date"));           
                 loanBean.setReturn_date(rs.getString("return_date"));
                 loanBean.setReturn_type(rs.getString("return_type"));
                 vecList.add(loanBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return vecList;
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
                 bookBean.setDate(rs.getString("add_date"));
                 bookBean.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return bookBean;
    }
    
    public BestBean getBest(String id_num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BestBean bestBean = null;
        
        try {
            con = pool.getConnection();
            String strQuery = "select * from bestseller where book_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	bestBean = new BestBean();
            	
            	bestBean.setBest_id(rs.getString("best_id"));
            	bestBean.setAdmin_id(rs.getString("admin_id"));
            	bestBean.setId_num(rs.getString("book_id"));
            	bestBean.setAdd_date(rs.getString("best_date"));

            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return bestBean;
    }
    
    public boolean countBest(String id_num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;
        
        try {
            con = pool.getConnection();
            String strQuery = "select count(best_id) from bestseller where book_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id_num);
            rs = pstmt.executeQuery();
            if(rs.next()) {
            	if(rs.getString("count(best_id)").equals("0")) {
            		flag = false;
            	}else {
            		flag = true;
            	}
            }
            
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return flag;
    }
    
    
    
    public boolean BookUpdate(HttpServletRequest req) {
    	 Connection con = null;
         PreparedStatement pstmt = null;
         boolean result = false;
         //TODO : 리눅스에서 경로 오류날 수 있음 경로 오류시 File.separator 사용.
		String uploadDir =req.getSession().getServletContext().getRealPath("/data");
         System.out.println(uploadDir);

      	try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
            new BucketManager().fileUpLoader(multi.getFilesystemName("image"),  uploadDir + File.separator + multi.getFilesystemName("image"));
                String query = "update book_info set type = ?, name = ?, author = ?, publisher = ?, issue = ?,"
                		+ "form = ?, isbn = ?, class_id = ?, language = ?, collector = ?, sign = ?, status = ?,"
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
    
    public boolean BookInsert(HttpServletRequest req) {
   	 Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        //TODO : 리눅스에서 경로 오류날 수 있음 경로 오류시 File.separator 사용.
		String uploadDir =req.getSession().getServletContext().getRealPath("/data");
        System.out.println(uploadDir);

     	try {
           con = pool.getConnection();
           MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
           new BucketManager().fileUpLoader(multi.getFilesystemName("image"),  uploadDir + File.separator + multi.getFilesystemName("image"));
               String query = "insert book_info values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ";
               pstmt = con.prepareStatement(query);
               pstmt.setString(1, multi.getParameter("id_num"));
               pstmt.setString(2, multi.getParameter("type"));
               pstmt.setString(3, multi.getParameter("name"));
               pstmt.setString(4, multi.getParameter("author"));
               pstmt.setString(5, multi.getParameter("publisher"));
               pstmt.setString(6, multi.getParameter("issue"));
               pstmt.setString(7, multi.getParameter("form"));
               pstmt.setString(8, multi.getParameter("isbn"));
               pstmt.setString(9, multi.getParameter("class_id"));
               pstmt.setString(10, multi.getParameter("language"));
               pstmt.setString(11, multi.getParameter("collector"));
               pstmt.setString(12, multi.getParameter("sign"));
               pstmt.setString(13, multi.getParameter("status"));
               pstmt.setString(14, multi.getFilesystemName("image"));
           int count = pstmt.executeUpdate();
           if (count == 1) result = true;
       } catch (Exception ex) {
           System.out.println("Exception :" + ex);
       } finally {
           pool.freeConnection(con, pstmt);
       }
     	
        return result;
   }
    
    
    
    public boolean deleteBook(String id_num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "delete from book_info where id_num = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id_num);
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
    
    public boolean deleteBest(String id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "delete from bestseller where best_id = ? ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id);
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
    
    public boolean insertWish(String mem_id, String name, String author, String pub) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "INSERT INTO wish_list(mem_id, book_name, book_author, publish) "
        		+ "VALUES (?, ?, ?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, mem_id);
        	pstmt.setString(2, name);
        	pstmt.setString(3, author);
        	pstmt.setString(4, pub);
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
    
    public boolean insertBest(String id_num, String admin) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        String sql = "INSERT INTO bestseller(book_id, admin_id) values (?, ?) ";
        try {
        	con = pool.getConnection();
        	pstmt = con.prepareStatement(sql);
        	pstmt.setString(1, id_num);
        	pstmt.setString(2, admin);
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
    
    public Vector getLoan3(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String status = "대출";

        try {
            con = pool.getConnection();
            String strQuery = "select id_num, loan_date " + 
            		"from book_loan " + 
            		"where mem_id = ? and status = ? order by loan_date desc LIMIT 3 ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 LoanBean loanBean = new LoanBean();
            	 loanBean.setId_num(rs.getString("id_num"));
                 loanBean.setLoan_date(rs.getString("loan_date"));           

                 vecList.add(loanBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    
    public Vector getLoan(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String status = "대출";

        try {
            con = pool.getConnection();
            String strQuery = "select id_num, loan_date " + 
            		"from book_loan " + 
            		"where mem_id = ? and status = ? order by loan_date desc ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 LoanBean loanBean = new LoanBean();
            	 loanBean.setId_num(rs.getString("id_num"));
                 loanBean.setLoan_date(rs.getString("loan_date"));           

                 vecList.add(loanBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    
    
    
    public LoanBean getLoannew(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        LoanBean loanBean = null;
        String status = "대출";
        
        try {
            con = pool.getConnection();
            String strQuery = "select id_num from book_loan where mem_id = ? and status = ? order by loan_date LIMIT 1 ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	loanBean = new LoanBean();
            	
            	loanBean.setId_num(rs.getString("id_num"));
            	

            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return loanBean;
    }
    
    public String countLoan(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String status = "대출";
        String count="0";
        
        try {
            con = pool.getConnection();
            String strQuery = "select count(*) from book_loan where mem_id = ? and status = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	count = rs.getString("count(*)");
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return count;
    }
    
   
   
    
    public Vector getReturn(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String status = "반납";

        try {
            con = pool.getConnection();
            String strQuery = "select id_num, loan_date, return_type, return_date " + 
            		"from book_loan " + 
            		"where mem_id = ? and status = ? order by return_date desc ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 LoanBean loanBean = new LoanBean();
            	 loanBean.setId_num(rs.getString("id_num"));
                 loanBean.setLoan_date(rs.getString("loan_date"));           
                 loanBean.setReturn_date(rs.getString("return_date"));
                 loanBean.setReturn_type(rs.getString("return_type"));
                 vecList.add(loanBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    
    public Vector getReturn3(String mem_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        String status = "반납";

        try {
            con = pool.getConnection();
            String strQuery = "select id_num, loan_date, return_type " + 
            		"from book_loan " + 
            		"where mem_id = ? and status = ? order by return_date desc LIMIT 3 ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            pstmt.setString(2, status);
            rs = pstmt.executeQuery();
            while (rs.next()) {     	 
            	 LoanBean loanBean = new LoanBean();
            	 loanBean.setId_num(rs.getString("id_num"));
                 loanBean.setLoan_date(rs.getString("loan_date"));           
                 
                 vecList.add(loanBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    

    public RatingBean getBookrating(String id_num) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        RatingBean ratingBean= null;

        try {
            con = pool.getConnection();
            String strQuery = "select * " + 
            		"from rating_info " + 
            		"where book_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id_num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	ratingBean = new RatingBean();
            	ratingBean.setBook_id(rs.getString("book_id"));
            	ratingBean.setAll_score(rs.getString("all_score"));
            	ratingBean.setCount(rs.getString("count"));
            	ratingBean.setRating(rs.getString("rating"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return ratingBean;
    }
    
    public Vector searchBook(String keytype, String keyword) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String strQuery = "";       
        String item = "%" + keyword + "%";
        Vector vecList = new Vector();
        
        try {
            con = pool.getConnection();
            if(keytype.equals("all")) {
            	strQuery="select * from book_info where name like ? or author like ? or publisher like ? ";
            	pstmt = con.prepareStatement(strQuery);
                pstmt.setString(1, item);
                pstmt.setString(2, item);
                pstmt.setString(3, item);
            }else if(keytype.equals("title")) {
            	strQuery="select * from book_info where name like ? ";
            	pstmt = con.prepareStatement(strQuery);
                pstmt.setString(1, item);
            }else if(keytype.equals("author")) {
            	strQuery="select * from book_info where author like ? ";
            	pstmt = con.prepareStatement(strQuery);
                pstmt.setString(1, item);
            }else { //출판사
            	strQuery="select * from book_info where publisher like ? ";
            	pstmt = con.prepareStatement(strQuery);
                pstmt.setString(1, item);
            }
            
            rs = pstmt.executeQuery();

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
                 bookBean.setDate(rs.getString("add_date"));
                 bookBean.setImage(rs.getString("image"));
                 vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return vecList;
    }
    
    //도서 대분류
    public String getClass(String class_id) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String c_name = "";
        
        try {
            con = pool.getConnection();
            String strQuery = "select s_name from sub_class where s_id = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, class_id);
            rs = pstmt.executeQuery();

            while (rs.next()) {
           	 c_name = rs.getString("s_name");
           }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        
        return c_name;
    }
    
    //같은 도서 목록
    public Vector getEqualbook(String isbn) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * " + 
            		"from book_info " + 
            		"where isbn = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, isbn);
            rs = pstmt.executeQuery();
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
                 bookBean.setDate(rs.getString("add_date"));
                 bookBean.setImage(rs.getString("image"));       
                 vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }
    
    //같은 작가 도서 목록
    public Vector getEqualauthor(String author) {
    	Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PreparedStatement pstmt_ = null;
        ResultSet rs_ = null;
        String isbn = "";
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select distinct isbn " + 
            		"from book_info " + 
            		"where author = ? ";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, author);
            rs = pstmt.executeQuery();
            while (rs.next()) {
            	BookBean bookBean = new BookBean();
            	isbn = rs.getString("isbn");
            	String query = "select * from book_info where isbn = ? ";
            	pstmt_ = con.prepareStatement(query);
                pstmt_.setString(1, isbn);
                rs_ = pstmt_.executeQuery();
                if(rs_.next()) {
                	bookBean.setId_num(rs_.getString("id_num"));
                    bookBean.setType(rs_.getString("type"));
                    bookBean.setName(rs_.getString("name"));
                    bookBean.setAuthor(rs_.getString("author"));
                    bookBean.setPublisher(rs_.getString("publisher"));
                    bookBean.setIssue(rs_.getString("issue"));
                    bookBean.setForm(rs_.getString("form"));
                    bookBean.setIsbn(rs_.getString("isbn"));
                    bookBean.setClass_id(rs_.getString("class_id"));
                    bookBean.setLanguage(rs_.getString("language"));
                    bookBean.setCollector(rs_.getString("collector"));
                    bookBean.setSign(rs_.getString("sign"));
                    bookBean.setStatus(rs_.getString("status"));
                    bookBean.setDate(rs_.getString("add_date"));
                    bookBean.setImage(rs_.getString("image"));
                }    
                 vecList.add(bookBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }

        return vecList;
    }

}
