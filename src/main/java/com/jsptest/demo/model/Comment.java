package com.jsptest.demo.model;

import lombok.Data;

@Data
public class Comment {

    private Long id;
    private String contents;
    private String writer;
}
