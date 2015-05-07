<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sds.icto.vo.GuestBook"%>
<%@page import="com.sds.icto.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	GuestBookDao dao = new GuestBookDao();
	ArrayList<GuestBook> list = (ArrayList<GuestBook>) dao
			.selectAllList();
	System.out.println(list.size());
	String msg = (String) request.getAttribute("msg");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<%
		if (msg != null) {
	%>
	<%=msg%>

	<%
		}
	%>
	<form action="add.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br>
	<%
		for (int i = 0; i < list.size(); i++) {
	%>
	<table width=510 border=1>
		<tr>
			<td>[<%=list.get(i).getNo()%>]
			</td>
			<td><%=list.get(i).getName()%></td>
			<td><%=list.get(i).getReg_date()%></td>
			<td><a href="deleteform.jsp?id=<%=list.get(i).getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=list.get(i).getMessage()%></td>
		</tr>
	</table>
	<br>
	<%
		}
	%>
</body>
</html>