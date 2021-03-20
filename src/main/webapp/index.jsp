<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--jsp에서 redirect 첫번째 방법 

<%response.sendRedirect(application.getContextPath()+"/home"); %>
--%>

<%--jsp에서 redirect 두번째 방법 / c: c로 시작하는 태그--%>
<c:redirect url="/home"/>
