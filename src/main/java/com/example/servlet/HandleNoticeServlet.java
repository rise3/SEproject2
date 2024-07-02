package com.example.servlet;

import com.example.entity.*;
import com.example.service.DoctorHandleService;
import com.example.service.Impl.DoctorHandleServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet("/handleNotice")
public class HandleNoticeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String usertype = req.getParameter("usertype");

        switch (usertype) {
            case "patient":
                resp.sendRedirect("/register");
                break;
            case "doctor":
                resp.sendRedirect("/doctorHandle");
                break;
            case "admin":
                resp.sendRedirect("admin");
                break;
        }
    }
}
