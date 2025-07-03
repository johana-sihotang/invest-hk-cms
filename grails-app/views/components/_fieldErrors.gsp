<g:if test="${bean?.hasErrors()}">
    <g:eachError bean="${bean}" var="error">
        <div class="text-red-600 text-sm mt-1">
            <g:message error="${error}" />
        </div>
    </g:eachError>
</g:if>
