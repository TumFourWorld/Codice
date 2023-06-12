package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.ArrayList;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

@WebServlet(name = "utentiServlet", value = "/utentiServlet")
public class utentiServlet extends HttpServlet {

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

        ArrayList<USER> output = new ArrayList<USER>();

        try {
            String parameter = request.getParameter("ruolo");

            Statement stmt = connection.createStatement();
            ResultSet esiste = stmt.executeQuery("select USERNAME, SIMP from UTENTE");

            //PrintWriter out = response.getWriter();
            while (esiste.next()) {
                USER retrieved_user = new USER();
                if (!esiste.getString("USERNAME").equals("admin")){
                    if (parameter.equals("registrati")) {
                        //TUTTI GLI UTENTI
                        //out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                        retrieved_user.setUsername(esiste.getString("USERNAME"));
                    } else if (parameter.equals("simp")) {
                        //tutti i simp
                        if (esiste.getBoolean("SIMP")) {
                            //SE SONO SIMP PRENDO TUTTI I SIMP
                            //out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                            retrieved_user.setUsername(esiste.getString("USERNAME"));
                        }
                    } else if (parameter.equals("aderenti")) {
                        if (!esiste.getBoolean("SIMP")) {
                            //SE SONO ADERENTI PRENDO TUTTI ADERENTI
                            //out.write("<p>" + esiste.getString("USERNAME") + "</p>");
                            retrieved_user.setUsername(esiste.getString("USERNAME"));
                        }
                    }
                }
                output.add(retrieved_user); //metto dentro array di USER
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //SENDING JSON RESPONSE
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        try (PrintWriter out = response.getWriter()) {
            JsonArray array = new JsonArray();
            for(USER u : output) {
                Gson gson = new Gson();
                array.add(gson.toJson(u));
            }
            out.println(array);
            out.flush();
        } catch (IOException e) {
            System.out.println("ERRORE BOH");
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