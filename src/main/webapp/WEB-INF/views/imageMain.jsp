<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
    <div class="container">
        <form method="post" action="/saveImage" enctype="multipart/form-data">
            <span>첨부파일</span><input type="file" name="attachFile">
            <span>이미지</span><input type="file" name="imageFiles" multiple="multiple">
            <input type="submit">
        <form>
     </div>
</body>
</html>