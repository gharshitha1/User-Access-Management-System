package com.management.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.management.web.dao.RequestDao;
import com.management.web.dao.UserDao;
import com.management.web.model.Request;
import com.management.web.model.User;

@WebServlet("/RequestServlet")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        UserDao userDao = new UserDao();
        int userId = userDao.getUserIdByUsername(username);
        int softwareId=Integer.parseInt(request.getParameter("softwareId"));
        String accessType=request.getParameter("accessType");
        String reason=request.getParameter("reason");
        Request r=new Request();
        r.setUserId(userId);
        r.setAccessType(accessType);
        r.setSoftwareId(softwareId);
        r.setReason(reason);
        RequestDao dao=new RequestDao();
        dao.addRequest(r);
        System.out.println("Username:"+username+" userid:"+userId);
        System.out.println(r);
        response.sendRedirect("signup.jsp");
    }   
}
