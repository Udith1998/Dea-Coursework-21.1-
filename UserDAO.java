package daoPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import modelPackage.user;

//Data Access Object- it's design paten to seperate database operations
public class UserDAO {
	
	//Connect to the DB
		Statement st;
		PreparedStatement ps;
		private void connectToDB() {
			String url="jdbc:mysql://localhost:3306/registration";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,"root","");
				st=con.createStatement();
				ps=con.prepareStatement(null);
				}
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}	
		}
		
		
	//insert staff1 members
		public  void addStaff1(user user) {
			connectToDB();
			String sql="INSERT INTO staff01(Fname,Lname,nic,mobile,email,uname,pwd) VALUES (?,?,?,?,?,?,?);";
			try {
				ps.setString(1,user.getFname());
				ps.setString(2,user.getLname());
				ps.setString(3,user.getNic());
				ps.setString(4,user.getMobile());
				ps.setString(5,user.getEmail());
				ps.setString(6,user.getUname());
				ps.setString(7,user.getPwd());
				
				ps.executeUpdate(sql);
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
				
		}
		
	//Update staff1 members
		public boolean updateStaff1(user user) {
			boolean rawupdated = false;
			connectToDB();
			String sql="UPDATE staff01 SET Fname=?,Lname=?,nic=?,mobile=?,email=?,uname=?,pwd=? WHERE id=? ;";
			try {
				ps.setString(1,user.getFname());
				ps.setString(2,user.getLname());
				ps.setString(3,user.getNic());
				ps.setString(4,user.getMobile());
				ps.setString(5,user.getEmail());
				ps.setString(6,user.getUname());
				ps.setString(7,user.getPwd());
				
				rawupdated=ps.executeUpdate(sql)>0;
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
				
			return rawupdated;
		}
		
	//Select staff1 by id
		public user selectStaff1(int id) {
			user user=null;
			connectToDB();
			String sql="SELECT * FROM staff01 WHERE id=?;";
			try {
				ps.setInt(1,id);
				ResultSet rs= ps.executeQuery(sql);	
				
				while(rs.next()) {
					 String Fname=rs.getString("Fname");
					 String Lname=rs.getString("Lname");
					 String email=rs.getString("email");
					 String mobile=rs.getString("mobile");
					 String uname=rs.getString("uname");
					 String pwd=rs.getString("pwd");
					 String nic=rs.getString("nic");
					 user = new user(Fname,Lname,email,mobile,uname,pwd,nic);
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
				
			return user;
		}
	//Select All staff1 
		public ArrayList<user> selectAllStaff1() {
			ArrayList<user> users=new ArrayList<>();
			connectToDB();
			String sql="SELECT * FROM staff01;";
			try {
				ResultSet rs= ps.executeQuery(sql);	
				
				while(rs.next()) {
					 int id1=rs.getInt("id");
					 String Fname=rs.getString("Fname");
					 String Lname=rs.getString("Lname");
					 String email=rs.getString("email");
					 String mobile=rs.getString("mobile");
					 String uname=rs.getString("uname");
					 String pwd=rs.getString("pwd");
					 String nic=rs.getString("nic");
					 users.add( new user(id1,Fname,Lname,email,mobile,uname,pwd,nic));
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
				
			return users;
		}
	//Delete staff1 members
		public boolean deletestaff1(int id) {
			boolean rawDeleted = false;
			connectToDB();
			String sql="DELETE FROM staff01 WHERE id=?;";
			try {
				ps.setInt(1,id);
				rawDeleted= ps.executeUpdate(sql) >0;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return rawDeleted;	
		}
		
/////////////////////////////////////////////////////////////////////////
		//insert staff2 members
				public  void addStaff2(user user) {
					connectToDB();
					String sql="INSERT INTO staff02(Fname,Lname,nic,mobile,email,uname,pwd) VALUES (?,?,?,?,?,?,?);";
					try {
						ps.setString(1,user.getFname());
						ps.setString(2,user.getLname());
						ps.setString(3,user.getNic());
						ps.setString(4,user.getMobile());
						ps.setString(5,user.getEmail());
						ps.setString(6,user.getUname());
						ps.setString(7,user.getPwd());
						
						ps.executeUpdate(sql);
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}
						
				}
				
			//Update staff2 members
				public boolean updateStaff2(user user) {
					boolean rawupdated = false;
					connectToDB();
					String sql="UPDATE staff02 SET Fname=?,Lname=?,nic=?,mobile=?,email=?,uname=?,pwd=? WHERE id=? ;";
					try {
						ps.setString(1,user.getFname());
						ps.setString(2,user.getLname());
						ps.setString(3,user.getNic());
						ps.setString(4,user.getMobile());
						ps.setString(5,user.getEmail());
						ps.setString(6,user.getUname());
						ps.setString(7,user.getPwd());
						
						rawupdated=ps.executeUpdate(sql)>0;
					} catch (SQLException e) {
						System.out.println(e.getMessage());
					}
						
					return rawupdated;
				}
				
			//Select staff2 by id
				public user selectStaff2(int id) {
					user user=null;
					connectToDB();
					String sql="SELECT * FROM staff02 WHERE id=?;";
					try {
						ps.setInt(1,id);
						ResultSet rs= ps.executeQuery(sql);	
						
						while(rs.next()) {
							 String Fname=rs.getString("Fname");
							 String Lname=rs.getString("Lname");
							 String email=rs.getString("email");
							 String mobile=rs.getString("mobile");
							 String uname=rs.getString("uname");
							 String pwd=rs.getString("pwd");
							 String nic=rs.getString("nic");
							 user = new user(Fname,Lname,email,mobile,uname,pwd,nic);
						}
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
						
					return user;
				}
			//Select All staff2 
				public ArrayList<user> selectAllStaff2() {
					ArrayList<user> users=new ArrayList<>();
					connectToDB();
					String sql="SELECT * FROM staff02;";
					try {
						ResultSet rs= ps.executeQuery(sql);	
						
						while(rs.next()) {
							 int id1=rs.getInt("id");
							 String Fname=rs.getString("Fname");
							 String Lname=rs.getString("Lname");
							 String email=rs.getString("email");
							 String mobile=rs.getString("mobile");
							 String uname=rs.getString("uname");
							 String pwd=rs.getString("pwd");
							 String nic=rs.getString("nic");
							 users.add( new user(id1,Fname,Lname,email,mobile,uname,pwd,nic));
						}
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
						
					return users;
				}
			//Delete staff2 members
				public boolean deletestaff2(int id) {
					boolean rawDeleted = false;
					connectToDB();
					String sql="DELETE FROM staff02 WHERE id=?;";
					try {
						ps.setInt(1,id);
						rawDeleted= ps.executeUpdate(sql) >0;
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return rawDeleted;	
				}
}

