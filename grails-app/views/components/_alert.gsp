<g:if test="${flash.success}">
    <div id="flash-alert" class="fixed top-4 right-4 z-50 flex items-center p-4 mb-4 text-green-800 rounded-lg bg-green-100 shadow-lg transition-opacity duration-300" role="alert">
        <i class="bi bi-check-circle-fill shrink-0 w-4 h-4 mr-2"></i>
        <div class="text-sm font-medium">
            ${flash.success}
        </div>
    </div>
</g:if>

<g:if test="${flash.error}">
    <div id="flash-alert" class="fixed top-4 right-4 z-50 flex items-center p-4 mb-4 text-red-800 rounded-lg bg-red-100 shadow-lg transition-opacity duration-300" role="alert">
        <i class="bi bi-exclamation-circle-fill shrink-0 w-4 h-4 mr-2"></i>
        <div class="text-sm font-medium">
            ${flash.error}
        </div>
    </div>
</g:if>
