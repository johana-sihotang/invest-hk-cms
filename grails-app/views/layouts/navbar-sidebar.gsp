<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin | CMS</title>
    <g:layoutHead/>

    <!-- CSS Pertama -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<g:render template="/components/navbar"/>
<g:render template="/components/sidebar"/>
<div class="pt-20 ml-0 sm:ml-64 px-4">
    <g:layoutBody/>
</div>

<!-- JavaScript di akhir body -->
<asset:javascript src="alert.js"/>
<asset:javascript src="image_preview.js"/>
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
</body>
</html>