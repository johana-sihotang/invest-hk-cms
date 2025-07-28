<%--
  Created by IntelliJ IDEA.
  User: johan
  Date: 20/07/2025
  Time: 11:52
--%>

%{--<g:if test="${total > 0}">--}%
%{--    <div class="pagination">--}%
%{--        <g:paginate controller="adminNews" action="index" total="${total}" params="${params}" maxsteps="5" max="5" />--}%
%{--    </div>--}%
%{--</g:if>--}%


%{--<g:set var="maxVal" value="${params.max ? params.max.toInteger() : 10}" />--}%
%{--<g:if test="${total > 0}">--}%
%{--    <g:if test="${total > maxVal}">--}%
%{--        <div class="pagination">--}%
%{--            <g:paginate--}%
%{--                    total="${total}"--}%
%{--                    params="${params}"--}%
%{--                    max="${maxVal}"--}%
%{--                    controller="adminNews"--}%
%{--                    action="index"--}%
%{--            />--}%
%{--        </div>--}%
%{--    </g:if>--}%
%{--    <g:else>--}%
%{--        <div class="pagination">--}%
%{--            <span class="prevLink">Previous</span>--}%
%{--            <span class="currentStep">1</span>--}%
%{--            <span class="nextLink">Next</span>--}%
%{--        </div>--}%
%{--    </g:else>--}%
%{--</g:if>--}%

<g:set var="maxVal" value="${params.max ? params.max.toInteger() : 10}"/>
<g:set var="currentPage" value="${params.offset ?( params.offset.toInteger() / maxVal) + 1 : 1}"/>
<g:set var="totalPages" value="${Math.ceil(total / maxVal).toInteger()}"/>
<div class="pagination">
    <g:if test="${currentPage > 1}">
        <g:link controller="adminNews" action="index" params="${params + [offset: (currentPage - 2) * maxVal]}">
            <span class="prevLink"> <i class="bi bi-chevron-compact-left icon-pagination"></i> Previous</span>
        </g:link>
    </g:if>
    <g:else>
        <span class="prevLink disabled">
            <i class="bi bi-chevron-compact-left icon-pagination"></i>
            Previous
        </span>
    </g:else>

    <g:each in="${1..Math.max(1, totalPages)}" var="pageNum">
        <g:if test="${pageNum == currentPage}">
            <span class="currentStep">${pageNum}</span>
        </g:if>
        <g:else>
            <g:link class="step" controller="adminNews" action="index" params="${params + [offset: (pageNum - 1) * maxVal]}">
                ${pageNum}
            </g:link>
        </g:else>
    </g:each>

    <g:if test="${currentPage < totalPages}">
        <g:link controller="adminNews" action="index" params="${params + [offset: (currentPage) * maxVal]}">
            <span class="nextLink">Next
                <i class="bi bi-chevron-compact-right icon-pagination"></i></span>
        </g:link>
    </g:if>
    <g:else>
        <span class="nextLink disabled">
            Next <i class="bi bi-chevron-compact-right icon-pagination"></i>
        </span>
    </g:else>
</div>
<div class="">
    <g:each in="${totalPages}" var="pageCount">
        <span class="totalCount">Show ${params.offset ? (params.offset.toInteger()  + 1) : 1} to ${Math.min((params.offset ? params.offset.toInteger() : 0) + maxVal, total)} of ${total}</span>
    </g:each>
</div>
