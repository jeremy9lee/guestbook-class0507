<%@page import="com.sds.icto.dao.GuestBookDao"%>
<%@page import="java.util.List"%>
<%@page import="com.sds.icto.vo.GuestBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	GuestBookDao dao = new GuestBookDao();

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	System.out.print(password);
	System.out.print(id);
	if (password.equals(dao.search(Integer.parseInt(id)).getPassword())) {
		dao.delete(Integer.parseInt(id));
		response.sendRedirect("/guestbook");
	} else {
		String message = "삭제에 실패했습니다. 비밀번호를 확인해주세요";
		request.setAttribute("msg", message);
		request.getRequestDispatcher("index.jsp").forward(request,
				response);
	}
%>