<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>세미프로젝트V1-join</title>
        <link rel="stylesheet" href="/css/base.css">
    </head>
    <style>
        #join { width: 300px; margin: 100px auto; /*border: 1px solid red*/}
        #joinfrm div { margin-bottom: 10px;}
        #joinfrm label { display: inline-block; width: 110px;
                        text-align: right; font-weight: bold;
                        /*border: 1px solid blue*/}
        input, button { padding: 5px}
        input { width: 127px}
    </style>

    <body>
        <div id=wrap>
        
        <%@ include file="/layout/header.jsp" %>
        
        <div id="container">
                <form name="joinfrm" id="joinfrm" method="post">
                <hr>
                <h2>회원가입</h2>
                <div id=join>
                <div>
                    <label for="userid">아이디</label>
                    <input type="text" name="userid" id="userid">
                </div>
                <div>
                    <label for="userpwd">비밀번호</label>
                    <input type="text" name="userpwd" id="userpwd">
                </div>

                <div>
                    <label for="pwdcheck">비밀번호 확인</label>
                    <input type="text" name="userpwd" id="pwdcheck">
                </div>

                <div>
                    <label for="username">이름</label>
                    <input type="text" name="userpwd" id="username">
                </div>

                <div>
                    <label for="username">이메일</label>
                    <input type="text" name="email" id="email">
                </div>

                <div><label></label>
                    <button type="submit">입력완료</button>
                    <button type="reset">다시입력</button>
                </div>
                </div>
                </form>
        </div>
        	<%@ include file="/layout/footer.jsp" %>
        </div>
    </body>
</html>
