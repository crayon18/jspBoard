<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

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

          <c:if test="${loginMember != null }">
          <a class="btn btn-white btn-lg text-black" style="margin: 0 10px" role="button"
                             aria-disabled="false" href="/board-write">글쓰기</a>
          </c:if>

            <form name="loginForm" method="get" action="/login">
               <c:if test="${loginMember == null }">
                  <button type="submit">로그인</button>
               </c:if>
             </form>

             <form name="logoutForm" method="post" action="/logout">
                <c:if test="${loginMember != null }">
                    <button type="submit">로그아웃</button>
                </c:if>
             </form>

          </ul>
        </header>

    </div>
</body>
</html>