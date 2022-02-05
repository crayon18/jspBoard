package com.jsptest.demo.service;

import com.jsptest.demo.mapper.CommentMapper;
import com.jsptest.demo.model.Comment;
import com.jsptest.demo.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentService {

    private CommentMapper commentMapper;

    public void insertComment(Comment comment, User user){
        comment.setWriter(user.getMb_id());
        commentMapper.saveComment(comment);
    }
}
