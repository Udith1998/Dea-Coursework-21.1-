package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAO {
	
	//Connect to the DB
		Statement st;
		PreparedStatement ps;
		private void connectToDB() {
			String url="jdbc:mysql://localhost:3306/PhoenixAirlinesDB";
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,"root","");
				st=con.createStatement();
				ps=con.prepareStatement(null);
				}
			catch (ClassNotFoundException | SQLException e) {
			}	
		}
		
		
	//insert staff members
		public  void insertStaff(user user) {
			connectToDB();
			String sql="INSERT INTO staff(Grade,FirstName,LastName,Email,MobileNo,Username,Password) VALUES (?,?,?,?,?,?,?);";
			try {
                                ps.setInt(1,user.getGrade());
				ps.setString(2,user.getFname());
				ps.setString(3,user.getLname());
				ps.setString(4,user.getEmail());
                                ps.setString(5,user.getMobile());
				ps.setString(6,user.getUname());
				ps.setString(7,user.getPwd());
				
				ps.executeUpdate(sql);
                                
			} catch (SQLException e) {                           
				System.out.println(e.getMessage());
			}
				
		}
		
	//Update staff members
		public boolean updateStaff(user user) {
			boolean rawupdated = false;
			connectToDB();
			String sql="UPDATE staff SET Grade=?,FirstName=?,LastName=?,MobileNo=?,Email=?,Username=?,Password=? WHERE ID=? ;";
			try {
				ps.setInt(1,user.getGrade());
                                ps.setString(2,user.getFname());
				ps.setString(3,user.getLname());				
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
		
	//Select staff by id
		public user getStaff(int id) {
			user user=null;
			connectToDB();
			String sql="SELECT * FROM staff WHERE ID=?;";
			try {
				ps.setInt(1,id);
				ResultSet rs= ps.executeQuery(sql);	
				
				while(rs.next()) {
                                        int grade=rs.getInt("Grade");
					String Fname=rs.getString("FirstName");
					String Lname=rs.getString("LastName");
					String email=rs.getString("Email");
					String mobile=rs.getString("MobileNo");
					String uname=rs.getString("Username");
                                        String status=rs.getString("Status");
                                         
					user = new user(grade,Fname,Lname,email,mobile,uname,status);
				}
			}
			catch (SQLException e) {
                            System.out.println(e.getMessage());
			}
				
			return user;
		}
                
	//Select All staff 
		public ArrayList<user> listAllStaff() {
			ArrayList<user> users=new ArrayList<>();
			connectToDB();
			String sql="SELECT * FROM staff;";
			try {
				ResultSet rs= ps.executeQuery(sql);	
				
				while(rs.next()) {
                                    int id=rs.getInt("ID");
                                    int grade=rs.getInt("Grade");
                                    String Fname=rs.getString("FirstName");
                                    String Lname=rs.getString("LastName");
                                    String email=rs.getString("Email");
                                    String mobile=rs.getString("MobileNo");
                                    String uname=rs.getString("Username");
                                    String status=rs.getString("Status");
                                        
                                    user staff = new user(id,grade,Fname,Lname,email,mobile,uname,status);
                                    users.add(staff);
				}
			}
			catch (SQLException e) {
				System.out.println(e.getMessage());
			}
				
			return users;
		}
        //Delete staff members
                        public boolean deletestaff(int id) {
                                boolean rawDeleted = false;
                                connectToDB();
                                String sql="DELETE FROM staff WHERE ID=?;";
                                try {
                                        ps.setInt(1,id);
                                        rawDeleted= ps.executeUpdate(sql) >0;
                                } catch (SQLException e) {
                                        System.out.println(e.getMessage());
                                }
                                return rawDeleted;	
                        }

        //insert clients
                        public  void insertClient(user user) {
                                connectToDB();
                                String sql="INSERT INTO client(FirstName,LastName,NIC,MobileNo,Email,Username,Password) VALUES (?,?,?,?,?,?,?);";
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

        //Update clients
                        public boolean updateClient(user user) {
                                boolean rawupdated = false;
                                connectToDB();
                                String sql="UPDATE client SET FirstName=?,LastName=?,NIC=?,MobileNo=?,Email=?,Username=?,Password=? WHERE Username=?;";
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

        //Select client by username
                        public user getClient(String uname) {
                                user user=null;
                                connectToDB();
                                String sql="SELECT * FROM client WHERE Username=?;";
                                try {
                                        ps.setString(1,uname);
                                        ResultSet rs= ps.executeQuery(sql);	

                                        while(rs.next()) {
                                            String Fname=rs.getString("FirstName");
                                            String Lname=rs.getString("LastName");
                                            String nic=rs.getString("NIC");
                                            String email=rs.getString("Email");
                                            String mobile=rs.getString("MobileNo");
                                            user = new user(Fname,Lname,nic,email,mobile,uname);
                                        }
                                }
                                catch (SQLException e) {
                                    System.out.println(e.getMessage());
                                }

                                return user;
                        }
        //Select All clients 
                        public ArrayList<user> listAllClient() {
                                ArrayList<user> users=new ArrayList<>();
                                connectToDB();
                                String sql="SELECT * FROM client;";
                                try {
                                        ResultSet rs= ps.executeQuery(sql);	

                                        while(rs.next()) {
                                            String Fname=rs.getString("FirstName");
                                            String Lname=rs.getString("LastName");
                                            String nic=rs.getString("NIC");
                                            String email=rs.getString("Email");
                                            String mobile=rs.getString("MobileNo");
                                            String uname=rs.getString("Username");
                                            
                                            users.add( new user(Fname,Lname,nic,email,mobile,uname));
                                        }
                                }
                                catch (SQLException e) {
                                    System.out.println(e.getMessage());
                                }

                                return users;
                        }
                //Delete clients
                        public boolean deleteClient(String uname) {
                                boolean rawDeleted = false;
                                connectToDB();
                                String sql="DELETE FROM client WHERE Username=?;";
                                try {
                                        ps.setString(1,uname);
                                        rawDeleted= ps.executeUpdate(sql) >0;
                                } catch (SQLException e) {
                                    System.out.println(e.getMessage());
                                }
                                return rawDeleted;	
                        }

}

