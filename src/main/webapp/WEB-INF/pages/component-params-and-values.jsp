<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            var componentOpObj = {
                deviceId: "${operation.deviceId}", uuid: "${operation.uuid}",
                parentComponentId: "${operation.parentComponentId}",
                componentId: "${operation.componentId}", componentName: "${operation.componentName}",
                component: "${operation.component}", operationId: "${operation.operationId}",
                componentValue: document.getElementById("componentValue").value, category: "${operation.category}",
                type: "${operation.type}", name: "${operation.name}", parameters: {}
            };
            var requestBody = JSON.stringify(componentOpObj);
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
    <input type="text" disabled="disabled" name="${operation.operationId}" value="${operation.operationId}"/>
    </p>
    <p>
    <h5>Component Value: </h5>
    <input type="text" id="componentValue" name="${operation.componentValue}" value="${operation.componentValue}"/>
    </p>

    <input type="submit" value="Submit" onclick="sendParameters()"/>
</div>
</body>
</html>
