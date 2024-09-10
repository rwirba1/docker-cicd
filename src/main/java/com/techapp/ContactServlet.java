package com.techapp;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

// @WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String details = request.getParameter("details");

        // Here, you can process the email and details. For example, store them in a database, send an email, etc.

        // After processing, redirect back to the main page with a thank you message or similar.
        response.sendRedirect("/index.jsp?message=Thank+you+for+your+inquiry!");
    }
}
