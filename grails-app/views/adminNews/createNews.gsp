<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 25/06/2025
  Time: 10:40
--%>
<div class ="justify-items-center bg-sky-400">

<div class="container w-1/2  ">

    <h1 class="text-3xl text-start md:text-center font-bold mb-5">Create News</h1>

    <g:hasErrors bean="${news}">
        <div class="alert alert-danger">
            <ul>
                <g:eachError bean="${news}" var="error">
                    <li><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>

<g:form controller="adminNews" action="save" method="POST" enctype="multipart/form-data">
    <div class="grid gap-6 mb-6 md:grid-cols-2">
        <div>
            <label for="article_title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
            <input name="title" type="text" id="article_title"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   placeholder="Title" required/>
        </div>

        <div>
            <label for="subTitle" class="block mb-2 text-sm font-medium text-gray-900">Sub Title</label>
            <input name="subTitle" type="text" id="subTitle"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   placeholder="Sub Title" required/>
        </div>
    </div>

    <div class="my-6">
        <label for="content" class="block mb-2 text-sm font-medium text-gray-900">Content</label>
        <textarea name="content" id="content" rows="4"
                  class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 min-h-42 w-full"
                  placeholder="Content"></textarea>
    </div>

    <div class="grid gap-6 mb-6 md:grid-cols-2">
        <div>
            <g:render template="/components/input_selected" model="[
                    label        : 'Location',
                    name         : 'locationId',
                    options      : locations,
                    optionKey    : 'id',
                    optionValue  : 'name',
                    selectedValue: news?.location?.id
            ]"/>
        </div>

        <div>
            <g:render template="/components/input_selected" model="[
                    label        : 'Content Type',
                    name         : 'contentTypeId',
                    options      : contentType,
                    optionKey    : 'id',
                    optionValue  : 'name',
                    selectedValue: news?.contentType?.id
            ]"/>
        </div>

        <div>
            <g:render template="/components/input_selected" model="[
                    label        : 'Industry',
                    name         : 'industryId',
                    options      : industries,
                    optionKey    : 'id',
                    optionValue  : 'name',
                    selectedValue: news?.industry?.id
            ]"/>
        </div>
    </div>

    <div class="flex gap-6 flex-col">
        <g:render template="/components/dropzone"/>
        <div>
            <label for="imageCaption" class="block mb-2 text-sm font-medium text-gray-900">Image Caption</label>
            <input name="imageCaption" type="text" id="imageCaption"
                   class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                   placeholder="Image Caption" required/>
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
