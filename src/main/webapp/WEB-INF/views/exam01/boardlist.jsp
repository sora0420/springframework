<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.webapp.dto.*" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


                <%-- 메뉴 내용 부분 --%>
                
                	 <c:forEach var="board" items="${list}">
									 <div class="alert alert-primary">
									 			
											<div>${board.bno}</div>
											<div>${board.btitle}</div>
											<div>${board.bcontent}</div>
											<div>${board.bwriter}</div>			
										
										</div>
									 </c:forEach>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
									 