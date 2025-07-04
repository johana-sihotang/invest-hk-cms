<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 28/06/2025
  Time: 18:18
--%>
<h1 class="text-3xl font-bold text-start lg:text-center mb-5">Contact Us</h1>
<g:if test="${contactUs}">
    <div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th class="w-2/5 px-6 py-3">Name</th>
                <th class="w-1/5 px-6 py-3">Email</th>
                <th class="w-1/5 px-6 py-3">Tel</th>
                <th class="w-1/5 px-6 py-3">Date Published</th>
                <th class="w-2/6 px-6 py-3"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${contactUs}" var="item">
                <tr class="bg-white border-b">
                    <td class="w-2/5 px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                        ${item.firstName} ${item.lastName}
                    </td>
                    <td class="w-1/5 px-6 py-4">${item.email}</td>
                    <td class="w-1/5 px-6 py-4">${item.tel}</td>
                    <td class="w-1/5 px-6 py-4">
                        <g:formatDate date="${item.dateCreated}" format="dd MMM yyyy" />
                    </td>
                    <td class="px-6 py-4 text-right flex gap-3">
                        <button
                                type="button"
                                class="delete-btn inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-red-600 rounded hover:bg-red-700"
                                data-url="${createLink(controller: 'adminContactUs', action: 'delete', id: item.id)}"
                                data-message="Are you sure you want to delete this message?">
                            <i class="bi bi-trash3-fill text-white"></i>
                        </button>
                        
                        <g:link controller="adminContactUs" action="show" id="${item.id}" class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-emerald-600 rounded hover:bg-emerald-700">
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
    <div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th class="w-2/5 px-6 py-3">Name</th>
                <th class="w-1/5 px-6 py-3">Email</th>
                <th class="w-1/5 px-6 py-3">Tel</th>
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