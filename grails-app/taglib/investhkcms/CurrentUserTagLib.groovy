package investhkcms

class CurrentUserTagLib {
    static defaultEncodeAs = 'raw'
    def springSecurityService

    static namespace = "cu"

    def currentAdmin = { attrs, body ->
        def admin = springSecurityService.currentUser
        out << (admin ? body(admin) : "")
    }
}
