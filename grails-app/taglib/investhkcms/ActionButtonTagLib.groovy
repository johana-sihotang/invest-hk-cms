package investhkcms

class ActionButtonTagLib {
    static namespace = "ui"

    def actionButton = { attrs ->
        def icon = attrs.icon ?: ""
        def href = attrs.href
        def title = attrs.title ?: ""
        def ariaLabel = attrs.ariaLabel ?: title
        def type = attrs.type ?: "show"
        def username = attrs.username
        def message = attrs.message ?: "Are you sure?"

        def className = attrs.className ?: (
                type == "delete" ? "btn-delete" :
                        type == "edit" ? "btn-edit" :
                                "btn-show"
        )

        if (type == "delete" && username) {
            out << """
                <form method="POST" action="${href}" class="custom-delete-form" data-message="${message}" style="display:inline;">
                    <input type="hidden" name="username" value="${username}"/>
                    <button type="submit"
                        class="${className}"
                        aria-label="${ariaLabel}"
                        title="${title}">
                        <i class="${icon}" aria-hidden="true"></i>
                        <span class="sr-only">${title}</span>
                    </button>
                </form>
            """
        } else {
            out << """
                <a href="${href}" class="${className}" aria-label="${ariaLabel}" title="${title}">
                    <i class="${icon}" aria-hidden="true"></i>
                    <span class="sr-only">${title}</span>
                </a>
            """
        }
    }
}

