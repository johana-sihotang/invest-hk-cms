package investhkcms


class AdminContactUsController {
    static layout = "navbar-sidebar"

    ContactUsService contactUsService

    def index() {
        List<ContactUs> contactUs = contactUsService.getAllContactUs()
        render(view: '/adminContactUs/index', model: [contactUs: contactUs])
    }

    def show(Long id) {
        ContactUs contactUs = contactUsService.getContactUsById(id)
        if (!contactUs) {
            flash.error = "Contact Us not found"
            redirect(action: 'index')
            return
        }
        render(view: '/adminContactUs/show', model: [contactUs: contactUs])
    }

    def delete(Long id){
        try{
            contactUsService.deleteContactUs(id)
            flash.success = "Contact Us deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting Contact Us: ${e.message}"
        }
        redirect(action: 'index')
    }
}