<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<script type="text/javascript"></script>
<body>
	<div class="col-sm-6, container" style="text-align: center;">
		<h1>카드 가운데 정렬 해야함</h1>
		<form name="inForm" id="inForm" method="post" action="${pageContext.request.contextPath}/member/join">
			<div class="card border-secondary mb-3" style="max-width: 40rem;"display:inline-block;>
				<div class="card-header">회원가입</div>
				<div class="card-body">
					<h4 class="card-title">Secondary card title</h4>
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>

					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">아이디</label> 
							<input
							class="form-control form-control-lg" type="text"
							placeholder="아이디를 입력해주세요." id="id"
							name="id" onclick="idCheck()" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">비밀번호</label> 
							<input
							class="form-control form-control-lg" type="password"
							placeholder="7자 이상 영문/숫자를 입력해주세요." id="password"
							name="password" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">비밀번호 확인</label> 
							<input
							class="form-control form-control-lg" type="password"
							placeholder="비밀번호를 다시 입력해주세요." id="pwdCheck"
							name="pwdCheck" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">이름</label> 
							<input
							class="form-control form-control-lg" type="text"
							placeholder="이름을 입력해주세요." id="name"
							name="name" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">생년월일</label> 
							<input
							class="form-control form-control-lg" type="text"
							placeholder="0000-00-00 형식으로 입력해주세요." id="birth"
							name="birth" required="required">
					</div>
					
					<div class="form-group">
						<label class="col-form-label col-form-label-lg mt-4"
							for="inputLarge">연락처</label> 
							<input
							class="form-control form-control-lg" type="text"
							placeholder="000-0000-0000 형식으로 입력해주세요." id="phone"
							name="phone" required="required">
					</div>
					
					<br>
					<div>
						<button type="submit" class="btn btn-primary">회원가입 완료</button>
					</div>
					<br>
				
				</div>
			</div>
		</form>
	</div>
</body>
</html>