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
            <h2>${list.title}</h2>
            <h3>${list.writer}</h3>
            <h3>${list.contents}</h3>
        </div>


<div class="container">
        <label for="content">comment</label>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="id" value="${list.id}"/>
               <input type="text" class="form-control" id="contents" name="contents" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button id="btnComment" type="button" onclick="commentInsert()">등록</button>
               </span>
              </div>
        </form>
    </div>

    <div class="container">
        <div class="commentList"></div>
    </div>
</div>
</div>

<script>

var bno = '${list.id}';


function commentList(){
    $.ajax({
        url : '/comment/list',
        type : 'get',
        data : {'bno':bno},
        success : function(data){
            var a ='';
            $.each(data, function(key, value){
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'댓글번호 : '+value.cno+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.cno+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });

            $(".commentList").html(a);
        }
    });
}


function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : ${"#commentInsertForm"}.serialize(),
        success : function(data){
            if(data == "success") {
                commentList();
                $("#commentInsertForm").val('');
            }
        }
    });
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdate(cno, content){
    var a ='';

    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';

    $('.commentContent'+cno).html(a);

}

//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();

    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력
        }
    });
}

//댓글 삭제
function commentDelete(cno){
    $.ajax({
        url : '/comment/delete/'+cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력
        }
    });
}




$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력
});



</script>


</body>
</html>