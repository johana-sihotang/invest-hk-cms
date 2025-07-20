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
<g:set var="maxVal" value="${params.max ? params.max.toInteger() : 10}" />
<g:if test="${total > 0}">
    <g:if test="${total > maxVal}">
        <g:paginate
                total="${total}"
                params="${params}"
                max="${maxVal}"
                controller="adminNews"
                action="index"
                maxsteps="5"
        />
    </g:if>
    <g:else>
        <div class="pagination">
            <span class="prev disabled">Previous</span>
            <span class="current">1</span>
            <span class="next disabled">Next</span>
        </div>
    </g:else>
</g:if>
