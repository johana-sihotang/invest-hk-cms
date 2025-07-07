<h1 class="text-3xl font-bold text-start lg:text-center mb-5">News</h1>

<div class="flex justify-between items-center">
    <g:link controller="adminNews" action="createNews"
            class="btn-add">
        Add News
    </g:link>

    <div class="flex justify-end mb-4">
        <g:form controller="adminNews" action="index" method="get" class="flex gap-2">
            <input type="text" name="search" value="${params.search}" placeholder="Search"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-200">
            <button type="submit"
                    class="px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700">
                Search
            </button>
        </g:form>
    </div>
</div>

<g:if test="${news}">
<div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50">
        <tr>
            <th class="w-10 px-4 py-3">No</th>
            <th class="w-2/5 px-6 py-3">
                <ui:sortableColumn label="Title" sort="title" />
            </th>
            <th class="w-1/5 px-6 py-3">
                <ui:sortableColumn label="Location" sort="location.name" />
            </th>
            <th class="w-1/5 px-6 py-3">
                <ui:sortableColumn label="Content Type" sort="contentType.name" />
            </th>
            <th class="w-1/5 px-6 py-3">
                <ui:sortableColumn label="Author" sort="author.username" />
            </th>
            <th class="w-1/5 px-6 py-3">
                <ui:sortableColumn label="Date Published" sort="publicationDate" />
            </th>
            <th class="w-2/6 px-6 py-3"><span class="sr-only">Action</span></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${news}" var="item" status="i">
            <tr class="bg-white border-b">
                <td class="w-10 px-6 py-4">${i + 1}</td>
                <td class="px-6 py-4 font-medium text-gray-900 whitespace-normal break-words max-w-xs md:max-w-md">
                    ${item.title}
                </td>
                <td class="w-1/5 px-4 py-4">${item.location}</td>
                <td class="w-1/5 px-6 py-4">${item.contentType?.name}</td>
                <td class="w-1/5 px-6 py-4">${item.author?.username}</td>
                <td class="w-1/5 px-6 py-4">
                    <g:formatDate date="${item.publicationDate}" format="dd MMM yyyy" />
                </td>
            <td class="px-6 py-4">
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
        <div class="mt-4">
            <g:paginate controller="adminNews" action="index" total="${total}" params="${params}" />
        </div>

    </table>
</div>
</g:if>
<g:else>
    <div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th class="w-10 px-4 py-3">No</th>
                <th class="w-2/5 px-6 py-3">Title</th>
                <th class="w-1/5 px-6 py-3">Location</th>
                <th class="w-1/5 px-6 py-3">Content Type</th>
                <th class="w-1/5 px-6 py-3">Date Published</th>
                <th class="w-2/6 px-6 py-3"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
                <tr class="bg-white border-b">
                    <td class="w-10 px-6 py-4" colspan="6">No Data Found</td>
                </tr>
            </tbody>
        </table>
    </div>
</g:else>