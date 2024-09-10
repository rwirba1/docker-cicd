package com.techapp;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class CourseServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String course = request.getParameter("course");
        String definition = "";
        String installation = "";

        switch (course) {
            case "Git":
                definition = "Git is a distributed version control system.";
                installation = "Step 1: sudo apt-get update\nStep 2: sudo apt install git";
                break;
            case "Jenkins":
                definition = "Jenkins is a popular automation server.";
                installation = "Step 1: sudo apt-get update\nStep 2: sudo apt install jenkins";
                break;
            case "Ansible":
                definition = "Ansible is an open-source software provisioning, configuration management, and application-deployment tool.";
                installation = "Step 1: sudo apt-get update\nStep 2: sudo apt install ansible";
                break;
            case "Terraform":
                definition = "Terraform is an infrastructure as code tool for building, changing, and versioning infrastructure safely and efficiently.";
                installation = "Step 1: sudo apt-get update\n(Additional installation steps for Terraform)";
                break;
            case "Docker":
                definition = "Docker is a platform used to develop, ship, and run applications inside containers.";
                installation = "Step 1: sudo apt-get update\nStep 2: sudo apt install docker.io";
                break;
            case "Kubernetes":
                definition = "Kubernetes is an open-source container orchestration platform.";
                installation = "Step 1: sudo apt-get update\n(Additional installation steps for Kubernetes)";
                break;
        }

        request.setAttribute("definition", definition);
        request.setAttribute("installation", installation);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
