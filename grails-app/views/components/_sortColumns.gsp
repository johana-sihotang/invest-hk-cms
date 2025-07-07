<g:link action="${actionName}" params="${params + [sort: sort, order: (params.sort == sort && params.order != 'desc') ? 'desc': 'asc']}">
    ${label}
    <g:if test="${params.sort == sort}">
        <i class="bi  ${params.order == 'asc' ? 'bi-caret-up-fill' : 'bi-caret-down-fill' } ml-1"></i>
    </g:if>
</g:link>