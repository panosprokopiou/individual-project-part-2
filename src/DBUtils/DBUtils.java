/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Pan
 */
public class DBUtils {
    
    private static final String USERNAME = "root";
    private static final String PASS = "panos1908!!!@@83#$BNM";
    private static final String MYSQLURL = "jdbc:mysql://localhost:3306/private_school?zeroDateTimeBehavior=CONVERT_TO_NULL&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false";

    public static Connection getgonnection() {
        Connection con = null;

        try {
            con = DriverManager.getConnection(MYSQLURL, USERNAME, PASS);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return con;
    
    } 
}
