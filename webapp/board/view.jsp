<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>세미프로젝트V1-view</title>
        <link rel="stylesheet" href="/css/base.css">
    </head>

    <body>
        <div id="wrap">
        <header>
            <h1>SemiProjectV1</h1>
        </header>
      		<%@ include file="/layout/header.jsp" %>
        <div id="container">
            <form>
                <table cellpadding="10" cellspacing="0">
                <hr>
                <h2>게시판 본문글</h2>
                <tr>
                    <td>제목</td>
                    <td>시간은 금이라구, 친구</td>
                </tr>

                <tr>
                    <td>작성자</td>
                    <td>user</td>
                </tr>

                <tr>
                    <td>작성일</td>
                    <td>2014-05-05</td>
                </tr>

                <tr>
                    <td>본문</td>
                    <td>시간은 금이라구,친구!!</td>
                </tr>
                </table>
            </form>
        </div>
        	<%@ include file="/layout/footer.jsp" %>
        </div>
    </body>
</html>
