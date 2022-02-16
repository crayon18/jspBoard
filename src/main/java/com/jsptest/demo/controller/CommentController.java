package com.jsptest.demo.controller;

import com.jsptest.demo.login.SessionConst;
import com.jsptest.demo.model.Comment;
import com.jsptest.demo.model.User;
import com.jsptest.demo.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;

    @PostMapping(value = "/comment/insert", produces = "application/json")
    public String commentInsert(@RequestParam Long id, @RequestParam String contents, Model model, HttpServletRequest request, Comment comment){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(SessionConst.LOGIN_MEMBER);

        try {
            commentService.insertComment(comment,user);

        }catch (Exception e){
            e.printStackTrace();
        }

        return "success";
    }
}
