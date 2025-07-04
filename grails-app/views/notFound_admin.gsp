<!doctype html>
<html class="h-full">
<head>
    <title>Page Not Found</title>
    <meta name="layout" content="cms-layout">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
</head>
<body>
<div class="h-full flex justify-center items-center">
    <ul class="errors">
        <li class="text-4xl font-bold text-red-600 text-center">Sorry Page Not Found (404)</li>
        <li class="text-lg mt-4">Path: ${request.forwardURI}</li>
    </ul>
    <button>

    </button>
</div>
</body>
</html>
