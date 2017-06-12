package servlet;

import com.mysql.jdbc.Driver;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by Administrator on 2017/2/13.
 */
@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        String password = req.getParameter("password");

        try {
            new Driver();
            String url = "jdbc:mysql:///db_javaee?user=root&password=system";
            String sql = "SELECT * FROM db_javaee.user WHERE email=? AND password=?";
            try (Connection connection = DriverManager.getConnection(url);
                 PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, DigestUtils.md5Hex(password));
                try (ResultSet resultSet = preparedStatement.executeQuery();) {
                    if (resultSet.next()) {
//                      request.setAttribute("email", email);
//                      request.getRequestDispatcher("home.jsp").forward(request, response);
                        req.getSession().setAttribute("email", email);
                        resp.sendRedirect("home.jsp");
                    } else {
                        req.setAttribute("message", "邮箱或密码错误");
                        req.getRequestDispatcher("index.jsp").forward(req, resp);
//                          转发会保存request 范围内的属性
//                      response.sendRedirect("index.jsp");
//                      重定向不会保存request 范围内的属性
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
