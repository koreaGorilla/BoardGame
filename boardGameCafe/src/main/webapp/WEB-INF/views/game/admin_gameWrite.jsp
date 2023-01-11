<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게임 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div class="page-main">
	<!-- header include -->
	<div class="content-main">
		<h2>게임 등록</h2>
		<form action="write.do" method="post" id="write_form" enctype="multipart/form-data">
			<ul>
				<li>
					<label>게임표시여부</label>
					<input type="radio" name="pro_status" value="1" id="status1">미표시
					<input type="radio" name="pro_status" value="2" id="status2">표시
				</li>
				<li>
					<label for="name">게임이름</label>
					<input type="text" name="pro_name" id="pro_name" maxlength="20">
				</li>
				<li>
					<label for="price">가격</label>
					<input type="number" name="pro_price" id="pro_price" min="1" max="99999">
				</li>
				<li>
					<label for="picture">게임 이미지</label>
					<input type="file" name="pro_picture" id="pro_picture" 
													accept="image/gif,image/pnp,image/jpeg">
				</li>
				<li><!-- 라디오 박스..? -> int로 변경 필요-->
					<label for="pro_level">게임 난이도</label>
					<input type="text" name="pro_level" id="pro_level" maxlength="5">
				</li>
				<li>
					<label for="pro_count">게임 인원</label>
					<input type="number" name="pro_count" id="pro_count" min="1" max="20">
				</li>
				<li><!-- text타입...? -> String으로 변경필요 -->
					<label for="">게임 설명</label>
					<textarea rows="5" cols="30" name="explanation" id="explanation"></textarea>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="목록으로" onclick="location.href='gameAdmin.do'">
			</div>
		</form>
	</div>
</div>
</body>
</html>
