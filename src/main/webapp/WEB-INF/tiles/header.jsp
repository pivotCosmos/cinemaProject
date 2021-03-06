<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.tablesorter.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
	integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
	integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
	crossorigin="anonymous"></script>
<style type="text/css">
#menu {
	text-align: center;
}

.aside {
	float: left
}

.navbar navbar-expand-lg {
	background-color: rgba(255, 255, 255, 0.5);
}

.container-fluid {
	height: 70px;
	background-color: rgba(255, 255, 255, 0.5);
}

.pagination {
	justify-content: center;
}

.nav-item, .d-flex {
	padding-left: 20px;
	padding-right: 20px;
}
</style>

<script type="text/javascript">
	function logout() {
		document.getElementById("logoutFrm").submit();
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row" style="position: relative;">
			<div class="col-md-8">
				<a href="${pageContext.request.contextPath}/"> <img
					src="${pageContext.request.contextPath}/img/KLJ로고.png"
					width="130px" height="100px" />
				</a>
			</div>
			<div class="col-md-4"
				style="text-align: right; position: absolute; bottom: 0; right: 0;">
				
					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="member" property="principal" /> 
						<button name="myPage" type="button"
							class="btn btn-secondary my-2 my-sm-0" title=""
							data-bs-container="body" data-bs-toggle="popover"
							data-bs-placement="right"
							data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
							data-bs-original-title="Popover Title"
							onclick="location.href='${pageContext.request.contextPath}/mypage/myPage/${member.id}'">마이페이지</button>
				&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
							<button name="join" type="button"
								class="btn btn-secondary my-2 my-sm-0" title=""
								data-bs-container="body" data-bs-toggle="popover"
								data-bs-placement="right"
								data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
								data-bs-original-title="Popover Title"
								onclick="location.href='${pageContext.request.contextPath}/member/joinForm'">회원가입</button>
				&nbsp;&nbsp;&nbsp;
					</sec:authorize>
				

				
					<sec:authorize access="isAuthenticated()">
						<button name="logout" type="button"
							class="btn btn-secondary my-2 my-sm-0" title=""
							data-bs-container="body" data-bs-toggle="popover"
							data-bs-placement="right"
							data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
							data-bs-original-title="Popover Title"
							onclick="logout()">로그아웃</button>
				&nbsp;&nbsp;&nbsp;
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
							<button name="login" type="button"
								class="btn btn-secondary my-2 my-sm-0" title=""
								data-bs-container="body" data-bs-toggle="popover"
								data-bs-placement="right"
								data-bs-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus."
								data-bs-original-title="Popover Title"
								onclick="location.href='${pageContext.request.contextPath}/member/loginForm'">로그인</button>
				&nbsp;&nbsp;&nbsp;
					</sec:authorize>
				

			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg" name="aa">
		<div class="container-fluid">



			<div class="collapse navbar-collapse" id="navbarColor03">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/cinema/movie">영화 <span
							class="visually-hidden">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/cinema/ticketing">예매</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/event">이벤트</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/board/qna">문의사항</a></li>
				<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/manager/orderList">관리</a></li>
				</sec:authorize>
					

				</ul>
				<form class="d-flex">
					<input class="form-control me-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	
	<!-- 로그아웃 -->
<form id="logoutFrm" action="${pageContext.request.contextPath}/logout" method="post" style:"display:none">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</form>
</body>
</html>