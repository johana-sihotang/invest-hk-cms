<!doctype html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin | CMS</title>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">

    <g:layoutHead/>

    <!-- CSS Pertama -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>
    <link href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css" rel="stylesheet" />

    <!-- Tailwind CSS -->
    <asset:stylesheet src="tailwind-built.css"/>

    <!--SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!--Select2-->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    %{--Text Editor Tiny--}%
    <script src="https://cdn.tiny.cloud/1/efa5um0ipuy2f437nmvmq6gfsdax3f439y8h3ncxee6zc1ud/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
</head>
<body class="bg-slate-100">
<g:render template="/components/navbar"/>
<g:render template="/components/sidebar"/>
<g:render template="/components/alert"/>
<div class="container-layout">
    <g:layoutBody/>
</div>

<!-- JavaScript di akhir body -->
<asset:javascript src="alert.js"/>
<asset:javascript src="image_preview.js"/>
<asset:javascript src="confirm_delete.js"/>
<asset:javascript src="select2.js"/>
<script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
<script>
    tinymce.init({
        selector: 'textarea:not(.tinymce-disabled)',
        plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
        toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
    });
</script>
</body>
</html>