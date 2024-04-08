<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 조회</title>
<link rel="stylesheet" href="/resources/css/board/get.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<!-- 게시판 헤더부분 -->
	<div class="board_table_wrap">
		<div class="board_header">
			<strong>게시판</strong>
			<p>게시판 프로젝트 공부중입니다.</p>
		</div>
		
		<!-- 게시판 제목 -->
		<div class="board_get_wrap">
			<div class="board_get">
				<div class="title">
					<c:out value="${pageInfo.title}"/>
				</div>
			</div>
		
		
		<!-- 게시판 info 부분 -->
		<div class="board_info">
			<dl>
				<dt>작성자</dt>
				<dd><c:out value="${pageInfo.writer}"/></dd>
			</dl>
			<dl>
				<dt>등록일</dt>
				<dd><fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/></dd>
			</dl>
		</div>
		
		<!-- 게시판 내용 -->
		<div class="board_content">
			<c:out value="${pageInfo.content}"/>
		</div>
	</div>
	
	
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록으로</a>
		<a class="btn" id="update_btn">수정하기</a>
	</div>
	</div>
	
	<form id="infoForm" action="/board/update" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>

<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#update_btn").on("click", function(e){
		form.attr("action", "/board/update");
		form.submit();
	});
</script>
</body>
</html>