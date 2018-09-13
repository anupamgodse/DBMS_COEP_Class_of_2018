import java.sql.*;  
class assign5_2{  
	public static void main(String args[]){  
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rail","root","root");  
			
			Statement stmt=con.createStatement();  
			
			ResultSet rs=stmt.executeQuery("select * from track where stcode1 = '" + args[0] + "' and stcode2 = '"+ args[1]+"'");  
			
			if(rs.next()) {  
				stmt.executeUpdate("update track set distance='"+args[2]+ "'where stcode1='"+args[0]+"'and stcode2='"+args[1]+"'");
				
				ResultSet rs1=stmt.executeQuery("select * from track where stcode1='"+args[0]+"'and stcode2='"+args[1]+"'");  
				if(rs1.next()) {
					System.out.println(rs1.getString(1));  
					System.out.println(rs1.getString(2));  
					System.out.println(rs1.getString(3));  
				}
			}  
			else  {
				stmt.executeUpdate("insert into track values('"+args[0]+"','"+args[1]+"','"+args[2]+"')");  
				
				ResultSet rs2 = stmt.executeQuery("select * from track");
				
				while(rs2.next()) {
					System.out.print(rs2.getString(1) + " ");  
					System.out.print(rs2.getString(2) + " ");  
					System.out.println(rs2.getString(3));  
				}
			}
				con.close();  
		}
		catch(Exception e) { 
			System.out.println(e);
		}  
	}  
}  
