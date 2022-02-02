package com.jsptest.demo.controller;

import com.jsptest.demo.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class MainController {

    @GetMapping("/")
    public String home(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();

        System.out.println(session.getId());

        return "home";
    }
}
