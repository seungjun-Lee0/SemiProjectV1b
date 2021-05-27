<%@ page pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:requestEncoding value="UTF-8"/>
<fmt:setBundle basename="lsj.jdbc"/>
<fmt:message key="url" var="url"/>
<fmt:message key="drv" var="drv"/>
<fmt:message key="usr" var="usr"/>
<fmt:message key="pwd" var="pwd"/>

<sql:setDataSource url="${url}" driver="${drv}" 
user="${usr}" password="${pwd}" var="mariadb" />
 
<sql:query var="rs" dataSource="${mariadb}">
select bdno, title, userid, regdate, views from board
order by bdno DESC
</sql:query> 


			
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>세미프로젝트V1-list</title>
        <link rel="stylesheet" href="/css/base.css">
        <style>
            table {width : 75%; margin: 0 auto;
                border-collapse: collapse;
                table-layout: fixed;}
            th, td { border: 1px solid black;
             text-align: center; padding: 10px}
            td:nth-child(2) {white-space:nowrap; overflow: hidden;
                        text-overflow: ellipsis}
            button {width: 100px; padding: 5px; margin-right: -10px}
            .newbtn {text-align: right; border: none;}
            .tbnav {border : none;}
            .cpage { font-weight: bold; color: red; font-size: 35px}
        </style>
    </head>
    <body>
        <div id="wrap">
        <%@ include file="/layout/header.jsp" %>
        <div id="container">
        <h2>게시판</h2>
        <table>
            <colgroup> <!-- 테이블 컬럼 스타일 정의 -->
                <col style="width:10%">
                <col style="">
                <col style="width:15%">
                <col style="width:15%">
                <col style="width:10%">
            </colgroup>
            <thead>

            <tr><td colspan="5" class="newbtn">
            	<c:if test="${not empty sessionScope.userid }">
                <button type="button" id="writebtn">글쓰기</button>
                </c:if>
                <c:if test="${empty sessionScope.userid }">
                &nbsp;
                </c:if>
                </td></tr>
			
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
                </tr></thead>
            <tbody>
           
           
            <c:forEach var="row" items="${rs.rows}" varStatus="no">
				<tr>
                	<td>${no.count}</td>
                	<td><a href="/board/view.jsp?bdno=${row.bdno}">${row.title}</a></td>
                	<td>${row.userid}</td>
                	<td>${fn:substring(row.regdate,0,10)}</td>
                	<td>${row.views}</td>
            	</tr>
			</c:forEach>
			  
            </tbody>
            <tfoot>
                <tr><td colspan="5" class="tbnav">
                    <span>◁ ◀◀<span class="cpage">1</span> 2 3 4 5 6 7 8 9 10▶▶ ▷</span>
                    </td></tr>
            </tfoot>
            </table>
        </div>
        <%@ include file="/layout/footer.jsp" %>
        </div>
        
        <script>
				var writebtn = document.getElementById('writebtn');
	        	writebtn.addEventListener('click', writeSome);
	        	function writeSome(){
	        		location.href("/board/write.jsp");
	        	}
		</script>
    </body>
</html>