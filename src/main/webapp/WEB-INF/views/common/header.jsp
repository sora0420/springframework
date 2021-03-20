<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Spring</title>
		<%-- application : ServeltContet 객체(웹 어플리케이션의 실행정보를 가지고 있는 객체) 참조  
		// 밑에 link rel href="<%=application.getContextPath()%> 
		script src="${pageContext.request.contextPath}/밑에 나머지 주소
		<%=pageContext.getServletContext().getContextPath()%>
		>>el로 바꾸기 >> ${pageContext.servletContext.contextPath}
		link / script 위에 셋다가능
		전체 실행하는데 필요한 실행정보를 가짐
		--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>	</head>
  <body>
    <div class="d-flex flex-column vh-100">
			<%-- 헤더 부분 --%>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark text-white font-weight-bold justify-content-between">
			  <a class="navbar-brand" href="./">
			    <img src="./resources/images/spring_logo.png" width="30" height="30" class="d-inline-block align-top">
			    Spring
			  </a>
			  <div>
			    <div>
			      <a class="btn btn-success btn-sm" href="#">로그인</a>
					</div>
			  </div>
			</nav>

			<div class="flex-grow-1 container-fluid">
        <div class="row h-100">
          <div class="col-md-4 p-3 bg-dark">
            <div class="h-100 d-flex flex-column">
              <div class="flex-grow-1" style="height:0px; overflow-y: auto; overflow-x: hidden;">
                <%-- 메뉴 부분 --%>
                <%@ include file="/WEB-INF/views/common/menu.jsp" %>
      
              </div>
            </div>
          </div>

          <div class="col-md-8 p-3">
            <div class=" h-100 d-flex flex-column">
              <div class="flex-grow-1 overflow-auto pr-3" style="height:0px">