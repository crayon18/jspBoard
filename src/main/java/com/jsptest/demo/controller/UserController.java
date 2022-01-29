package com.jsptest.demo.controller;

import com.jsptest.demo.mapper.UserMapper;
import com.jsptest.demo.model.User;
import com.jsptest.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String joinSave(User user){
        userService.saveUser(user);

        return "home";
    }
}
