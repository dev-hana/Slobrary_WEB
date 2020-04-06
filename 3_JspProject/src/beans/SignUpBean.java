package beans;

import java.io.UnsupportedEncodingException;

public class SignUpBean {
	private String mem_email;
	private String mem_passwd;
	private String mem_image;
	private int mem_pcount;
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_image() {
		return mem_image;
	}
	public void setMem_image(String mem_image) throws UnsupportedEncodingException {
		this.mem_image = new String(mem_image.getBytes("8859_1"),"utf-8");

	}
	public int getMem_pcount() {
		return mem_pcount;
	}
	public void setMem_pcount(int mem_pcount) {
		this.mem_pcount = mem_pcount;
	}
	
	
}
