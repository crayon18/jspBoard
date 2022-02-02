package com.jsptest.demo.model;

import com.jsptest.demo.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {

    private String mb_id;
    private String mb_pw;

}
