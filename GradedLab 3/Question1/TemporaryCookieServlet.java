import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TemporaryCookieServlet")
public class TemporaryCookieServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String COOKIE_NAME = "TempCookie";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Check if the cookie is already present
        Cookie[] cookies = request.getCookies();
        boolean cookieExists = false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (COOKIE_NAME.equals(cookie.getName())) {
                    cookieExists = true;
                    break;
                }
            }
        }

        // Display the message based on cookie existence
        if (cookieExists) {
            out.println("<h3>Cookie is present.</h3>");
        } else {
            // If the cookie does not exist, create a new one with 1 minute expiry
            Cookie tempCookie = new Cookie(COOKIE_NAME, "tempValue");
            tempCookie.setMaxAge(60); // 60 seconds = 1 minute
            response.addCookie(tempCookie);
            out.println("<h3>Cookie has expired or is not present. Creating a new cookie...</h3>");
        }

        out.close();
    }
}
