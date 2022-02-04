package com.jsptest.demo.controller;

import com.jsptest.demo.login.SessionConst;
import com.jsptest.demo.model.Board;
import com.jsptest.demo.model.User;
import com.jsptest.demo.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/board-write")
    public String boardWrite(){
        return "write";
    }

    @PostMapping("/board-write")
    public String boardSave(Board board, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute(SessionConst.LOGIN_MEMBER);

        boardService.writeBoard(board,user);

        return "redirect:/";
    }
}
