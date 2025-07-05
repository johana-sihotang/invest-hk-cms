package investhkcms


class ErrorController {

    def notFound() {
        String uri = request.forwardURI ?: request.requestURI ?: ''
        String referer = request.getHeader("referer") ?: ''
        String fullPath = uri + referer

        boolean isAdminPage = fullPath.contains("/admin")

        if (isAdminPage) {
            render(view: "/notFound_admin")
        } else {
            render(view: "/notFound_user")
        }
    }
}

