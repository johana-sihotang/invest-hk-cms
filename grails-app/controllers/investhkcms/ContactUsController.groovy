package investhkcms


class ContactUsController {
    static layout = 'navbar-sidebar'

    def index() {
        render (view: "contact_us", layout: 'main')
    }

    def createContactUs() {
        def continent = Continent.list(sort: 'name', order: 'asc')
        def location = Location.list(sort: 'name', order: "asc")
        [contactUs: new ContactUs()]
        render(view: 'contact_us')
    }
}