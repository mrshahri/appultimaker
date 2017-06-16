<%@ page import="com.cpmc.ultikamer.model.DeviceOperation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Rakib
  Date: 5/31/2017
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Operate Ultimaker Device</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
        .wrapper {
            text-align: center;
            display: inline-block;
            position: absolute;
            top: 25%;
            left: 35%;
        }
    </style>
</head>
<body>

<%
    String operationId = null;
    DeviceOperation operation = null;
%>

<script>
    function myFunction() {
        var operationId = document.getElementById("mySelect").value;
        var url = 'http://uaf132854.ddns.uark.edu:8100/app-ultimaker/device-parameters?operationId=' + operationId;
        window.location.href = url;
    }
</script>

<div class="wrapper">
    <h5>Select Operation: </h5>
    <select id="mySelect" onchange="myFunction()">
        <c:forEach var="operation" items="${operations}">
            <option value="${operation.operationId}">${operation.operationId}</option>
        </c:forEach>
    </select>
</div>
</body>
</html>
