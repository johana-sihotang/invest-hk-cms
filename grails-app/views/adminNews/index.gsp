
<%
    def offset = params.int('offset') ?: 0
%>
<h1 class="title">News</h1>

<div class="container-add-search">
    <g:link controller="adminNews" action="createNews"
            class="btn-add">
        Add News
    </g:link>
        <g:form controller="adminNews" action="index" method="get" class="search">
            <label for="search" class="sr-only">Search News</label>
            <input type="text" name="search" id="search" value="${ params.search ?: ''}" placeholder="Search"
                   class="input-search">
            <button type="submit"
                    class="btn-search">
                <i class="bi bi-search"></i>
            </button>
        </g:form>
</div>

<g:if test="${news}">
<div class="container_table">
    <table class="table">
        <thead class="table-head">
        <tr>
            <th class="table-head-cell-no">No</th>
            <th class="table-head-cell-name">
                <ui:sortableColumn label="Title" sort="title" />
            </th>
            <th class="table-head-cell">
                <ui:sortableColumn label="Location" sort="location.name" />
            </th>
            <th class="table-head-cell-name">
                <ui:sortableColumn label="Content Type" sort="contentType.name" />
            </th>
            <th class="table-head-cell">
                <ui:sortableColumn label="Author" sort="author" />
            </th>
            <th class="table-head-cell-name">
                <ui:sortableColumn label="Date Published" sort="publicationDate" />
            </th>
            <th class="table-head-cell"><span class="sr-only">Action</span></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${news}" var="item" status="i">
            <tr class="table-row">
                <td class="table-head-cell-no">${offset + i + 1}</td>
                <td class="table-head-cell-name">
                    ${item.title}
                </td>
                <td class="table-head-cell">${item.location}</td>
                <td class="table-head-cell">${item.contentType?.name}</td>
                <td class="table-head-cell">${item.author?.username}</td>
                <td class="table-head-cell">
                    <g:formatDate date="${item.publicationDate}" format="dd MMM yyyy" />
                </td>
            <td class="table-head-cell-action">
                <div class="flex gap-2">
                    <ui:actionButton
                            icon="bi bi-pencil-square"
                            type="edit"
                            href="${createLink(controller: 'adminNews', action: 'edit', id: item.id)}"
                            title="Edit"
                            ariaLabel="Edit news" />

                    <ui:actionButton
                            icon="bi bi-eye-fill"
                            type="show"
                            href="${createLink(controller: 'adminNews', action: 'show', id: item.id)}"
                            title="View"
                            ariaLabel="View news" />

                    <ui:actionButton
                            icon="bi bi-trash3-fill"
                            type="delete"
                            href="${createLink(controller: 'adminNews', action: 'delete', id: item.id)}"
                            title="Delete"
                            ariaLabel="Delete news"
                            username="${item.id}"
                            message="Are you sure you want to delete this?" />

                </div>
            </td>
        </tr>
        </g:each>
        </tbody>
    </table>
</div>
</g:if>
<g:else>
    <div class="container_table">
        <table class="table">
            <thead class="table-head">
            <tr>
                <th class="table-head-cell-no">No</th>
                <th class="table-head-cell-name">Title</th>
                <th class="table-head-cell">Location</th>
                <th class="table-head-cell">Content Type</th>
                <th class="table-head-cell-name">Date Published</th>
                <th class="table-head-cell"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
                <tr class="table-row">
                    <td class="table-head-cell-not-found" colspan="6">No Data Found</td>
                </tr>
            </tbody>
        </table>
    </div>
</g:else>
<g:render template="/components/paginationAdmin"/>
