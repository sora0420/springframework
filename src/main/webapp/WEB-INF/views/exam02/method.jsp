<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="/WEB-INF/views/common/header.jsp" %>

							<div class="alrer alert-primary">
								현재 요청 방식: <span id="method">${method}</span>
							</div>
							<h5>&lt;form&gt; 이용</h5>
                <%-- 메뉴 내용 부분 --%>
                method.jsp
                <hr/>
                <form method="get" action="method3" class="mb-2 d-inline-block"> <!-- 절대경로 : /webapp/exam02/method1 -->            	
										<input class="btn btn-success btn-sm" type="submit" value="GET 전송">
										</form>
								<form method="post" action="method3" class="mb-2 d-inline-block"> <!-- 절대경로 : /webapp/exam02/method1 -->            	
										<input class="btn btn-success btn-sm" type="submit" value="POST 전송">
										</form>
								
								<form method="put" action="method3" class="mb-2 d-inline-block"> <!-- 절대경로 : /webapp/exam02/method1 -->            	
										<input class="btn btn-success btn-sm" type="submit" value="PUT 전송">
										</form>
								<form method="delete" action="method3" class="mb-2 d-inline-block"> <!-- 절대경로 : /webapp/exam02/method1 -->            	
										<input class="btn btn-success btn-sm" type="submit" value="DEL 전송">
										</form>
							
							
								<hr/>
								<h5>&lt;AJAX&gt; 이용</h5>
								<button class="btn btn-info btn-sm" onclick="sendGet()">AJAX GET 방식 요청</button>
								<script>
									const sendGet = () =>{
										$.ajax({url:"method3", method:"get"})
										.then(data =>{
											console.log("ajaxsuccess1");
											$("#method").html(data.method);
										});
									};
								</script>
								
								<button class="btn btn-info btn-sm" onclick="sendPost()">AJAX POST 방식 요청</button>
								<script>
									const sendPost = () =>{
										$.ajax({url:"ajaxmethod3", method:"post"})
										.then(data =>{
											$("#method").html(data.method);
										});
									};
								</script>
								
								<button class="btn btn-info btn-sm" onclick="sendPut()">AJAX PUT 방식 요청</button>
								<script>
									const sendPut = () =>{
										$.ajax({url:"ajaxmethod3", method:"put"})
										.then(data =>{
											$("#method").html(data.method);
										});
									};
								</script>
								
								<button class="btn btn-info btn-sm" onclick="sendDelete()">AJAX DELETE 방식 요청</button>
								<script>
									const sendDelete = () =>{
										$.ajax({url:"ajaxmethod3", method:"delete"})
										.then(data =>{
											$("#method").html(data.method);
										});
									};
								</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>