<!doctype html>
<html class="h-full">
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="error-layout">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
<div class="mt-10 flex justify-center items-center">
    <ul class="errors">
        <li class="text-4xl font-bold text-red-600 text-center">404 Page Not Found
        <span class="block text-black text-lg !font-normal mt-4">The requested URL was not found on this server. You can return to our homepage</span></li>
    </ul>
    <script>
        setTimeout(function () {
            window.location.href = "/";
        }, 4000);
    </script>

</div>
</body>
</html>
