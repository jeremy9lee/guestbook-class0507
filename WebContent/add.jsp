<%@page import="com.sds.icto.vo.GuestBook"%>
<%@page import="com.sds.icto.dao.GuestBookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	GuestBookDao dao = new GuestBookDao();

	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String content = request.getParameter("content");

	dao.add(new GuestBook(name, pass, content));

	response.sendRedirect("/guestbook");
%>
