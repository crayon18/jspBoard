package com.jsptest.demo.controller;

import com.jsptest.demo.login.SessionConst;
import com.jsptest.demo.mapper.UserMapper;
import com.jsptest.demo.model.User;
import com.jsptest.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserMapper userMapper;
    private final UserService userService;

    @GetMapping("/join")
    public String join(){

        return "join";
    }

    @PostMapping("/join")
    public String joinSave(User user, HttpServletRequest request){

        userService.saveUser(user);
        User user1 = userService.userLogin(user);

        HttpSession session = request.getSession();

        session.setAttribute(SessionConst.LOGIN_MEMBER, user1);

        return "redirect:/";
    }

    @GetMapping("/login")
    public String login(){

        return "login";
    }

    @PostMapping("/login")
    public String loginUser(User user, HttpServletRequest request){
        HttpSession session = request.getSession();

        User checkUser = userService.userLogin(user);

        if (checkUser == null){
            return "login";
        }else {
            session.setAttribute(SessionConst.LOGIN_MEMBER,checkUser);
        }

        return "redirect:/";
    }

    @PostMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session != null){
            session.invalidate();
        }
        return "redirect:/";
    }
}
