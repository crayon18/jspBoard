<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="text-center">

<div class="container">

<main class="form-signin">
  <form name="loginForm" method="post" action="/login">
    <h1 class="h3 mb-5 fw-normal">Login</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="mb_id" name="mb_id">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="mb_pw" name="mb_pw">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3"></div>

    <button class="w-100 btn btn-lg btn-primary" type="submit">Login</button>
  </form>
</main>
</div>
</body>
</html>