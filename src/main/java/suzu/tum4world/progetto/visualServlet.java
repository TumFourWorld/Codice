package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet(name = "visualServlet", value = "/visualServlet")
public class visualServlet extends HttpServlet {

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
        try {
            ArrayList<VISUAL> output = new ArrayList<>();
            PrintWriter out = response.getWriter();
            Statement stmt = connection.createStatement();
            ResultSet visual = stmt.executeQuery( "SELECT * FROM VISUALIZZAZIONI");
            JsonObject jsonObject = new JsonObject();
            while (visual.next()) {
                VISUAL vis = new VISUAL();
                String pagina=visual.getString("PAGINA");
                int visualizzazioni=visual.getInt("VISUAL");

                vis.setPagina(pagina);
                vis.setVisual(visualizzazioni);
                output.add(vis);
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            JsonArray array= new JsonArray();
            for(VISUAL vis : output){
                Gson gson = new Gson();
                array.add(gson.toJson(vis));
            }

            out.println(array);
            out.flush();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Statement stmt = connection.createStatement();
            String updateQuery = null;
            String pagina = request.getParameter("pagina");
            if(pagina==null) {
                System.out.println("ERRORE - NULL");
            }
            updateQuery = "UPDATE PROVA.VISUALIZZAZIONI SET VISUAL=VISUAL+1 WHERE PAGINA = '"+pagina+"' ";


            PreparedStatement query = connection.prepareStatement(updateQuery);
            query.executeUpdate();


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
