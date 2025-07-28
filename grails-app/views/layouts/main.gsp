<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
    <g:layoutTitle default="Grails"/>
    </title>

    %{--font--}%
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap" rel="stylesheet">

    %{--font awasome--}%
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    %{--tailwind cdn--}%
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="main.css"/>
    <asset:stylesheet src="news_landing.css"/>
    <asset:stylesheet src="pagination.css"/>
    <g:layoutHead/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>

<body>
<g:render template="/components/humburger_menu"/>
<g:render template="/components/header"/>
<g:render template="/components/alert"/>
<div class="mb-10">
    <g:layoutBody/>
</div>
<g:render template="/components/card"/>
<g:render template="/components/footer"/>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<asset:javascript src="application.js"/>
<asset:javascript src="header.js"/>
<asset:javascript src="humburger_menu.js"/>
<asset:javascript src="alert.js"/>
<!--disble continent select-->
<asset:javascript src="disable_continent_select.js"/>
<asset:javascript src="slicker.js"/>
</body>
</html>