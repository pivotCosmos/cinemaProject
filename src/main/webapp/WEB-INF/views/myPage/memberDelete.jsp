<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style type="text/css">
.mb-3 {
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
		<div class="container">
			<div class="alert alert-dismissible alert-warning">
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
				<h4 class="alert-heading">신중히 생각해주세요!</h4>
				<p class="mb-0">
					탈퇴하면 모든 기록이 사라집니다</a>.
				</p>
			</div>

			<div class="card border-warning mb-3"
				style="max-width: 40rem; text-align: center;">
				<div class="card-header">회원 탈퇴</div>
				<div class="card-body">
					<p class="card-text"></p>
					<form action="${pageContext.request.contextPath}/member/delete"
						method="post">
						<input type="hidden" value="${member.password}" name="pwd">

						<div class="form-group">
							<label for="exampleInputId1" class="form-label mt-4">아이디</label>
							<input type="id" class="form-control" id="id" name="id"
								aria-describedby="idHelp" value="${member.id}"
								readonly="readonly"> <small id="idHelp"
								class="form-text text-muted">We'll never share your
								email with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1" class="form-label mt-4">비밀번호</label>
							<input type="password" class="form-control" name="password"
								id="password" placeholder="비밀번호를 입력해주세요.">

						</div>
						<div class="form-group">
							<label for="exampleInputName1" class="form-label mt-4">이름</label>
							<input type="text" class="form-control" name="name" id="name"
								value="${member.name}">

						</div>
						<br>

						<h4 class="card-title"></h4>


						<div>

							<button type="submit" class="btn btn-secondary" id="submit">회원 탈퇴</button>
							<button type="button" class="cancel btn btn-warning" id="reset">취소</button>
						</div>
						<br>
					</form>

					<div style="color:orange;">
						<c:if test="${msg==false}">
  							비밀번호가 맞지 않습니다.
  						</c:if>

					</div>

				</div>



			</div>
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

<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$("#reset").on("click", function() {

			location.href = "/";

		})

		$("#submit").on("click", function() {
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
		});

	})
	
	
	
</script>
</html>