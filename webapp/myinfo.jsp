<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="gahee.jdbc" />
<fmt:message key="url" var="url" />
<fmt:message key="drv" var="drv" />
<fmt:message key="usr" var="usr" />
<fmt:message key="pwd" var="pwd" />

<c:set var="url">jdbc:mariadb://bigdata.cnuqv3vtwjri.ap-northeast-2.rds.amazonaws.com:3306/playground</c:set>
<c:set var="drv">org.mariadb.jdbc.Driver</c:set>
<c:set var="usr">playground</c:set>
<c:set var="pwd">bigdata2020</c:set>

<sql:setDataSource var="mariadb" 
	url="${url}" driver="${drv}" user="${usr}" password="${pwd}" />


<sql:query var="rs" dataSource="${mariadb}">
	select name,email,joindate from member
	where userid= ?
	<sql:param value="${sessionScope.userid}" />
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<c:set var="name" value="${rs.name}" />
	<c:set var="email" value="${rs.email}" />
	<c:set var="regdate" value="${rs.joindate}" />
</c:forEach>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>세미프로젝트V1-myinfo</title>
        <link rel="stylesheet" href="/css/base.css">
    </head>
    <style>

        #myinfo {width: 300px; margin: 100px auto;
                 /*border: 1px solid black*/}
        .label { display: inline-block; width: 120px;
                 text-align: right; font-weight: bold;
                 padding-right: 5px}
    </style>
    <body>
        <div id="wrap">
        	<%@ include file="/layout/header.jsp" %>
        	<div id="container">
                <hr>
                <h2>회원정보</h2>
                <div id="myinfo">
                	
                    <div>
                        <span class="label">아이디</span>
                        <span>${sessionScope.userid}</span>
                    </div>
                    <div>
                        <span class="label">&nbsp;&nbsp;&nbsp;이름</span>
                        <span>${name}</span>
                    </div>
                    <div>
                        <span class="label">이메일</span>
                        <span>${email}</span>
                    </div>
                    <div>
                        <span class="label">가입일</span>
                        <span>${joindate}</span>
                    </div>
                </div>

        </div>
        	<%@ include file="/layout/footer.jsp" %>
        </div>
    </body>
</html>
