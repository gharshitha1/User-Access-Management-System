package com.management.web;

import java.io.IOException;

import com.management.web.dao.SoftwareDao;
import com.management.web.dao.UserDao;
import com.management.web.model.Software;
import com.management.web.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/SoftwareServlet")
public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String[] accessLevelsArray = request.getParameterValues("accessLevels");
        String accessLevels = (accessLevelsArray != null) ? String.join(",", accessLevelsArray) : ""; 
        Software a = new Software();
        a.setName(name);
        a.setDescription(description);
        a.setAccessLevels(accessLevels); 
        SoftwareDao dao = new SoftwareDao();
        dao.addSoftware(a); 
        HttpSession session = request.getSession();
        session.setAttribute("alien", a);
        response.sendRedirect("createSoftware.jsp?success=true");
    }
}
