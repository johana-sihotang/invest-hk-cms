<h1 class="text-3xl font-bold text-start md:text-center mb-5">News</h1>

<g:link controller="adminNews" action="createNews"
        class="inline-block mb-5 px-5 py-2.5 text-sm font-medium text-white text-center bg-slate-700 rounded-lg hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300">
    Add News
</g:link>

<g:if test="${news}">
<div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
    <table class="w-full text-sm text-left text-gray-500">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50">
        <tr>
            <th class="w-2/5 px-6 py-3">Title</th>
            <th class="w-1/5 px-6 py-3">Location</th>
            <th class="w-1/5 px-6 py-3">Content Type</th>
            <th class="w-1/5 px-6 py-3">Date Published</th>
            <th class="w-2/6 px-6 py-3"><span class="sr-only">Action</span></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${news}" var="item">
            <tr class="bg-white border-b">
                <td class="w-2/5 px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                    ${item.title}
                </td>
                <td class="w-1/5 px-6 py-4">${item.location}</td>
                <td class="w-1/5 px-6 py-4">${item.contentType?.name}</td>
                <td class="w-1/5 px-6 py-4">
                    <g:formatDate date="${item.publicationDate}" format="dd MMM yyyy" />
                </td>
                <td class="px-6 py-4 text-right flex gap-3">
                    <g:link controller="adminNews" action="edit" id="${item.id}" class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-blue-600 rounded hover:bg-blue-700">
                        <i class="bi bi-pencil-square mr-2 text-white"></i>
                        Edit
                    </g:link>

                    <g:link controller="adminNews" action="delete" id="${item.id}" class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-red-600 rounded hover:bg-red-700"
                    onclick="return confirm('Are you sure you want delete this news?')">
                        <i class="bi bi-trash3-fill text-white"></i>
                    </g:link>

                    <g:link controller="adminNews" action="show" id="${item.id}" class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-emerald-600 rounded hover:bg-emerald-700">
                        <i class="bi bi-eye-fill mr-2 text-white"></i>
                        Detail
                    </g:link>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
</g:if>
<g:else>
    <p>No Data Found</p>
</g:else>