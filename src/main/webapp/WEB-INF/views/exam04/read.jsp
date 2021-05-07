<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="/WEB-INF/views/common/header.jsp" %>

 <div>
   <div class="alert alert-success">
      게시물 내용
   </div>
           <div class="form-group">
          <label for="bno">번호</label>
          <input type="text" class="form-control" value="${board.bno}" readonly>
        </div>
   
        <div class="form-group">
          <label for="btitle">제목</label>
          <input type="text" class="form-control" value="${board.btitle}" readonly>
        </div>
        
        <div class="form-group">
          <label for="bcontent">내용</label>
          <input type="text" class="form-control" value="${board.bcontent}" readonly>
        </div>
        
        <div class="form-group">
          <label for="bwriter">글쓴이</label>
          <input type="text" class="form-control" value="${board.bwriter}" readonly>
        </div>
        
        <div class="form-group">
          <label for="bdate">날짜</label>
          <input type="text" class="form-control" value='<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/>' readonly>
        </div>

        <div class="form-group">
          <label for="bhitcount">조회수</label>
          <input type="text" class="form-control" value="${board.bhitcount}" readonly>
        </div>
        
        <div class="mb-3">
           <label>첨부파일</label> <br/>
           <c:if test="${board.battachoname != null}">
           		<a href="downloadAttach?bno=${board.bno}">
              <img src="downloadAttach?bno=${board.bno}" width="200"/>
              </a>
           </c:if>
        </div>
        
        <div>
           <a class="btn btn-primary btn-sm" href="list">목록</a>
           <c:if test="${loginUid != board.bwriter}">
	           <a class="btn btn-primary btn-sm" href="updateForm?bno=${board.bno}">수정</a>
	           <a class="btn btn-danger btn-sm" href="delete?bno=${board.bno}">삭제</a>
           </c:if>
           
        </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 