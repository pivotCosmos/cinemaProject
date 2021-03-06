<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
<style type="text/css">
.mb-3{
 	margin: auto;
}

.nav-item{
	margin: auto;
}
</style>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<body>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="sessionMember" property="principal" />
		<script type="text/javascript">
		
		
						
				if("${member.id}"!="${sessionMember.id}"){
				
					alert('본인만 접속할 수 있습니다.');
					location.href="${pageContext.request.contextPath}/";
				
				}			
			
		</script>
	<div class="col-sm-6, container" style="text-align: center;">
			<h1>My Page</h1>
			<br>
			
			<ul class="nav nav-pills" style="width: 400px; margin: auto;">
				<li class="nav-item"><a name="btn" value="order"
					class="nav-link active" href="#">예매내역</a></li>
				<li class="nav-item"><a name="btn" value="review"
					class="nav-link" href="${pageContext.request.contextPath}/board/myReview/${member.id}">후기</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-haspopup="true" aria-expanded="false">회원정보</a>
					<div class="dropdown-menu" style="">
						<a class="dropdown-item" name="btn" value="update"
							href="${pageContext.request.contextPath}/mypage/updateForm/${member.id}">수정</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" name="btn" value="delete"
							href="${pageContext.request.contextPath}/mypage/memberDelete/${member.id}">탈퇴</a>
					</div></li>
			</ul>
	<br>
	
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">예매 코드</th>
	      <th scope="col">예매 상태</th>
	      <th scope="col">예매 내용</th>
	      <th scope="col">결제 일시</th>
	      <th scope="col">결제 금액</th>
	      <th scope="col">회원 아이디</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:choose>
	  		<c:when test="${empty member.orderList}">
	  			<tr>
	  				<td colspan="5">예매 내역이 없습니다.</td>
	  			</tr>
	  		</c:when>
	  		<c:otherwise>
	  			<c:forEach items="${member.orderList}" var="order">
				    <tr class="table-active">
				      <th scope="row"><a href="/manager/orderDetail/${order.orderCode}">${order.orderCode}</a></th>
				      <td>
				        <c:choose>
			    		<c:when test="${order.orderState==0}">
			    			결제 완료
			    		</c:when>
			    		<c:when test="${order.orderState==1}">
			    			환불 요청
			    		</c:when>
			    		<c:when test="${order.orderState==2}">
			    			환불 완료
			    		</c:when>
			    		</c:choose>
				      </td>
				      <td>${order.movieOrderline[0].seatPerformance.time.movie.movieName}
				      	<c:if test="${not empty order.foodOrderline}">
				      		<c:forEach items="${order.foodOrderline}" varStatus="status">
				      		외 ${status.count}건
				      		</c:forEach>
				      	</c:if>
				      </td>
				      <td>
				      	<fmt:parseDate value="${order.orderDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="orderDate"/>
	    				<fmt:formatDate value="${orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				      <td>${order.totalPrice}</td>
				      <td>
				      	${order.member.id}
				      </td>
				    </tr>
			    </c:forEach>
	  		</c:otherwise>
	  	</c:choose> 
	  </tbody>
	</table>
	</div>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<script type="text/javascript">
			$(function(){			
					
				alert('로그인 후 접속할 수 있습니다.');
				location.href="${pageContext.request.contextPath}/";
			
			})
		</script>
	
	</sec:authorize>

</body>
</html>