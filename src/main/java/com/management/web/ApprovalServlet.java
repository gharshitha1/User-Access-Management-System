package com.management.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.management.web.dao.ApprovalDao;

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    private ApprovalDao approvalDao;

    @Override
    public void init() throws ServletException {
        approvalDao = new ApprovalDao(); // Initialize ApprovalDao
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String[] selectedRequests = request.getParameterValues("selectedRequests"); // Get selected requests

        if (selectedRequests != null) {
            String newStatus = action.equals("approve") ? "Approved" : "Rejected";
            for (String requestId : selectedRequests) {
                approvalDao.updateRequestStatus(Integer.parseInt(requestId), newStatus);
            }
        }

        response.sendRedirect("pendingRequests.jsp"); 
    }
}
