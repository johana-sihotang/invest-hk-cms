<h1 class="text-3xl font-bold text-start lg:text-center mb-5">News</h1>

<div class="flex justify-between items-center">
    <g:link controller="adminNews" action="createNews"
            class="inline-block mb-5 px-5 py-2.5 text-sm font-medium text-white text-center bg-[#d7271d] rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300">
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
                    <g:link controller="adminNews" action="edit" id="${item.id}"
                            class="inline-flex items-center justify-center px-3 py-1.5 text-sm font-medium text-slate-600 bg-white border border-slate-300 rounded-md shadow-sm hover:bg-slate-100 hover:text-slate-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-400 transition"
                            aria-label="Edit news with ID ${item.id}" title="Edit">
                        <i class="bi bi-pencil-square text-slate-700" aria-hidden="true"></i>
                        <span class="sr-only">Edit</span>
                    </g:link>


                    <g:link controller="adminNews"
                            action="delete"
                            id="${item.id}"
                            class="inline-flex items-center justify-center px-3 py-1.5 text-sm font-medium text-red-600 bg-white border border-red-300 rounded-md shadow-sm hover:bg-red-50 hover:text-red-800 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-400 transition delete-btn"
                            data-message="Are you sure you want to delete this news?"
                            data-url="${createLink(controller: 'adminNews', action: 'delete', id: item.id)}"
                            aria-label="Delete news with ID ${item.id}" title="Delete">
                        <i class="bi bi-trash3-fill text-red-600" aria-hidden="true"></i>
                        <span class="sr-only">Delete</span>
                    </g:link>


                    <g:link controller="adminNews" action="show" id="${item.id}"
                            class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-emerald-600 rounded hover:bg-emerald-700"
                            aria-label="View details of news with ID ${item.id}" title="View Detail">
                        <i class="bi bi-eye-fill text-white" aria-hidden="true"></i>
                        <span class="sr-only">View Detail</span>
                    </g:link>
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