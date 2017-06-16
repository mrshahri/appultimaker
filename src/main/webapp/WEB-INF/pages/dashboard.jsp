<%--
  Created by IntelliJ IDEA.
  User: Rakib
  Date: 6/2/2017
  Time: 1:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Ultimaker App Dashboard</title>

    <style>
        input{
            width:200px;
            height:200px;
            border-radius: 10%;
            object-fit: cover;
        }
        .wrapper {
            text-align: center;
            display: inline-block;
            position: absolute;
            top: 30%;
            left: 30%;
        }
    </style>

    <script>
        function gotoDevice() {
            window.location.href="${deviceOperationUrl}";
        }
        function gotoComponent() {
            window.location.href="${componentOperationUrl}";
        }
    </script>
</head>
<body>
<div class="wrapper">
        <input type="image" src="https://maker13.com/wp-content/uploads/2017/04/Ultimaker-2-Extended-2-600x600.jpg"
               onclick="gotoDevice()"  />
        <input type="image" src="https://3dprinterreviewsite.com/wp-content/uploads/2016/03/ultimaker-2-2.jpg"
               onclick="gotoComponent()"  />
    </div>
</div>
</body>
</html>
