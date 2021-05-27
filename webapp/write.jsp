<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<fmt:setBundle basename="lsj.jdbc"/>
<fmt:message key="url" var="url"/>
<fmt:message key="drv" var="drv"/>
<fmt:message key="usr" var="usr"/>
<fmt:message key="pwd" var="pwd"/>
 
 <sql:setDataSource url="${url}" driver="${drv}" 
 user="${usr}" password="${pwd}" var="mariadb" />
 
<c:if test="${empty sessionScope.userid}">
<script>alert('로그인하세요');
 		location.href='/login.jsp';</script>
</c:if>
 
<sql:query var="rs" dataSource="${mariadb}">
	select userid from board
	where userid =?
	<sql:param value="${sessionScope.userid}"/>
</sql:query>

<!doctype html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>세미프로젝트V1-index</title>
        <link rel="stylesheet" href="/css/base.css">
        <style>
        	#boardfrm { width:750px; margin: 0 auto; 
        				padding-top: 50px }
        	#boardfrm div { margin-bottom: 10px; }	
        	#boardfrm div label { font-weight: bold;
        		display:inline-block; width: 120px; 
        		text-align: right; }
        	#contents { display: inline-block;
        		width: 450px; height:150px; }
        	.dragup { vertical-align: top;  }
        </style>
    </head>
    <body>
        <div id="wrap">
      		<%@ include file="/layout/header.jsp" %>
        <div id="container">
    		<h1>게시판 - 글쓰기</h1>
    		<form name="boardfrm" id="boardfrm">
    			<div>
    				<label>제목</label>
    				<input type="text" name="title" />
    			</div>
    			<div>
    				<label>작성자</label>
    				<input type="text" name="userid"
    				value="${sessionScope.userid}" 
    				readonly/>
    			</div>
    			<div>
    				<label class="dragup">본문</label>
    				<textarea id="contents" name="contents"></textarea>
    			</div>
    			<div><label></label>
    				<button type="button" id="writebtn">입력완료</button>
    				<button type="reset">다시입력</button>
    			</div>
    		</form>
        </div>
       		<%@ include file="/layout/footer.jsp" %>
        </div>
        
		<script>
		var writebtn = document.getElementById('writebtn');
        writebtn.addEventListener('click', checkwritefrm);
        
        function checkwritefrm() {
        	var frm = document.getElementById('boardfrm');
        	if (frm.title.value == '')
        		alert('제목을 입력하세요!');
        	else if (frm.contents.value == '')
        		alert('본문을 입력하세요!')
        	else {
        		frm.action ='writeok.jsp';
        		frm.submit();
        	}
        }
		</script>
    </body>
</html>