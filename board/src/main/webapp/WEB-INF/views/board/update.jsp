<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 조회</title>
<link rel="stylesheet" href="/resources/css/board/update.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<!-- 게시판 헤더부분 -->
	<form id="updateForm" action="/board/update" method="post">
	<div class="board_table_wrap">
		<div class="board_header">
			<strong>게시판</strong>
			<p>게시판 프로젝트 공부중입니다.</p>
		</div>
		
		<!-- 게시판 제목 -->
		<div class="board_get_wrap">
			<div class="board_get">
				<div class="bno">
					<dl>
						<dd style="display: none;">
							<input type="text" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
						</dd>	
					</dl>
				</div>
			
				<div class="title">
				<dl>
					<dt>제목</dt>
					<dd><input type="text" name="title" value='<c:out value="${pageInfo.title}"/>'></dd>
				</dl>	
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
			<textarea name="content"><c:out value="${pageInfo.content}"/></textarea>
		</div>
	</div>
	
	
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
        <a class="btn" id="update_btn">수정 완료</a>
        <a class="btn" id="cancel_btn">수정 취소</a>
        <a class="btn" id="delete_btn">삭제</a>
	</div>
	</div>
	</form>
	
	<form id="infoForm" action="/board/update" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>'>
		<input type="hidden" name="type" value="${cri.type }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form>

<script>

	let form = $("#infoForm");        // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)

	// 목록 페이지 이동 버튼
	$("#list_btn").on("click", function(e){
    	form.find("#bno").remove();
    	form.attr("action", "/board/list");
    	form.submit();
	});

	// 수정 하기 버튼
	$("#update_btn").on("click", function(e){
		 $("#updateForm").submit();
	});

	// 취소 버튼
	$("#cancel_btn").on("click", function(e){
    	form.attr("action", "/board/get");
    	form.submit();
	}); 
	
	// 삭제 버튼 클릭
	$("#delete_btn").on("click", function(e) {
	    if (confirm("정말 삭제하시겠습니까?")) {
	    	$("#updateForm").attr("action", "/board/delete");
            $("#updateForm").attr("method", "post");
            $("#updateForm").submit();
	    }
	});
</script>
</body>
</html>