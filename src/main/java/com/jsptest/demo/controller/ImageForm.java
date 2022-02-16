package com.jsptest.demo.controller;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class ImageForm {

    private List<MultipartFile> imageFiles;
    private MultipartFile attachFile;

}
