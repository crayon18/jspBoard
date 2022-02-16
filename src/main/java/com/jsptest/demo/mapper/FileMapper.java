package com.jsptest.demo.mapper;

import com.jsptest.demo.model.UploadFile;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Mapper
@Repository
public interface FileMapper {

    void imageAdd(List<UploadFile> uploadFile);

    void fileAdd(UploadFile uploadFile);
}
