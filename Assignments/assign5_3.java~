/*3. Write a Java program which does the following:
a. Takes as first line of input, a parameterized SQL query, and subsequent lines containing values for the parameters; you can assume that each ? in the SQL query viewed as a string represents a parameter value.
b. Execute the parameterized SQL query, and output its result with one line per row in the result, along with a header containing the names of columns. Use the tab character to separate columns*/


import java.util.Scanner;
import java.sql.*;   

class assign5_3{  
   public static void main(String[] args) {

      Scanner sc = new Scanner(System.in);  
     System.out.println("Enter parametrized SQL query.");
      String query = sc.nextLine();  
      int i,par_CNT = 0,j,column_CNT,k,row_CNT = 0;
      for ( i = 0; i < query.length(); i++ ){
         if( query.charAt(i) == '?' ){
            par_CNT++;
         }
      }
      String[] pars = new String[par_CNT];
      System.out.println("Enter the parameters:");
      for (j = 0; j < par_CNT; j++){
            pars[j] = sc.nextLine();
      }
      try{ 

         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/uni?useSSL=false", "root", "root"); 
         PreparedStatement stmt = conn.prepareStatement(query);
         for (i = 0; i < par_CNT; i++){
            try {
               j = Integer.parseInt(pars[i]);
               stmt.setInt(i+1,j);
            }catch (NumberFormatException ex) {
               stmt.setString(i+1, pars[i]);
            }
         }
         System.out.println("Query with parameters : " + stmt);

         ResultSet rs = stmt.executeQuery();
         ResultSetMetaData table_MetaData = rs.getMetaData();
         column_CNT = table_MetaData.getColumnCount();
         
         System.out.println("OUTPUT RESULT");
         System.out.println("-----------------------------------------------------------");

         for (k = 0; k < column_CNT; k++ ) {
            String name = table_MetaData.getColumnName(k+1);
            System.out.print(name + "|\t");
         }
         System.out.println("");
         System.out.println("-----------------------------------------------------------");

         while (rs.next()) {
             for (i = 0; i < column_CNT; i++) {
               String Result = rs.getString(i+1);
               System.out.print(Result + " |\t");
            }
            row_CNT++;
            System.out.println("");
         }
         System.out.println("");
         System.out.println("----------------------------------------------------------");
         System.out.println("Total number of records = " + row_CNT);
         

      }

      catch(SQLException ex) {
         String message = ex.getMessage();
         int number = ex.getErrorCode();
         System.out.println(number + " : " + message);        
      }
   }
}
