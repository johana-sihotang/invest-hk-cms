package investhkcms

import grails.plugin.springsecurity.annotation.Secured


class AdminContactUsController {
    static layout = "cms-layout"

    ContactUsService contactUsService

    @Secured(['ROLE_ADMIN'])
    def index() {
        List<ContactUs> contactUs = contactUsService.getAllContactUs()
        render(view: '/adminContactUs/index', model: [contactUs: contactUs])
    }

    @Secured(['ROLE_ADMIN'])
    def show(Long id) {
        ContactUs contactUs = contactUsService.getContactUsById(id)
        if (!contactUs) {
            flash.error = "Contact Us not found"
            redirect(action: 'index')
            return
        }
        render(view: '/adminContactUs/show', model: [contactUs: contactUs])
    }

    @Secured(['ROLE_ADMIN'])
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