package com.management.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.management.web.dao.UserDao;
import com.management.web.model.User;

@WebServlet({ "/SignUpServlet", "/SignUp" })
public class SignUpServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password= request.getParameter("password");
        String role= request.getParameter("role");
        
        User a = new User();
        a.setUsername(username);
        a.setPassword(password);
        a.setRole(role);
        
        UserDao dao = new UserDao();
        dao.addUser(a); 
        HttpSession session = request.getSession();
        int userId = dao.addUser(a); 
        a.setId(userId); 
        session.setAttribute("user", a); 
        response.sendRedirect("login.jsp");
    }
}
