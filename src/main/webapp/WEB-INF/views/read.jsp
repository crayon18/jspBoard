<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <div class="container">

    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
              <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
                <span class="fs-4">jsp 게시판</span>
              </a>
    </header>

        <div class="py-5 text-center">
            <h2>${list.title}</h2>
            <h3>${list.writer}</h3>
            <h3>${list.contents}</h3>
        </div>


<div class="container">
        <label for="content">comment</label>
        <form>
            <div class="input-group">
               <input type="hidden" name="id" value="${list.id}"/>
               <input type="text" class="form-control" id="contents" name="contents" placeholder="내용을 입력하세요.">

               <button id="replyRegist" type="button" class="btn btn-danger replyRegist">등록</button>

              </div>
        </form>
    </div>

    <a href="javascript:void(0);" class='test'>test</a>
    <div class='hidden'>TEST Hidden Box</div>

</div>
</div>

<script>
$(document).ready(function(){
  $(document).on("click",".replyRegist", function(){
            $(".hidden").fadeToggle('fast');

                    var bno = "${list.id}" // 글번호
    				var reply = $("#contents").val();

                 $.ajax({
                    type : "post",
                    url : "/comment/insert",
                    datatype : "json",
                    contentType : "application/json; charset=UTF-8",
                    data : JSON.stringify({"bno": bno, "reply" : reply}),
                    success : function(data){
                        if(data == 1){ // 성공
                            $("#reply").val("");

                        } else { // 실패
                            alert("등록 실패입니다. 다시 시도하세요");
                        }
                    },
                    error : function(status, error){
                    	alert("등록 실패입니다. 잠시 후에 다시 시도하세요");
                    }


                   });
            });
	</script>
</body>
</html>