package com.jsptest.demo.mapper;

import com.jsptest.demo.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {

    List<User> findAll();

    void userAdd(User user);
}
