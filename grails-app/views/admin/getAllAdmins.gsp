<!doctype html>
<html lang="en" class="h-screen">
<!--begin::Head-->
<head>
    <meta name="layout" content="cms-layout"/>
    <title>Admin | CMS</title>
</head>
<body >
<div class="flex justify-between">
    <h1 class="text-3xl font-bold text-start  mb-5">Admin</h1>
    <g:render template="register"/>
</div>
<g:if test="${adminList}">
    <div class="relative overflow-x-auto border border-gray-100 sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th class="w-20 px-6 py-3">No</th>
                <th class="w-2/5 px-6 py-3">Name</th>
                <th class="w-1/5 px-6 py-3">Username</th>
                <th class="w-1/5 px-6 py-3">Email</th>
                <th class="w-1/5 px-6 py-3">Status</th>
                <th class="w-2/6 px-6 py-3"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${adminList}" var="item" status="i">
                <tr class="bg-white border-b">
                    <th class="w-20 px-6 py-3">${i + 1}</th>
                    <td class="w-2/5 px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                        ${item.name}
                    </td>
                    <td class="w-1/5 px-6 py-4">${item.username}</td>
                    <td class="w-1/5 px-6 py-4">${item.email}</td>
                    <td class="w-1/5 px-6 py-4">
                        <g:if test="${item.status == 'ACTIVE'}">
                            <i class="bi bi-record-fill text-green-600"></i>
                            <span class="text-green-600">Active</span>
                        </g:if>
                        <g:else>
                            <i class="bi bi-record-fill text-red-600"></i>
                            <span class="text-red-600">Inactive</span>
                        </g:else>

                    </td>
                    <td class="px-6 py-4 text-right flex gap-3">
                        <g:link controller="admin"
                                action="deleteAdmin"
                                id="${item.username}"
                                class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-red-600 rounded hover:bg-red-700 delete-btn"
                                data-message="Are you sure you want to delete this?"
                                data-url="${createLink(controller: 'admin', action: 'deleteAdmin', id: item.username)}">
                            <i class="bi bi-trash3-fill text-white"></i>
                        </g:link>


                        <g:link controller="admin" action="edit" id="${item.username}" class="inline-flex items-center px-3 py-1 text-sm font-medium text-white bg-blue-600 rounded hover:bg-blue-700">
                            <i class="bi bi-pencil-square mr-2 text-white"></i>
                            Edit
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
</body>
</html>
