<%--
  Created by IntelliJ IDEA.
  User: fairtech
  Date: 03/07/25
  Time: 16.31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<div class ="justify-items-center bg-sky-400">

<div class="container w-1/2  ">

    <h1 class="text-3xl text-start md:text-center font-bold mb-5">Admin Dashboard</h1>

    <g:hasErrors bean="${news}">
        <div class="alert alert-danger">
            <ul>
                <g:eachError bean="${news}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

    <g:form controller="adminDashboard" action="save" method="POST" enctype="multipart/form-data">
        <div class="grid gap-6 mb-6 md:grid-cols-2">
            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>
            <div class="flex gap-2 flex-col">
                <g:render template="/components/dropzone"/>

            </div>
        </div>


        <h4 class="text-3xl text-start md:text-center font-bold mb-5">Main Title</h4>
        <div class="grid gap-6 mb-6 md:grid-cols-2">
            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>

            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>

            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>

            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>

            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>

            <div>
                <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                <input name="title" type="text" id="article_title"
                       class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                       placeholder="Title" required/>
            </div>
        </div>

        <h4 class="text-3xl text-start md:text-center font-bold mb-5">Panel News</h4>
        <div class="flex gap-5">
            <div class="f">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>

        </div>

        <div class="flex gap-5">
            <div class="f">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>
            <div class="">
                <g:render template="/components/dropzone"/>

            </div>

        </div>
        </div>
        <div class="flex gap-5">
            <button type="submit"
                    class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 mt-5 text-center">Submit
            </button>
            <g:link controller="cmsNews" action="index" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 mt-5 text-center">
                Cancel
            </g:link>
        </div>
    </g:form>
</body>
</html>
