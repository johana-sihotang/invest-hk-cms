package investhkcms


class ErrorController {
    def notFound() {
        String uri = request.forwardURI ?: request.requestURI

        if (uri?.startsWith("/admin")) {
            render(view: "/notFound_admin")
        } else {
            render(view: "/notFound_user")
        }
    }
}