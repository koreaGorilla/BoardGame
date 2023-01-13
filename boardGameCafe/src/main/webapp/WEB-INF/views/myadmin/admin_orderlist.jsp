<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_0g.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="main-title">
		마이페이지
	</div>
	<div class="main-content">
		<button id="btn01" value="주문조회" onclick="location.href='orderList.do'">주문조회</button>
		<button id="btn01" value="예약조회" onclick="location.href='resList.do'">예약조회</button>
		<button id="btn01" value="회원정보" onclick="location.href='memList.do'">회원정보</button>
	</div>
	<div>
		<h3>주문목록</h3>
		<c:if test="${count == 0}">
	   		<div>
	    	  주문내역이 없습니다.
	   		</div>
   		</c:if>
  		<c:if test="${count > 0}">
  			전체 주문수 : ${count}
  			<table>
			<tr>
				<th>번호</th>
				<th>주문상품명</th>
				<th>주문자명</th>
				<th>주문일자</th>
				<th>총 가격</th>
				<th>배송상태</th>
			</tr>
			<c:forEach var="order" items="${list}">
			<tr>
				<td>${order.rownum}</td>
				<td><a href="orderdetail.do?order_main_num=${order.order_main_num}">${order.order_main_name}</a></td>
				<td>${order.mem_name}</td>
				<td>${order.order_main_date}</td>
				<td>${order.order_main_total}</td>
				<td>
				<c:if test="${order.status == 1}">
					결제완료
				</c:if>
				<c:if test="${order.status == 2}">
					배송준비중
				</c:if>
				<c:if test="${order.status == 3}">
					배송중
				</c:if>
				<c:if test="${order.status == 4}">
					배송완료
				</c:if>
				<c:if test="${order.status == 5}">
					환불
				</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		   <div>
		      ${pagingHtml}
		   </div>
   		</c:if>
	</div>
</body>
</html>