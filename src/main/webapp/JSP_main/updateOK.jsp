<%@page import="com.tjoeun.service.FreeboardService"%>
<%@page import="com.tjoeun.vo.FreeboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
//	update.jsp에서 넘어오는 수정할 글번호, 수정 후 돌아갈 페이지 번호, 수정하기 위해서 입력한 비밀번호,
//	수정할 내용(제목, 내용, 공지글)을 받는다.
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.tjoeun.vo.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	FreeboardService service = FreeboardService.getInstance();
//	수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교하기 위해 수정할 글을 얻어온다.
	FreeboardVO original = service.selectByIdx(vo.getIdx());

//	수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교해서 같으면 글을 수정한 후 목록으로 돌아가고
	out.println("<script>");
	service.update(vo);
	out.println("alert('" + vo.getIdx() + "번 글 수정완료!!!')");
	out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>

</body>
</html>




