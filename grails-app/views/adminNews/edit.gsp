<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 25/06/2025
  Time: 10:40
--%>
<div class="container">
    <h1 class="text-3xl text-start md:text-center font-bold mb-5">Edit "${news.title}"</h1>

<g:hasErrors bean="${request}">
    <div class="alert alert-danger">
        <ul>
            <g:eachError bean="${news}" var="error">
                <li><g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </div>
</g:hasErrors>

<g:form controller="adminNews" action="update" method="POST" enctype="multipart/form-data">
    <g:hiddenField name="id" value="${news?.id}" />
    <div class="grid gap-6 mb-6 md:grid-cols-2">
        <div>
            <label for="article_title" class="label-title">Title</label>
            <input name="title" type="text" id="article_title"
                   class="input-title"
                   placeholder="Title" value="${request?.title ?: news?.title}"
                   required/>
        </div>

        <div>
            <label for="subTitle" class="label-title">Sub Title</label>
            <input name="subTitle" type="text" id="subTitle"
                   class="input-title"
                   placeholder="Sub Title" value="${request?.subTitle ?: news?.subTitle}"
                   required/>
        </div>
    </div>

    <div class="my-6">
        <label for="content" class="label-title">Content</label>
        <textarea name="content" id="content" rows="4" class="input-title" placeholder="Content">${request?.content ?: news?.content}</textarea>
    </div>

    <div class="container-grid-three">
        <div class="container-column-select">
            <label for="locations" class="label-title">Location</label>
            <select name="locationId"
                    class="select-location" id="locations">
                <g:each in="${locations}" var="item">
                    <option value="${item.id}"
                        ${item.id?.toString() == (request?.locationId?.toString() ?: news?.location?.id?.toString()) ? 'selected' : ''}>
                        ${item.name}
                    </option>
                </g:each>
            </select>
        </div>

        <div class="container-column-select">
            <label for="contentType" class="label-title">Content Type</label>
            <select name="contentTypeId"
                    class="select-location" id="contentType">
                <g:each in="${contentType}" var="item">
                    <option value="${item.id}"
                        ${item.id?.toString() == (request?.contentTypeId?.toString() ?: news?.contentType?.id?.toString()) ? 'selected' : ''}>
                        ${item.name}
                    </option>
                </g:each>
            </select>
        </div>

        <div class="container-column-select">
            <label for="industry" class="label-title">Industry</label>
            <select name="industryId"
                    class="select-location" id="industry">
                <g:each in="${industries}" var="item">
                    <option value="${item.id}"
                        ${item.id?.toString() == (request?.industryId?.toString() ?: news?.industry?.id?.toString()) ? 'selected' : ''}>
                        ${item.name}
                    </option>
                </g:each>
            </select>
        </div>

    </div>

    <div class="flex gap-6 flex-col">
        <g:render template="/components/dropzone" model="[imageUrl: request?.image ?: news?.image]" />
        <div>
            <label for="imageCaption" class="label-title">Image Caption</label>
            <input name="imageCaption" type="text" id="imageCaption"
                   class="input-title"
                   placeholder="Image Caption" value="${request?.imageCaption ?: news?.imageCaption}"
                   required/>
        </div>
    </div>
    </div>
    <div class="flex gap-5">
        <button type="submit"
                class="btn-submit">Update
        </button>
        <g:link controller="adminNews" action="index" class="btn-cancel">
            Cancel
        </g:link>
    </div>
</g:form>