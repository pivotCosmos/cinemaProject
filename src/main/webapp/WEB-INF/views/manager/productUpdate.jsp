<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 수정하기 페이지 입니다.</h1>
	
	<form>
	  <fieldset>
		<div class="form-group">
		
		    <label class="form-label mt-4" for="form-label">상품명</label>
		    <input class="form-control" type="text" placeholder="상품명을 입력해주세요">
		    
		    <label class="form-label mt-4" for="readOnlyInput">상품코드</label>
		    <input class="form-control" id="readOnlyInput" type="text" readonly="">
	
		 
		</div>
	    <div class="form-group">
	      <label for="exampleTextarea" class="form-label mt-4">상품설명</label>
	      <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
	    </div>
	    <div class="form-group">
	      <label for="formFile" class="form-label mt-4">이미지</label>
	      <input class="form-control" type="file" id="formFile">
	    </div><p><p>
		
		<div class="col-lg-6 col-sm-12 text-lg-end text-center">
		  <input type="button" class="btn btn-secondary" onclick="location.href='${contextPath.reqeust.contextPath}/manager/productDetail'" value="수정하기"/>
		</div><p><p>
	  </fieldset>
	</form>
</body>
</html>