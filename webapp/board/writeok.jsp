<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
<sql:query var="rs" dataSource="${mariadb}">
	select userid from board
	where userid =?
	<sql:param value="${sessionScope.userid}"/>
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<c:set var="userid" value="${row.userid}"/>
</c:forEach>

