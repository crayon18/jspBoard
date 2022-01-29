package com.jsptest.demo.service;

import com.jsptest.demo.mapper.UserMapper;
import com.jsptest.demo.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    public void saveUser(User user) {
        userMapper.userAdd(user);
    }
}
