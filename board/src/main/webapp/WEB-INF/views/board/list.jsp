<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/list.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<a href="/board/registr">게시판 등록</a>
<div class="board_table_wrap">
	<div class="board_header">
		<strong>게시판</strong>
		<p>게시판 공부중입니다.</p>
	</div>
	
	<div class="board_list_wrap">
		<div class="board_list">
			<div class="top">
				<div class="bno">번호</div>
				<div class="title">제목</div>
				<div class="writer">작성자</div>
				<div class="regdate">작성일</div>
				<div class="update_date">수정일</div>
			</div>
			
			<c:forEach items="${list}" var="list">
				<div>
					<div class="bno"><c:out value="${list.bno}"/></div>
					<div class="title">
						<a class="move" href='<c:out value="${list.bno}"/>'>
							<c:out value="${list.title}"/>
						</a>					
					</div>
					<div class="writer"><c:out value="${list.writer}"/></div>
					<div class="regdate"><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></div>
					<div class="update_date"><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updatedate}"/></div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="search_wrap">
		<div class="search_area">
			<select name="type">
				<option value="" <c:out value="${pageMake.cri.type == null ? 'selected' :'' }"/>>--</option>
				<option value="T" <c:out value="${pageMake.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
				<option value="C" <c:out value="${pageMake.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
				<option value="W" <c:out value="${pageMake.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
				<option value="TC" <c:out value="${pageMake.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 + 내용</option>
				<option value="TW" <c:out value="${pageMake.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 + 작성자</option>
				<option value="TCW" <c:out value="${pageMake.cri.type eq 'TCW' ? 'selected' : ''}"/>>제목 + 내용 + 작성자</option>
			</select>
			<input type="text" name="keyword" value="${pageMake.cri.keyword}">
			<button>Search</button>
		</div>
	</div>
	
	<!-- 페이징 관련 코드 -->
	<div class="pageInfo_wrap">
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
				<!-- 이전 페이지 버튼 -->
				<c:if test="${pageMake.prev }">
					<li class="pageInfo_btn previous"><a href="${pageMake.startPage-1 }">이전</a></li>
				</c:if>
			
				<!-- 각 번호 페이지버튼 -->
				<c:forEach var="num" begin="${pageMake.startPage }" end="${pageMake.endPage }">
					<li class="pageInfo_btn ${pageMake.cri.pageNum == num ? 'active':'' }"><a href="${num}">${num}</a></li>
				</c:forEach>
				
				<!-- 다음 페이지 버튼 -->
				<c:if test="${pageMake.next }">
					<li class="pageInfo_btn next"><a href="${pageMake.endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
	
	<form id="moveForm" method="get">
		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMake.cri.amount }">
		<input type="hidden" name="keyword" value="${pageMake.cri.keyword }">
		<input type="hidden" name="type" value="${pageMake.cri.type }">
	</form>

<script>
$(document).ready(function(){
    
    let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "registr success"){
            alert("게시글 등록이 완료되었습니다.");
        }
        
        if(result === "update success"){
        	alert("수정이 완료되었습니다.")
        }
        
        if(result === "delete success"){
        	alert("삭제가 완료되었습니다.")
        }
    }    
    
});

	let moveForm = $("#moveForm");
	
	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+ "'>");
		moveForm.attr("action", "/board/get");
		moveForm.submit();
	});
	
	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/list");
		moveForm.submit();
		
	});
	
	// 검색버튼 작동 js 코드
    $(".search_area button").on("click", function(e) {
    e.preventDefault();
    let type = $(".search_area select").val();
    let keyword = $(".search_area input[name='keyword']").val();

    // 검색 종류와 검색어 모두가 비어있는 경우
    if (!type && !keyword) {
        moveForm.find("input[name='type']").val('');
        moveForm.find("input[name='keyword']").val('');
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
        return;
    }
    // 검색어가 비어있는 경우
    if (!keyword) {
        alert("키워드를 입력하세요.");
        return false;
    }
    // 검색 종류를 선택하지 않은 경우
    if (!type) {
        alert("검색 종류를 선택하세요.");
        return false;
    }

    moveForm.find("input[name='type']").val(type);
    moveForm.find("input[name='keyword']").val(keyword);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
});

	$(".search_area input[name='keyword']").on("keypress", function(e) {
    	if (e.which === 13) { // Enter 키 눌렀을 때
        	e.preventDefault();
        	let type = $(".search_area select").val();
        	let keyword = $(".search_area input[name='keyword']").val();

        // 검색 종류와 검색어 모두가 비어있는 경우
        if (!type && !keyword) {
            moveForm.find("input[name='type']").val('');
            moveForm.find("input[name='keyword']").val('');
            moveForm.find("input[name='pageNum']").val(1);
            moveForm.submit();
            return;
        }
        // 검색어가 비어있는 경우
        if (!keyword) {
            alert("키워드를 입력하세요.");
            return false;
        }
        // 검색 종류를 선택하지 않은 경우
        if (!type) {
            alert("검색 종류를 선택하세요.");
            return false;
        }

        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    }
});
	
</script>
</body>
</html>