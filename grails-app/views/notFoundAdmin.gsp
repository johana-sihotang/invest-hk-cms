<!DOCTYPE html>
<html lang="en" class="h-full">
<head>
    <meta charset="UTF-8">
    <meta name="layout" content="external-layout"/>
    <title>Page Not Found</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800 h-full flex items-center justify-center font-[Outfit]">

<!-- Wrapper -->
<div class="flex flex-col lg:flex-row items-center justify-center gap-8 px-6 py-10 max-w-6xl mx-auto">

    <div class="w-64 md:w-80 lg:w-96 flex-shrink-0">

        <asset:image src="/sad-emoji.webp"
                     alt="Sad Emoji"
                     class="w-full block lg:hidden"/>


        <asset:image src="/Oops!-404-Error-robot-cuate.svg"
                     alt="404 Robot"
                     class="w-full hidden lg:block"/>
    </div>

    <div class="text-center lg:text-left max-w-xl">
        <h1 class="text-4xl lg:text-6xl font-bold text-red-600 mb-4">Oops! Page Not Found (404)</h1>

        <p class="text-gray-700 text-lg mb-4">${flash.error ?: 'The page you are looking for could not be found.'}</p>
        <p class="text-sm text-gray-500 italic mb-6">
            Path: ${request.forwardURI}
        </p>
        <a href="javascript:history.back()"
           class="inline-block mt-4 px-6 py-3 bg-red-600 hover:bg-red-700 text-white text-lg font-medium rounded transition">
            ← Back to Previous Page
        </a>


    </div>


</div>

</body>
</html>
