package com.jsptest.demo.controller;

import com.jsptest.demo.mapper.FileMapper;
import com.jsptest.demo.model.UploadFile;
import com.jsptest.demo.service.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ImageController {

    private final FileStore fileStore;
    private final FileMapper fileMapper;

    @Value("${file.dir}")
    private String fileDir;

    @GetMapping("/image")
    public String imageMain(@ModelAttribute ImageForm form){
        return "imageMain";
    }

    @PostMapping("/saveImage")
    public String imageSave(@ModelAttribute ImageForm form, RedirectAttributes redirectAttributes) throws IOException {

        MultipartFile attachFile = form.getAttachFile();
        UploadFile uploadFile = fileStore.storeFile(attachFile);

        System.out.println(uploadFile);
        List<MultipartFile> imageFiles = form.getImageFiles();
        List<UploadFile> uploadFiles = fileStore.storeFiles(imageFiles);

        fileMapper.fileAdd(uploadFile);
        fileMapper.imageAdd(uploadFiles);

        return "redirect:/";
    }
}
