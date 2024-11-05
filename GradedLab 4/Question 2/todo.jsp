<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
    // Initialize or retrieve the list from session
    ArrayList<String> todoList = (ArrayList<String>) session.getAttribute("todoList");
    if (todoList == null) {
        todoList = new ArrayList<String>();
        session.setAttribute("todoList", todoList);
    }

    // Add item if form is submitted
    String newItem = request.getParameter("item");
    if (newItem != null && !newItem.trim().isEmpty()) {
        todoList.add(newItem);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>To-Do List</title>
</head>
<body>
    <h1>To-Do List</h1>
    <form action="todo.jsp" method="post">
        <label for="item">Add a new item:</label>
        <input type="text" id="item" name="item">
        <button type="submit">Add</button>
    </form>

    <h2>Your List</h2>
    <ul>
        <% for (String item : todoList) { %>
            <li><%= item %></li>
        <% } %>
    </ul>
</body>
</html>
