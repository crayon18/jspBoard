package com.jsptest.demo.controller;

import com.jsptest.demo.login.SessionConst;
import com.jsptest.demo.model.Board;
import com.jsptest.demo.model.Comment;
import com.jsptest.demo.model.User;
import com.jsptest.demo.service.BoardService;
import com.jsptest.demo.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class BoardController {

    private final BoardService boardService;
    private final CommentService commentService;

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

    @GetMapping("/board-read/{id}")
    public String boardRead(Model model, @PathVariable Long id){

        Board boardNumber = boardService.findBoardNumber(id);

        model.addAttribute("list",boardNumber);

        return "read";
    }

    @PostMapping("/comment/insert")
    public String commentInsert(@RequestParam Long id, @RequestParam String contents, HttpServletRequest request, Comment comment){
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
