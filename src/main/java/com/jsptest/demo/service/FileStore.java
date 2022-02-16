package com.jsptest.demo.service;

import com.jsptest.demo.model.UploadFile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class FileStore {

    @Value("${file.dir}")
    private String fileDir;

    public String getFullPath(String filename){
        return fileDir + filename;
    }

    public List<UploadFile> storeFiles(List<MultipartFile> multipartFiles) throws IOException {

        List<UploadFile> storeFileResult = new ArrayList<>();

        for (MultipartFile multipartFile : multipartFiles) {
            if (!multipartFile.isEmpty()){
                UploadFile uploadFile = storeFile(multipartFile);
                storeFileResult.add(uploadFile);
            }
        }

        return storeFileResult;
    }



    public UploadFile storeFile(MultipartFile multipartFile) throws IOException {
        if (multipartFile.isEmpty()){
            return null;
        }

        String originalFilename = multipartFile.getOriginalFilename(); //서버 저장 파일명

        String uuid = UUID.randomUUID().toString();

        int pos = originalFilename.lastIndexOf(".");   //
        String ext = originalFilename.substring(pos + 1); //확장자 뽑아옴


        String storeFileName = uuid + "." + ext;

        multipartFile.transferTo(new File(getFullPath(storeFileName)));

        return new UploadFile(originalFilename, storeFileName);
    }


}
