package com.jsptest.demo.mapper;

import com.jsptest.demo.model.Board;
import com.jsptest.demo.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BoardMapper {

    List<Board> findBoardAll();

    void boardAdd(Board board);

    Board findBoard(Long id);

}
