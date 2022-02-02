package com.jsptest.demo.service;

import com.jsptest.demo.mapper.UserMapper;
import com.jsptest.demo.model.User;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    public void saveUser(User user) {
        userMapper.userAdd(user);
    }

    public User userLogin(User user){

       User userLogin = userMapper.login(user);

       if (user.getMb_pw().equals(userLogin.getMb_pw())){
           return userLogin;
       }
       else {
           return null;
       }
    }

}
