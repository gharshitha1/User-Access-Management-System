package com.management.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.management.web.dao.LoginDao;
import com.management.web.model.User;

@WebServlet({ "/LoginServlet", "/Login" })
public class LoginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginDao dao = new LoginDao();
        User a1 = dao.validateUser(username,password);
        if(a1!=null) {
        	HttpSession session = request.getSession();
            session.setAttribute("username", username); 
        	String role=a1.getRole();
        	if(role.equals("Admin")) {
        		response.sendRedirect("DashBoard.jsp");
        	}
        	else if(role.equals("Manager")) {
        		response.sendRedirect("pendingRequests.jsp");
        	}
        	else {
        		  response.sendRedirect("requestAccess.jsp");
        	}
        }
        else {
          response.sendRedirect("login.jsp?error=invalid");
        }
    }
}
