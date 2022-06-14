<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
</head>
<body>
<h1>매출 조회 중입니다.</h1>
<div class="card text-white bg-secondary mb-3" style="max-width: 70rem;">
  <div class="card-header">
	<ul class="nav nav-pills">
	  <li class="nav-item">
	    <a class="nav-link active" href="#">전체 매출</a>
	  </li>
	  <li class="nav-item">
    	<a class="nav-link" href="${pageContext.request.contextPath}/manager/salesByMovie">영화별 매출</a>
  	  </li>
  	</ul>
  </div>
  <div class="card-body">
	<ul class="nav nav-pills" style="float:right">
	  <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">--옵션 선택--</a>
		<div class="dropdown-menu">
		  <a class="dropdown-item" href="#">월별</a>
		  <a class="dropdown-item" href="javaScript:yearly()">연도별</a>
		</div>
	  </li>
	</ul>
	<p>
    <p class="card-text">
    	<canvas id="myChart"></canvas>
    </p>
  </div>
</div>

<script type="text/javascript">
//setup시작
var DATA_COUNT = 0;
const NUMBER_CFG = {count: DATA_COUNT, min: 0, max: 100};

var labels = new Array();
<c:forEach items="${requestScope.monthlySalesList}" var="item" varStatus="status">
	labels.push("${status.count}월");
	DATA_COUNT = DATA_COUNT + 1;
</c:forEach>

var monthlySalesArr = new Array();
var foodSalesArr = new Array();
var movieSalesArr = new Array();
<c:forEach items="${requestScope.monthlySalesList}" var="item">
	monthlySalesArr.push("${item.total_Price}");
	foodSalesArr.push("${item.food_Price}");
	movieSalesArr.push("${item.movie_Price}");
</c:forEach>


const data = {
  labels: labels,
  datasets: [
    {
      label: '먹거리매출',
      data: foodSalesArr,
      borderColor: 'rgb(255, 99, 132)',
      backgroundColor: 'rgb(255, 99, 132)',
      type: 'bar'
    },
    {
      label: '영화매출',
      data: movieSalesArr,
      borderColor: 'rgba(54, 162, 235, 1)',
      backgroundColor: 'rgba(54, 162, 235, 1)',
      type: 'bar'
    },
    {
      label: '월매출 총액',
      data: monthlySalesArr,
      borderColor: 'rgba(75, 192, 192, 1)',
      backgroundColor: 'rgba(75, 192, 192, 1)',
      fill: false,
      type: 'line'
    }
  ]
};
//setup끝

//config시작
const config = {
  type: 'line',
  data: data
};//config끝

const myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );
</script>

</body>
</html>