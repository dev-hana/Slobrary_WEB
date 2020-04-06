package db;

import java.sql.Connection;
import beans.ReviewBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
//import com.sun.xml.internal.ws.client.RequestContext;


public class ReviewMgr {

    private DBConnectionMgr pool = null;
    private static int count;
    
    public static int getCount() {
		return count;
	}
    
	public ReviewMgr() {
        try {
            pool = DBConnectionMgr.getInstance();
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            con = pool.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from review order by no asc");
            while (rs.next()) {
            	count = rs.getInt("no");
            }
            count++;
            pool.freeConnection(con, stmt, rs);
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }
    
    public boolean insertReview(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
     
           String uploadDir =this.getClass().getResource("").getPath();
           uploadDir = uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"3_JspProject/WebContent/image/reviewDB";
           MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

           System.out.println(multi.getParameter("writer")+" "+multi.getParameter("title")+" "+multi.getParameter("rating"));

            con = pool.getConnection();
            String query = "insert into review(no, writer, title, rating, date, store, store_addr, contents, hashtag, image, heart_cnt)"
                    				+ "values(?, ?, ?, ?, now(), ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, count++);
            pstmt.setString(2, multi.getParameter("writer"));
            pstmt.setString(3, multi.getParameter("title"));
            pstmt.setString(4, multi.getParameter("rating"));
            pstmt.setString(5, multi.getParameter("store"));
            pstmt.setString(6, multi.getParameter("store_addr"));
            pstmt.setString(7, multi.getParameter("contents"));
            pstmt.setString(8, multi.getParameter("hashtag"));
            pstmt.setInt(10, 0);
            
            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(9, "DefaultReviewImg.png");
            } else {
                pstmt.setString(9, multi.getFilesystemName("image"));
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

    public ReviewBean getReview(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReviewBean review = null;

        try {
            con = pool.getConnection();
            String query = "select * from review where no=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                review.setHeart_cnt(rs.getInt("heart_cnt"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return review;
    }
    
    public boolean updateReview(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
     	uploadDir =uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"3_JspProject/WebContent/image/reviewDB";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update review set title = ?, rating = ?, date = now(), contents = ?, writer = ?, hashtag = ?, image = ? where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("title"));
                pstmt.setString(2, multi.getParameter("rating"));
                pstmt.setString(3, multi.getParameter("contents"));
                pstmt.setString(4, multi.getParameter("writer"));
                pstmt.setString(5, multi.getParameter("hashtag"));
                pstmt.setString(6, "DefaultReviewImg.png");
                pstmt.setString(7, multi.getParameter("no"));
            } else {
                String query = "update review set title = ?, rating = ?, date = now(), contents = ?, writer = ?, hashtag = ?, image = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("title"));
                pstmt.setString(2, multi.getParameter("rating"));
                pstmt.setString(3, multi.getParameter("contents"));
                pstmt.setString(4, multi.getParameter("writer"));
                pstmt.setString(5, multi.getParameter("hashtag"));
                pstmt.setString(6, multi.getFilesystemName("image"));
                pstmt.setString(7, multi.getParameter("no"));
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
/*
    public void reduceReview(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = pool.getConnection();
            String query = "update shop_Review set stock = (stock - ? ) where no = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());
            pstmt.setString(2, order.getReview_no());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }

*/
    public Vector getReviewList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
     

        try {
            con = pool.getConnection();
            String query = "select * from review order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                review.setHeart_cnt(rs.getInt("heart_cnt"));
                
                vReview.add(review);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vReview;
    }
    
    public Vector getReviewList(int num) throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
        int cnt=1;
     

        try {
            con = pool.getConnection();
            String query = "select * from review order by heart_cnt desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                review.setHeart_cnt(rs.getInt("heart_cnt"));
                
                vReview.add(review);
                cnt++;
                if (cnt>num) break;
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vReview;
    }

    public ReviewBean getStore(int no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReviewBean review = null;

        try {
            con = pool.getConnection();
            String query = "select * from review where no=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                review = new ReviewBean();
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setImage(rs.getString("image"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return review;
    }

    public boolean deleteReview(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from review where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
            this.count--;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public Vector SDReviewList(String store_addr) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
     
        try {
            con = pool.getConnection();
            String query = "select * from review where store_addr=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, store_addr);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                vReview.add(review);
            }

        } catch (Exception ex) {

            System.out.println("Exception :" + ex);

        } finally {

            pool.freeConnection(con, pstmt, rs);

        }

        return vReview;

    }
    
    public Vector myReviewList(String email) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
     
        try {
            con = pool.getConnection();
            String query = "select * from review where writer=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                vReview.add(review);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vReview;
    }
    
    public Vector hashTagList(String []hashtag) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
     
        try {
            con = pool.getConnection();
            
            String query = "select * from review where (";
            for(int i=1;i<hashtag.length;i++) {
            	if(i==hashtag.length-1) {
            		query+="hashtag LIKE ?)";
            	}else {
            		query+="hashtag LIKE ? or ";
            	}
            }
            pstmt = con.prepareStatement(query);
            for(int i=1;i<hashtag.length;i++) {
            	if(i==hashtag.length-1) {
            		pstmt.setString(i, "%"+hashtag[i]+"%");
            	}else {
            		pstmt.setString(i, "%"+hashtag[i]+"% and");
            	}
            }
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                vReview.add(review);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vReview;
    }
    
    public boolean insertHeartReview(String no, String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        Statement stmt = null;
        boolean result = false;
        ReviewBean review;
        
        try {
            con = pool.getConnection();
            String query = "insert into mylike(review_no, user_email)"
                    				+ "values(?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(no));
            pstmt.setString(2, email);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
            
            
            review = new ReviewBean();
            review = getReview(no);
            int tmp = review.getHeart_cnt()+1;
            query = "update review set heart_cnt = ? where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, tmp);
            pstmt.setInt(2, Integer.parseInt(no));
            pstmt.executeUpdate();

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public boolean isInHeartList(String no,String email) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            con = pool.getConnection();
            String query = "select * from mylike where review_no=? and user_email=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(no));
            pstmt.setString(2, email);
            rs = pstmt.executeQuery();
            result=rs.next();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return result;
    }
    
    public Vector heartReviewList(String email) throws SQLException {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vReview = new Vector();
     
        try {
            con = pool.getConnection();
            String query = "select review.* from review,mylike where review.no=mylike.review_no and mylike.user_email=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReviewBean review = new ReviewBean();
                review.setNo(rs.getInt("no"));
                review.setWriter(rs.getString("writer"));
                review.setTitle(rs.getString("title"));
                review.setRating(rs.getInt("rating"));
                review.setDate(rs.getString("date"));
                review.setStore(rs.getString("store"));
                review.setStore_addr(rs.getString("store_addr"));
                review.setContents(rs.getString("contents"));
                review.setHashtag(rs.getString("hashtag"));
                review.setImage(rs.getString("image"));
                vReview.add(review);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vReview;
    }
    
    public boolean deleteHeartReview(String no,String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        ReviewBean review;

        try {
            con = pool.getConnection();
            String query = "delete from mylike where review_no = ? and user_email=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(no));
            pstmt.setString(2, email);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
            
            review = new ReviewBean();
            review = getReview(no);
            query = "update review set heart_cnt = ? where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, review.getHeart_cnt()-1);
            pstmt.setInt(2, Integer.parseInt(no));
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public boolean deleteChild(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from mylike where review_no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(no));
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
            
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }
    
    public boolean deleteChildReview(String email) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from review where writer = ?";
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


}