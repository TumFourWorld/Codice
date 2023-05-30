package suzu.tum4world.progetto;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "cookie", value = "/cookie")
public class cookie extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cookieString =request.getParameter("param");
        System.out.println(cookieString);

        if(cookieString.equals("true")){
            //cookie accettati
            Cookie checkCookie = new Cookie("cookie", "true");
            checkCookie.setMaxAge(3600);
            response.addCookie(checkCookie);
            response.getWriter().write("accettati");
        }
        else {
            //cookie non accettati
            Cookie checkCookie = new Cookie("cookie", "false");
            checkCookie.setMaxAge(3600);
            response.addCookie(checkCookie);
        }

    }
}