package investhkcms


class ContactUsController {
    static layout = 'main'

    def index() {
        render (view: "contact_us")
    }
}