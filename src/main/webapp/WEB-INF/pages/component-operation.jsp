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
    <title>Operate Component of Ultimaker Device</title>

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

<script>
    function myFunction() {
        // get operation id
        var x = document.getElementById("mySelect").value;
        // do page transition - call another REST service
        var url = 'http://uaf132854.ddns.uark.edu:8100/app-ultimaker/component-parameters?operationId=' + x;
        window.location.href = url;
        //$.get(url, {operationId : x}, function(data, status){});
    }
</script>

<div class="wrapper">
    <p>
    <h5>Select Operation: </h5>
    <select id="mySelect" onchange="myFunction()">
        <c:forEach var="operation" items="${operations}">
            <option value="${operation.operationId}">${operation.operationId}</option>
        </c:forEach>
    </select>
    </p>
</div>
</body>
</html>
