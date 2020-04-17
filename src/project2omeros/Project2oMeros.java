/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project2omeros;

import DBUtils.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Pan
 */
public class Project2oMeros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        // TODO code application logic here

        Connection con = DBUtils.getgonnection();

        Statement statement = con.createStatement();
        //  statement.executeUpdate("INSERT INTO CITY VALUES (null, 'THESSALONIKI', 23, '2019-12-03 20:07:53');");
        // statement.executeQuery("select * from city;"); oxi auto.to apo katw na kanw
        ResultSet resultSet = statement.executeQuery("select * from student;");

        while (resultSet.next()) {
            System.out.print(resultSet.getInt(1) + " ");
            System.out.print(resultSet.getString(2) + " ");
            System.out.print(resultSet.getString(3) + " ");
            System.out.print(resultSet.getString(4) + " ");
            System.out.println(resultSet.getString(5));
        }

        ResultSet resultSet1 = statement.executeQuery("select * from trainer;");

        while (resultSet.next()) {
            System.out.print(resultSet1.getInt(1) + " ");
            System.out.print(resultSet1.getString(2) + " ");
            System.out.print(resultSet1.getString(3) + " ");
            System.out.println(resultSet1.getString(4));
        }

        ResultSet resultSet2 = statement.executeQuery("select * from assignement;");

        while (resultSet.next()) {
            System.out.print(resultSet2.getInt(1) + " ");
            System.out.print(resultSet2.getString(2) + " ");
            System.out.print(resultSet2.getString(3) + " ");
            System.out.print(resultSet2.getString(4) + " ");
            System.out.println(resultSet2.getString(5));
        }

        ResultSet resultSet3 = statement.executeQuery("select * from course;");

        while (resultSet.next()) {
            System.out.print(resultSet3.getInt(1) + " ");
            System.out.print(resultSet3.getString(2) + " ");
            System.out.print(resultSet3.getString(3) + " ");
            System.out.print(resultSet3.getString(4) + " ");
            System.out.println(resultSet3.getString(5));
        }
            ResultSet resultSet4 = statement.executeQuery("STUDENT PER COURSE SELECT S.ID, S.FIRST_NAME, S.LAST_NAME, C.ID C.TITLE FROM STUDENT S, COURSE C, COURSE_STUDENT CS WHERE C.COURSE_ID = CS.COURSE_STUDENT_ID AND S.STUDENT_ID = CS.COURSE_STUDENT_ID;");

            while (resultSet.next()) {
                System.out.print(resultSet4.getInt(1) + " ");
                System.out.print(resultSet4.getString(2) + " ");
                System.out.print(resultSet4.getString(3) + " ");
                System.out.println(resultSet4.getString(4));

            }

            ResultSet resultSet5 = statement.executeQuery("TRAINER PER COURSE SELECT T.ID, S.FIRST_NAME, S.LAST_NAME FROM TRAINER T, COURSE C,  WHERE C.COURSE_ID = T.TRAINER_ID;");

            while (resultSet.next()) {
                System.out.print(resultSet5.getInt(1) + " ");
                System.out.print(resultSet5.getString(2) + " ");
               System.out.print(resultSet5.getString(3) + " ");
                System.out.println(resultSet5.getString(4));
                System.out.println(resultSet5.getString(5));
            }
        
            
            
            
            
    }

}


