package com.jsptest.demo.service;

import com.jsptest.demo.mapper.BoardMapper;
import com.jsptest.demo.model.Board;
import com.jsptest.demo.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardMapper boardMapper;

    public void writeBoard(Board board,User user) {
        board.setCreate_time(LocalDateTime.now());
        board.setWriter(user.getMb_id());
        boardMapper.boardAdd(board);
    }

    public Board findBoardNumber(Long id){
        Board board = boardMapper.findBoard(id);
        return board;
    }
}
