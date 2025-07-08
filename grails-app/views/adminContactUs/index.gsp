<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 28/06/2025
  Time: 18:18
--%>
<h1 class="title">Contact Us</h1>
<g:if test="${contactUs}">
    <div class="container_table">
        <table class="table">
            <thead class="table-head">
            <tr>
                <th class="table-head-cell-name">
                    <ui:sortableColumn label="Name" sort="name" />
                </th>
                <th class="table-head-cell">
                    <ui:sortableColumn label="Email" sort="email" />
                </th>
                <th class="table-head-cell">
                    <ui:sortableColumn label="Tel" sort="tel" />
                </th>
                <th class="table-head-cell">
                    <ui:sortableColumn label="Date Published" sort="dateCreated"/>
                </th>
                <th class="table-head-cell"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${contactUs}" var="item">
                <tr class="bg-white border-b">
                    <td class="table-head-cell-name">
                        ${item.firstName} ${item.lastName}
                    </td>
                    <td class="table-head-cell">${item.email}</td>
                    <td class="table-head-cell">${item.tel}</td>
                    <td class="table-head-cell">
                        <g:formatDate date="${item.dateCreated}" format="dd MMM yyyy" />
                    </td>
                    <td class="table-head-cell-action">
                        <ui:actionButton
                                icon="bi bi-eye-fill"
                                type="show"
                                href="${createLink(controller: 'adminContactUs', action: 'show', id: item.id)}"
                                title="View"
                                ariaLabel="View Contact Us" />

                        <ui:actionButton
                                icon="bi bi-trash3-fill"
                                type="delete"
                                href="${createLink(controller: 'adminContactUs', action: 'delete', id: item.id)}"
                                title="Delete"
                                ariaLabel="Delete Contact Us"
                                username="${item.id}"
                                message="Are you sure you want to delete this?" />
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
                <th class="table-head-cell-name">Name</th>
                <th class="table-head-cell">Email</th>
                <th class="table-head-cell">Tel</th>
                <th class="table-head-cell">Date Published</th>
                <th class="table-head-cell"><span class="sr-only">Action</span></th>
            </tr>
            </thead>
            <tbody>
            <tr class="bg-white border-b">
                <td class="table-head-cell-not-found" colspan="6">No Data Found</td>
            </tr>
            </tbody>
        </table>
    </div>
</g:else>