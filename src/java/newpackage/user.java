package newpackage;

public class user {
	private int id;
        private int grade;
	private String fname;
	private String lname;
        private String nic;
        private String mobile;
	private String email;
	private String uname;
	private String pwd;
        private String status;

	public user(int id, int grade, String fname, String lname, String email, String mobile, String uname, String pwd, String status) {
		this.id = id;
                this.grade = grade;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
		this.pwd = pwd;
                this.status = status;
	}
        
        public user(int grade, String fname, String lname, String email, String mobile, String uname,String status) {
                this.grade = grade;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
                this.status = status;
	}
        
        public user(int id, int grade, String fname, String lname, String email, String mobile, String uname,String status) {
                this.id = id;
                this.grade = grade;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
                this.status = status;
	}
		
	public user(String fname, String lname, String nic, String email, String mobile, String uname, String pwd) {
		this.fname = fname;
		this.lname = lname;
                this.nic = nic;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
		this.pwd = pwd;	
	}
        
        public user(String fname, String lname, String nic, String email, String mobile, String uname) {                
		this.fname = fname;
		this.lname = lname;
                this.nic = nic;
		this.email = email;
		this.mobile = mobile;
		this.uname = uname;
	}
		

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
        
        public int getGrade() {
		return id;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
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
        
        public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}