<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Rakib
  Date: 5/31/2017
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Parameters and Values</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>
        function sendParameters() {
            var parametersObj = {deviceId: "${deviceId}", operationId: "${operationId}", parameters: []};
            var parameters = [];
            <c:forEach var="parameter" items="${parameters}">
            parameters.push({
                id: "${parameter.id}", name: "", type: "value",
                value: document.getElementById("${parameter.id}").value, restAttributes: {}
            });
            <%--parametersObj.parameters["${parameter.id}"] = document.getElementById("${parameter.id}").value;--%>
            </c:forEach>
            parametersObj.parameters = parameters;
            var requestBody = JSON.stringify(parametersObj);
            $.ajax({
                type: 'POST',
                url: "${postUrl}",
                data: requestBody,
                success: function (data) {
                    alert('data: ' + data);
                },
                contentType: "application/json",
                dataType: 'json'
            });
        }
    </script>

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
<div class="wrapper">
    <p>
    <h5>Operation Id: </h5>
    <input type="text" disabled="disabled" name="${operationId}" value="${operationId}" id="${operationId}"/>
    </p>
    <c:forEach var="parameter" items="${parameters}">
        <p>
        <h5>${parameter.name} (${parameter.type}) :</h5>
        <input type="text" name="${parameter.id}" id="${parameter.id}"/>
        </p>
    </c:forEach>

    <p>
        <input type="submit" value="Submit" onclick="sendParameters()"/>
    </p>
</div>
</body>
</html>
