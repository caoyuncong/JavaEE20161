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
@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        String password = req.getParameter("password");
        String[] cities = req.getParameterValues("city");
        String[] hobbies = req.getParameterValues("hobby");
        String city = "";
        for (String c : cities) {
            city += c;
            city += " ";
        }
        String hobby = "";
        for (String h : hobbies) {
            hobby += h;
            hobby += " ";
        }

        try {
            new Driver();
            Connection connection = DriverManager.getConnection("jdbc:mysql:///db_javaee?user=root&password=system");
            String emailSql = "SELECT * FROM db_javaee.user WHERE email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(emailSql);
            preparedStatement.setString(1, email);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()) {
                req.setAttribute("message", "邮箱已经存在");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
                resultSet.close();
            }else {
                String sql = "INSERT INTO db_javaee.user VALUES (NULL,?,?,?,?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, DigestUtils.md5Hex(password));
                preparedStatement.setString(3, city);
                preparedStatement.setString(4, hobby);
                preparedStatement.executeUpdate();
            }
            preparedStatement.close();
            connection.close();


//    request.getRequestDispatcher("index.jsp").forward(request, response); // 转发
            // 不够安全：密码
            // 不改变地址栏地址：register.jsp - 重复提交表单
            resp.sendRedirect("index.jsp"); // 重定向
            // 相对安全
            // 改变地址：register.jsp - index.jsp 不会重复提交表单
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
