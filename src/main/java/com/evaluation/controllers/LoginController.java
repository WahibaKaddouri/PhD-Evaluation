package com.evaluation.controllers;


import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {




    @RequestMapping(value = { "/logout" }, method = RequestMethod.GET)
    public String logoutDo(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession(false);
        SecurityContextHolder.clearContext();
        session = request.getSession(false);

        if (session != null) {
            session.invalidate();
            session = null;
        }

        for (Cookie cookie : request.getCookies()) {
            cookie.setMaxAge(0);
        }

        return "login2";
    }
}



