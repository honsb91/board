<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/registr.css">
</head>
<body>
<form action="/board/registr" method="post">
	<div class="table_wrap">
		<div class="table_title">
			<Strong>게시판</Strong>
			<p>게시판 프로젝트 공부중입니다.</p>
		</div>
	</div>
	
	<div class="table_registr_wrap">
		<div class="table_registr">
			<div class="title">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" name="title" placeholder="제목입력"></dd>
				</dl>
			</div>
			
			<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd><input type="text" name="writer" placeholder="작성자 입력"></dd>	
					</dl>
					
			</div>
			
			<div class="content">
				<textarea name="content" placeholder="내용입력"></textarea>
			</div>
			
		</div>
	</div>
	
	<button class="btn">등록</button>
</form>
</body>
</html>