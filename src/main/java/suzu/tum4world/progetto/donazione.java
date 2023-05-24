package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

@WebServlet(name = "donazione", value = "/donazione")
public class donazione extends HttpServlet {

    Connection connection;
    public void init() {
        String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
        String username = "prova";
        String password = "prova";
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //campi dal form
        Double importo = Double.parseDouble(request.getParameter("importo"));
        System.out.println(importo);
        String username = (String) request.getSession().getAttribute("username");
        Date data = new java.sql.Date(System.currentTimeMillis());

        try {
            PrintWriter out = response.getWriter();
            Statement stmt = connection.createStatement();
            stmt.executeUpdate( "INSERT INTO PROVA.DONAZIONI (IMPORTO,USERNAME,DATA_DONAZIONE) VALUES ("+importo+",'"+username+"','"+data+"')");
            out.write("Grazie per aver donato : "+importo+" euro");
            System.out.println("Inserimento in tabella donazioni");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //campi dalla sessione
        String username = (String) request.getSession().getAttribute("username");

        try {
            PrintWriter out = response.getWriter();
            Statement stmt = connection.createStatement();
            ResultSet donazione = stmt.executeQuery( "SELECT  SUM(IMPORTO) AS sommaDonazioni FROM PROVA.DONAZIONI WHERE DONAZIONI.USERNAME='"+username+"'GROUP BY DONAZIONI.USERNAME ");
            while(donazione.next()) {
                out.write("In totale hai donato : "+donazione.getDouble("sommaDonazioni"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public void destroy() {
        try {
            connection.close();
            System.out.println("Connection closed.");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}