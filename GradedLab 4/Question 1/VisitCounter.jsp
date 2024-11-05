<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Session-Based Visit Counter</title>
</head>
<body>
    <%
        // Retrieve the "visitCount" attribute from the session
        Integer visitCount = (Integer) session.getAttribute("visitCount");

        // If "visitCount" doesn't exist, initialize it to 1
        if (visitCount == null) {
            visitCount = 1;
        } else {
            // Increment the visit count
            visitCount++;
        }

        // Store the updated visit count back in the session
        session.setAttribute("visitCount", visitCount);
    %>

    <h2>Welcome to the Visit Counter Page!</h2>
    <p>You have visited this page <%= visitCount %> time(s) during this session.</p>
</body>
</html>
