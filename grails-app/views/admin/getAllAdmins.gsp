<!doctype html>
<html lang="en" class="h-screen">
<!--begin::Head-->
<head>
    <meta name="layout" content="cms-layout"/>
    <title>Admin | CMS</title>
    <asset:stylesheet src="tailwind.css"/>
</head>

<body>
<div class="title-add-btn">
    <h1 class="title">Admin</h1>
    <g:render template="register"/>
</div>
<g:if test="${adminList}">
    <div class="container_table">
        <table class="table">
            <thead class="table-head">
            <tr>
                <th class="table-head-cell-no">No</th>
                <th class="table-head-cell-name">Name</th>
                <th class="table-head-cell">Username</th>
                <th class="table-head-cell">Email</th>
                <th class="table-head-cell">Status</th>
                <th class="table-head-cell"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${adminList}" var="item" status="i">
                <tr class="table-row">
                    <th class="table-head-cell-no">${i + 1}</th>
                    <td class="table-head-cell-name table-data">
                        ${item.name}
                    </td>
                    <td class="table-head-cell">${item.username}</td>
                    <td class="table-head-cell">${item.email}</td>
                    <td class="table-head-cell">
                        <g:if test="${item.status == 'ACTIVE'}">
                            <span class="status-active">
                                <i class="bi bi-record-fill"></i>
                                <span>Active</span>
                            </span>
                        </g:if>

                        <g:else>
                            <span class="status-inactive">
                                <i class="bi bi-record-fill"></i>
                                <span>Inactive</span>
                            </span>
                        </g:else>

                    </td>
                    <td class="container_action">
                        <ui:actionButton
                                icon="bi bi-trash3-fill"
                                type="delete"
                                href="${createLink(controller: 'admin', action: 'deleteAdmin')}"
                                title="Delete"
                                ariaLabel="Delete admin with username: ${item.username}"
                                username="${item.username}"
                                message="Are you sure you want to delete this admin?" />

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
                <th class="table-head-cell-name">Name</th>
                <th class="table-head-cell">Username</th>
                <th class="table-head-cell">Email</th>
                <th class="table-head-cell">Status</th>
                <th class="table-head-cell"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <tr class="table-row">
                <td class="px-6 py-4" colspan="6">No Data Found</td>
            </tr>
            </tbody>
        </table>
    </div>
</g:else>
</body>
</html>
