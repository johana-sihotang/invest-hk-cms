package investhkcms

class UiTagLib {
    static namespace = "ui"

    def sortableColumn = { attrs, body ->
        def sort = attrs.sort
        def label = attrs.label
        def currentSort = params.sort
        def currentOrder = params.order ?: "asc"

        def newOrder = (currentSort == sort && currentOrder == "asc") ? "desc" : "asc"

        def cssClass = "inline-flex items-center gap-1 text-xl"
        def icon = ""

        if (currentSort == sort) {
            icon = currentOrder == "asc" ?
                    '<i class="bi bi-caret-up-fill text-gray-900"></i>' :
                    '<i class="bi bi-caret-down-fill text-gray-900"></i>'
        } else {
            icon = '<i class="bi bi-caret-up text-gray-400"></i>'
        }

        out << "<a href='?sort=${sort}&order=${newOrder}' class='${cssClass}'>${label} ${icon}</a>"
    }
}
