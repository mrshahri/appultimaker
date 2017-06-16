<html>
<head>

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
    function changePage() {
        window.location.href="${nextUrl}";
    }
</script>

<div class="wrapper">
    <h3>Ultimaker App</h3>
    <input type="image" src="http://www.popular3dprinters.com/wp-content/uploads/2014/01/ultimaker_2_3d_printer-300x300.jpg"
           onclick="changePage()"  />
</div>
</body>
</html>