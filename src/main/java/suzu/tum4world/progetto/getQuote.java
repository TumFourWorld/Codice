package suzu.tum4world.progetto;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.sql.*;

@WebServlet(name = "getQuote", value = "/getQuote")
public class getQuote extends HttpServlet {

    private String message;

    public void init() {
        message = "Hello World!";
    }
    String dbUrl = "jdbc:derby://localhost:1527/MyDerbydb";
    String username = "prova";
    String password = "prova";
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Driver loaded successfully.");
            Connection connection = DriverManager.getConnection(dbUrl, username, password);
            System.out.println("Connected to the database.");
            Statement stmt = connection.createStatement();

            //x out
            PrintWriter out = response.getWriter();


            //prendo numerod di quotes in DB e setto come limite per random
            int rowCount = 0;

            String maxQuery = "SELECT COUNT(*) as row_count FROM QUOTES";
            ResultSet rs = stmt.executeQuery(maxQuery);
            if (rs.next()) {
                rowCount = rs.getInt("row_count");
                System.out.println("Numero di frasi presenti in DB " + rowCount);
            }


            //genero numero random per scegliere quote
            Random random = new Random();
            int min=1; //include 0
            int max = rowCount; //include max(+1)
            int randomNumber = random.nextInt(max - min  +1)+min;

            //la spiego xche dimentico: con offset scelgo a che posizione prendere. con fetch scelgo quante righe prendere (una)
            //SELECT * FROM quotes ORDER BY FRASE OFFSET " + (randomNumber) + " ROWS FETCH NEXT 1 ROW ONLY
            String quoteQuery = "SELECT frase FROM quotes WHERE id="+(randomNumber)+ "";
            System.out.println(quoteQuery);
            ResultSet quote = stmt.executeQuery(quoteQuery);
            if (quote.next()) {
                // acceddo a valore colonna di riga presa
                out.write("<p>" + quote.getString("FRASE") + "</p>");
                System.out.println("QUOTE PRESA");
            } else {
                System.out.println("QUOTE NON TROVATA!");
                response.sendRedirect("login.jsp"); //REDIRECT DA MANDARE IN BASE A PROVENIENZA PAGINA
            }

            connection.close();
            System.out.println("Connection closed.");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // Hello

    }

    public void destroy() {
    }
}