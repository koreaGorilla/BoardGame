<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 등록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style_hoon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){ //이거 쓸거면 위에 jquery링크 걸어야함 꼭
		$('#write_form').submit(function(){
			if($('input[type=radio]:checked').length<1){//radio버튼은 단일 선택. length는 1이거나 0이거나
				alert('방표시여부를 지정하세요');
				return false;
			} 
			if($('#name').val().trim()==''){ //비어있는거 인정X, 공백은 가능
				alert('방 이름을 입력하세요');
				$('#name').val('').focus();
				return false;
			}
			if($('#size').val()==''){ //공백을 인정하지 않기 때문에 trim 안씀
				alert('인원을 입력하세요');
				$('#size').focus();
				return false;
			}
			if($('#detail').val().trim()==''){ //비어있는거 인정X, 공백은 가능
				alert('방설명을 입력하세요');
				$('#detail').val('').focus();
				return false;
			}
			if($('#photo1').val()==''){ //공백을 인정하지 않기 때문에 trim 안씀
				alert('방사진1을 입력하세요');
				$('#photo1').focus();
				return false;
			}
			if($('#photo2').val()==''){ //공백을 인정하지 않기 때문에 trim 안씀
				alert('방사진2을 입력하세요');
				$('#photo2').focus();
				return false;
			}
			if($('#photo3').val()==''){ //공백을 인정하지 않기 때문에 trim 안씀
				alert('방사진3을 입력하세요');
				$('#photo3').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="content-main">
			<h2>방 등록</h2>
			<form action="write.do" method="post" id="write_form" enctype="multipart/form-data">
				<ul>
					<li>
						<label>방 표시 여부</label>
						<input type="radio" name="status" value="1" id="status1">미표시
						<input type="radio" name="status" value="2" id="status2">표시
					</li>
					<li>
						<label>방 이름</label>
						<input type="text" name="name" id="name" maxlength="10">
					</li>
					<li>
						<label>최대 인원 수</label>
						<input type="number" name="size" id="size" min="1" max="99">
					</li>
					<li>
						<label>방 설명</label>
						<textarea rows="5" cols="30" name="detail" id="detail"></textarea>
					</li>
					<li>
						<label>방 사진1</label>
						<input type="file" name="photo1" id="photo1" accept="image/gif,image/png,image/jpeg">
					</li>
					<li>
						<label>방 사진2</label>
						<input type="file" name="photo2" id="photo2" accept="image/gif,image/png,image/jpeg">
					</li>
					<li>
						<label>방 사진3</label>
						<input type="file" name="photo3" id="photo3" accept="image/gif,image/png,image/jpeg">
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="등록">
					<input type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/reserve/reserveMain.do'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>