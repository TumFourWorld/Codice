package suzu.tum4world.progetto;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import java.sql.*;

@WebServlet(name = "getQuote", value = "/getQuote")
public class getQuote extends HttpServlet {

    private String message;
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
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        processrequest(request, response);
    }

    protected void processrequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ArrayList<QUOTES> output = new ArrayList<QUOTES>();

        try {


            Statement stmt = connection.createStatement();
            ResultSet esiste = stmt.executeQuery("select FRASE from QUOTES");

            while(esiste.next()) {
                QUOTES retrieved_quotes = new QUOTES();
                retrieved_quotes.setFrase(esiste.getString("FRASE"));
                output.add(retrieved_quotes); //metto dentro array di QUOTES x mandare in output
            }


        }catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //SENDING JSON RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {
            JsonArray array = new JsonArray();
            for(QUOTES q : output) {
                Gson gson = new Gson();
                array.add(gson.toJson(q));
            }
            out.println(array);
            out.flush();
        } catch (IOException e) {
            System.out.println("ERRORE IN OUTPUT JSON QUOTES");
            throw new RuntimeException(e);
        }
    }


        /* VECCHIA VERSIONE
        try {
            Statement stmt = connection.createStatement();
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

         */



    public void destroy() {
        try {
            connection.close();
            System.out.println("Connection closed.");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}