<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 25/06/2025
  Time: 10:40
--%>
<div class ="container-item-center">

<div class="container-center">

    <h1 class="title">Create News</h1>

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
    <div class="container-grid-two">
        <div>
            <label for="article_title" class="label-title">Title</label>
            <input name="title" type="text" id="article_title"
                   class="input-title"
                   placeholder="Title" required/>
        </div>

        <div>
            <label for="subTitle" class="label-title">Sub Title</label>
            <input name="subTitle" type="text" id="subTitle"
                   class="input-title"
                   placeholder="Sub Title" required/>
        </div>
    </div>

    <div class="my-6">
        <label for="content" class="label-title">Content</label>
        <textarea name="content" id="content" rows="4"
                  class="input-title"
                  placeholder="Content"></textarea>
    </div>

    <div class="container-grid-three">
        <div class="container-column-select">
            <label for="locations" class="label-title">Location</label>
            <select name="locations"
                    class="select-location" id="locations">
                <g:each in="${locations}" var="items">
                    <option value="${items.id}">${items.name}</option>
                </g:each>
            </select>
        </div>

        <div class="container-column-select">
            <label for="contentType" class="label-title">Content Type</label>
            <select name="contentTypeId"
                    class="select-location" id="contentType">
                <g:each in="${contentType}" var="items">
                    <option value="${items.id}">${items.name}</option>
                </g:each>
            </select>
        </div>

        <div class="container-column-select">
            <label for="industries" class="label-title">Location</label>
            <select name="industryId"
                    class="select-location" id="industries">
                <g:each in="${industries}" var="items">
                    <option value="${items.id}">${items.name}</option>
                </g:each>
            </select>
        </div>
    </div>

    <div class="flex gap-6 flex-col">
        <g:render template="/components/dropzone"/>
        <div>
            <label for="imageCaption" class="label-title">Image Caption</label>
            <input name="imageCaption" type="text" id="imageCaption"
                   class="input-title"
                   placeholder="Image Caption" required/>
        </div>
    </div>
    </div>
    <div class="flex gap-5">
        <button type="submit"
                class="btn-submit">Submit
        </button>
        <g:link controller="adminNews" action="index" class="btn-cancel">
            Cancel
        </g:link>
    </div>
</g:form>
</div>

