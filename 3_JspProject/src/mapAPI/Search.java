package mapAPI;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Vector;

import beans.SearchBean;

public class Search {
	
	private static String substringBetween(String all, String open, String close) {
	    if (all == null || open == null || close == null) {
	       return null;
	    }
	    int start = all.indexOf(open);
	    if (start != -1) {
	       int end = all.indexOf(close, start + open.length());
	       if (end != -1) {
	          return all.substring(start + open.length(), end);
	       }
	    }
	    return null;
	}
	
	
	public Vector<SearchBean> searchf(String s) {
		String ti = null; //업체, 기관명             
		String li = null; //네이버 링크              
		String ca = null; //업체, 기관의 분류 정보              
		String tel = null; //전화번호               
		String ad = null; //주소                  
		String rad = null; //도로명 주소             
		String mx = null;                       
		String my = null;                       
		Vector<SearchBean> vti = null;      
		
		String clientId = "9p2vDIeK7F9FdNRxE3qu"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "BUidB6oFkR"; //애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(s, "UTF-8");
            //String apiURL = "https://openapi.naver.com/v1/search/local?query="+ text; // json 결과
            String apiURL = "https://openapi.naver.com/v1/search/local.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            vti = new Vector();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
                String all = response.toString();
                String[] info = all.split("</item>");
                
                for(int i=0;i<info.length-1;i++) {
                	SearchBean loc = new SearchBean();
                	ti=substringBetween(info[i],"<item><title>","</title>");
                    li=substringBetween(info[i],"<link>","</link>");
                    ca=substringBetween(info[i], "<category>", "</category>");
                    tel=substringBetween(info[i], "<telephone>", "</telephone>");
                    ad=substringBetween(info[i], "<address>", "</address>");
                    rad=substringBetween(info[i], "<roadAddress>", "</roadAddress>");
                    mx=substringBetween(info[i], "<mapx>", "</mapx>");
                    my=substringBetween(info[i], "<mapy>", "</mapy>");
                    
                   
                    
                    loc.setTi(ti);
                    loc.setLi(li);
                    loc.setCa(ca);
                    loc.setTel(tel);
                    loc.setAd(ad);
                    loc.setRad(rad);
                    loc.setMx(mx);
                    loc.setMy(my);
                    vti.add(loc);
                }

            }
            br.close();
        } catch (Exception e) {
            System.out.println(e);
        }
		return vti;
	}
}
