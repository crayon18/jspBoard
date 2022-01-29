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

          <ul class="nav nav-pills">
            <li class="nav-item"><a href="#" class="nav-link" aria-current="page">글쓰기</a></li>
          </ul>
        </header>

        <div class="row justify-content-center">
                <form class="needs-validation col-sm-4"
                            action="/join" method="post" novalidate>
                    <div class="form-group" style="padding:10px">
                        <input id="mb_id" type="text" name="mb_id" class="form-control"
                               placeholder="아이디" aria-describedby="mb_idHelp" required minlength="3" maxlength="20">
                        <small id="mb_idHelp" class="form-text text-muted">
                            공백없이 문자와 숫자로만 3자 이상 20자 이내로 입력해주세요!
                        </small>
                        <small class="invalid-feedback">아이디를 입력하세요.</small>
                    </div>

                    <div class="form-group" style="padding:10px">
                        <input id="mb_pw" type="text" class="form-control"
                               placeholder="비밀번호" aria-describedby="passwordHelp" name="mb_pw" required minlength="3" maxlength="20">
                        <small id="passwordHelp" class="form-text text-muted">
                            Dumbbell+ 이용시 사용될 닉네임을 정해주세요!
                        </small>
                        <small class="invalid-feedback">비밀번호를 입력하세요.</small>
                    </div>

                    <div class="form-group d-grid gap-2" style="padding:10px">
                        <button class="btn btn-lg btn-dark text-white" type="submit" aria-describedby="submitHelp">가입하기</button>
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