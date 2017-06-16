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
    <title>Ultimaker Operations</title>
</head>
<body>

<script>
    function myFunction() {
            var x = document.getElementById("mySelect").value;
    }
</script>


<p>
<h5>Select Device Operation: </h5>
<select id="mySelect" onchange="myFunction()">
    <c:forEach var="operation" items="${operations.deviceOperations}">
        <option value="${operation.operationId}">${operation.operationId}</option>
    </c:forEach>
    <c:forEach var="componentOperation" items="${operations.componentOperations}">
        <option value="${componentOperation.operationId}">${componentOperation.operationId}</option>
    </c:forEach>
</select>
</p>
<p id="demo"></p>
<p>
    <input type="button" value="Operate"/>
</p>
</body>
</html>
