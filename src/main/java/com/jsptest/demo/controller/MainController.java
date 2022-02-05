package com.jsptest.demo.controller;

import com.jsptest.demo.mapper.BoardMapper;
import com.jsptest.demo.model.Board;
import com.jsptest.demo.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final BoardMapper boardMapper;

    @GetMapping("/")
    public String home(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();

        List<Board> boardList = boardMapper.findBoardAll();

        model.addAttribute("list", boardList);
        
        return "home";
    }
}
