<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container">

    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
              <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">jsp 게시판</span>
              </a>
    </header>

        <div class="py-5 text-center">
            <h2>게시글 작성</h2>
        </div>

        <div class="row justify-content-center">
                    <form class="needs-validation col-sm-10"
                                action="/board-write" method="post" novalidate>

                        <div class="form-group">
                            <input id="title" type="text" name="title" class="form-control"
                                   placeholder="제목" aria-describedby="titleHelp" required minlength="2">
                            <small id="titleHelp" class="form-text text-muted">
                                글 제목을 입력해주세요
                            </small>
                            <small class="invalid-feedback">제목을 입력하세요.</small>
                        </div>

                        <div class="form-group">
                            <textarea id="contents" class="form-control"
                                   placeholder="내용" aria-describedby="contentsHelp" name="contents" required maxlength="500"></textarea>
                            <small id="contentsHelp" class="form-text text-muted">
                                내용을 입력해주세요
                            </small>
                            <small class="invalid-feedback">내용을 입력하세요.</small>
                        </div>

                        <div class="form-group d-grid gap-2" style="padding:10px">
                            <button class="btn btn-lg btn-dark text-white" type="submit" aria-describedby="submitHelp">작성하기</button>
                        </div>
                    </form>
        </div>

    </div>

    <script type="application/javascript">
              (function (){
                  'use strict';

                  window.addEventListener('load', function(){
                  var forms = document.querySelectorAll('.needs-validation')

                  Array.prototype.filter.call(forms, function (form) {
                  form.addEventListener('submit', function (event) {
                      if(form.checkValidity() == false){
                      event.preventDefault()
                      event.stopPropagation()
                      }
              form. classList.add('was-validated')
              },false)
              })
              }, false)
              }())
          </script>
</body>
</html>