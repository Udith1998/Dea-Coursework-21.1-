package modelPackage;

public class user {
	private int id;
	private String Fname;
	private String Lname;
	private String email;
	private String mobile;
	private String uname;
	private String pwd;
	private String nic;

	public user(int id, String Fname, String Lname, String email, String mobile, String uname, String pwd, String nic ) {
		super();
		this.id = id;
		this.Fname = Fname;
		this.Lname = Lname;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
		this.pwd = pwd;
		this.nic = nic;
	}
	
	
	
	public user(String Fname, String Lname, String email, String mobile, String uname, String pwd, String nic) {
		super();
		this.Fname = Fname;
		this.Lname = Lname;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
		this.pwd = pwd;
		this.nic = nic;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}

	public String getLname() {
		return Lname;
	}
	public void setLname(String lname) {
		Lname = lname;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNic() {
		return nic;
	}
	public void setNic(String nic) {
		this.nic = nic;
	}
	
	
}