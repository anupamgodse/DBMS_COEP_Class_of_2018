import java.sql.*;  
class assign5_1{  
	public static void main(String args[]){  
		try{  
			String t = args[0];
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/uni","root","root");  
			
			Statement stmt=con.createStatement();  
			
			ResultSet rs=stmt.executeQuery("select course_id from takes where id =" + t);  
			
			while(rs.next())  
				System.out.println(rs.getString(1));  
			con.close();  
		}
		catch(Exception e) { 
			System.out.println(e);
		}  
	}  
}  
